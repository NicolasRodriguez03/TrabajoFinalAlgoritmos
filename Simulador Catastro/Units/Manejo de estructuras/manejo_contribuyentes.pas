unit manejo_contribuyentes;

interface
   USES manejo_archivo_cont, unicodecrt,
    Arboles, DEFINICION_DATOS, validacion,
    MANEJO_TERRENOS, sysutils, StrUtils;

 procedure leer_clave(var tipo:boolean; var clave1:string; var clave2:string);
  PROCEDURE CARGAR_CONT(VAR X: DATOS_CONT; tipo:boolean; clave1:string; clave2:string);
  PROCEDURE ALTA_C(Var arbol:t_punt_A; var ARCH_C: ARCHIVO_C; x:boolean; clave1:string; clave2:string);
  PROCEDURE CARGAR_ARBOL (VAR ARCH_C:ARCHIVO_C; VAR ARBOL_AYN:T_PUNT_A; VAR ARBOL_DNI:T_PUNT_A);
  PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:LongInt; VAR REG:DATOS_CONT);
  procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:LongInt);
  PROCEDURE BAJA(VAR ARCH_C:ARCHIVO_C; POS:LongInt );

implementation
 procedure leer_clave(var tipo:boolean; var clave1:string; var clave2:string); // Lee la clave y el tipo al que pertenece
    var
      x:string;
    begin
      Writeln ('Desea por apellido y nombre, o por DNI? (Ingresar "nombre" o "DNI")');
      Readln (x);
      If (x='Nombre') or (x='NOMBRE') or (x='nombre') then
        begin
        tipo:=true;
        Writeln('Ingrese apellido/s');
        Readln (clave1);
        Writeln('Ingrese nombre/s');
        Readln (clave2);
        end
      else 
        if (x='DNI') OR (X='dni') then
          begin
          tipo:=false;
          Writeln ('Ingrese DNI:');
          Readln (CLAVE1);
           While not(no_contiene_letras(clave1)) do
            begin
              Writeln('DNI invalido, por favor intente denuevo');
              Readln(clave1);
            end;
          end
        else 
          leer_clave(tipo, clave1, clave2)
    end;
    
   PROCEDURE CARGAR_CONT(VAR X: DATOS_CONT; tipo:boolean; clave1:string; clave2:string);
   VAR
    AUX_DNI,AUX_TEL:word;
    BEGIN
        with (X) do
        begin
        Writeln ('Ingrese número de contribuyente');
        Readln(N_CONT);
        While not(no_contiene_letras(DNI)) do
            begin
              Writeln('N de contribuyente invalido, por favor intente denuevo');
              Readln(N_CONT);
//        if busqueda_archivo_n_cont(arch_c,n_cont)<>-1 then
  //          begin
    //          writeln('El contribuyente n° ', n_cont,' ya existe, por favor ingrese un n° de contribuyente distinto del previamente ingresado');
      //        readln (n_cont);
        //    end;
        if tipo then
            begin
            Apellido:=clave1;
            Nombre:=clave2;
            Writeln ('Ingrese DNI');
            Readln (DNI);
            While not(no_contiene_letras(DNI)) do
            begin
              Writeln('DNI invalido, por favor intente denuevo');
              Readln(DNI);
            end;
            end
        else
            begin
            Writeln ('Ingrese Apellido');
            Readln (APELLIDO);
            Writeln ('Ingrese nombre');
            Readln (nombre);
            DNI:=clave1;
            end;
        Writeln ('Ingrese dirección');
        Readln (DIREC);
        Writeln ('Ingrese ciudad');
        Readln (ciudad);
        Writeln ('Ingrese fecha de nacimiento [DD/MM/AAAA]');
        Readln (F_NAC);
        while not chequeo_fecha(f_nac) do
        begin
          WRITELN ('Fecha inválida, por favor intente nuevamente');
          readln (f_nac); 
        end;
        Writeln ('Ingrese teléfono');
        Readln (TEL);
        Writeln ('Ingrese mail');
        Readln (mail);
        WHILE not(ansicontainsstr(mail,'@')) DO
        BEGIN
          WRITELN ('Mail inválido, por favor intente nuevamente');
          readln (mail);
        END;
        ESTADO:=FALSE;
        end;
    END;
    end;

   PROCEDURE ALTA_C(Var arbol:t_punt_A; var ARCH_C: ARCHIVO_C; x:boolean; clave1:string; clave2:string);
    var
        R:DATOS_CONT; OP:STRING;
        POS:LongInt;
    begin
      CARGAR_CONT(R, x, clave1, clave2);
      writeln ('CON TOTAL SEGURIDAD DESEA COMPLETAR EL ALTA? SI/NO');
      READLN (OP);
        IF (OP='SI') OR (OP='Si') or (OP='si') then
        BEGIN
        POS:=FILESIZE(ARCH_C);
       GUARDA_DATO_C (ARCH_C,POS,R);
       END
       ELSE 
       WRITELN ('NO SE HA DADO DE ALTA EL CONTRIBUYENTE');
    end;

    PROCEDURE CARGAR_ARBOL (VAR ARCH_C:ARCHIVO_C; VAR ARBOL_AYN:T_PUNT_A; VAR ARBOL_DNI:T_PUNT_A);
    VAR R:DATOS_CONT; C,I:LONGINT; AUX_X,AUX_Y:T_DATO_ARBOL;
    begin
      ARBOL_AYN:=NIL;
      ARBOL_DNI:=NIL;
      C:=0;
      FOR I:=0 TO (FILESIZE(ARCH_C)-1) DO 
        BEGIN
        LEER_DATO_C(ARCH_C,C,R);
        AUX_X.CLAVE:= CONCAT(R.APELLIDO, ' ', R.NOMBRE);
        AUX_Y.CLAVE:= (R.DNI);
        AUX_X.POS_ARCH:= I;
        AUX_Y.POS_ARCH:= I;
        AGREGAR_ARBOL(ARBOL_AYN, AUX_X);
        AGREGAR_ARBOL(ARBOL_DNI, AUX_Y);
        C:=C+1;
        END;
    END;

    PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:LongInt; VAR REG:DATOS_CONT);
    VAR
        OP:BYTE;
        OP_2:string[2];
        AUX:string[50];
    begin
      LEER_DATO_C(ARCH_C,POS,REG);
      Writeln ('¿Qué dato desea modificar? (Ingrese nro. de dato o ingrese cualquier otra tecla para volver al menu)');
      Readln (OP);
      CASE OP OF
        1: BEGIN
             WRITELN ('ESTE DATO ES IMPOSIBLE DE MODIFICAR');
             MODIF_DATO_C (ARCH_C, POS, REG);
             END;
        2:BEGIN
           Writeln ('Desea modificar nombre? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.NOMBRE:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        3:BEGIN
          Writeln ('Desea modificar apellido? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.APELLIDO:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        4:BEGIN
          Writeln ('Desea modificar dirección? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DIREC:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
           END;
        5:BEGIN
          Writeln ('Desea modificar ciudad? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.CIUDAD:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C,POS, REG);
           END;
        6: BEGIN
            WRITELN ('ESTE DATO ES IMPOSIBLE DE MODIFICAR');
             MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        7: BEGIN
          Writeln ('Desea modificar fecha de nacimiento? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.F_NAC:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
        END;

        8:BEGIN
          Writeln ('Desea modificar nro. de telefono? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.TEL:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        9:BEGIN
          Writeln ('Desea modificar direccion de e-mail? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
              WHILE not(ansicontainsstr(AUX,'@')) DO
             BEGIN
              WRITELN ('Mail inválido, por favor intente nuevamente');
              readln (aux);
             END;
            REG.MAIL:= AUX;
            Writeln('La modificación ha sido exitosa');
            END
           ELSE
            MODIF_DATO_C (ARCH_C, POS, REG);
            END;
        10: BEGIN
            Writeln ('El estado no puede ser modificado manualmente');
            MODIF_DATO_C (ARCH_C, POS, REG);
      END;
        END;
    end;

    procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:LongInt);
    VAR DATO:DATOS_CONT;
    begin
     MOSTRAR_DATOS_C(ARCH_C, POS);
     writeln();
      MODIF_DATO_C (ARCH_C, POS, DATO);
      GUARDA_DATO_C(ARCH_C, POS, DATO);
    end;

    PROCEDURE BAJA(VAR ARCH_C:ARCHIVO_C; POS:LongInt);
    VAR
        OP,aux:STRING; reg:DATOS_CONT; X:STRING[8];
    begin
      MOSTRAR_DATOS_C(ARCH_C, POS);
      Writeln('Desea dar de baja a este contribuyente? (si/no)');
      readln(aux); // esto esta porque parece que hay un bug de Tpascal que a veces se saltea algun que otro readln
      Readln (OP);
      IF (OP='SI') OR (OP='Si') or (OP='si') then
      begin
        LEER_DATO_C(ARCH_C, POS, REG);
        REG.ESTADO:= FALSE;
        X:= REG.N_CONT;
        GUARDA_DATO_C(ARCH_C, POS, REG);
        BAJA_CONT_TER (ARCH_T, X);
      end;
    end;

end.