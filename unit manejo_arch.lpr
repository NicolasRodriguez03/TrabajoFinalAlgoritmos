unit manejo_contribuyente;

interface
uses
  unit_archivo;
  unit_arboles;
    PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE ALTA(r: DATO_CONT; var ARCH_C: ARCH_C);
    PROCEDURE CARGAR_T(VAR X: DATOS_CONT);
    PROCEDURE GUARDA_DATO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    


implementation

PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
    VAR 
        POS:CARDINAL;
        AUX:DATOS_CONT;
        AUX_X:T_DATO_ARBOL;
    begin
        POS:=0;
        WHILE NOT(EOF(ARCH_C)) DO
        begin
            SEEK(ARCH_C,POS);
            READ(ARCH_C,AUX);
            AUX_X.CLAVE:= AUX.DNI;
            AUX_X.POS_ARCH:= POS;
            AGREGAR_ARBOL(ARBOL, AUX_X);
            POS:= POS+1;
        end;
        
    end;

    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
    VAR 
        POS:CARDINAL;
        AUX:DATOS_CONT;
        AUX_X:T_DATO_ARBOL;
    begin
        POS:=0;
        WHILE NOT(EOF(ARCH_C)) DO
        begin
            SEEK(ARCH_C,POS);
            READ(ARCH_C,AUX);
            AUX_X.CLAVE:= CONCAT(AUX.APELLIDO, AUX.NOMBRE);
            AUX_X.POS_ARCH:= POS;
            AGREGAR_ARBOL(ARBOL, AUX_X);
            POS:= POS+1;
        end;
        
    end;

        PROCEDURE CARGAR_T(VAR X: DATOS_CONT);
    BEGIN
        with (X) do
        begin
            Writeln ('Ingrese numero de contribuyente:');
            Readln(N_CONT);
            Writeln ('Ingrese Apellido:');
            Readln (APELLIDO);
            Writeln ('Ingrese nombre:');
            Readln (nombre);
            Writeln ('Ingrese direccion:');
            Readln (DIREC);
            Writeln ('Ingrese ciudad');
            Readln (ciudad);
            Writeln ('Ingrese DNI:');
            Readln (DNI);
            Writeln ('Ingrese fecha de nacimiento:');
            Readln (F_NAC);
            Writeln ('Ingrese telefono:');
            Readln (TEL);
            Writeln ('Ingrese mail:');
            Readln (mail);
        end;
    END;

    PROCEDURE ALTA_C(r: DATOS_CONT; var ARCH_C: ARCH_C);
    var
    begin
      with (R) do
      begin
          GUARDAR_DATO (ARCH_C,POS,R);
          AGREGAR_ARBOL(R);
      end;
    end;

    PROCEDURE GUARDA_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    BEGIN
        SEEK(ARCH_C, POS);
        WRITE(ARCH_C, REG);
    END;

    PROCEDURE LEER_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    BEGIN
        SEEK(ARCH_C, POS);
        READ(ARCH_C, REG);
    END;

    PROCEDURE MOSTRAR_DATOS_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL; VAR REG:DATOS_CONT);
    BEGIN
    LEER_DATO(ARCH_C,POS, REG);
    WITH (DATO) DO              // DATO: DATO_CONT
    Writeln ('1) NUMERO DE CONTRIBUYENTE: ',N_CONT );
    Writeln ('2) NOMBRE: ', NOMBRE);
    Writeln ('3) APELLIDO: ',APELLIDO);
    Writeln ('4) Direccion: ', DIREC);
    Writeln ('5) Ciudad: ',ciudad);
    Writeln ('6) DNI: ', DNI);
    Writeln ('7) Nacimiento: ', F_NAC);
    Writeln ('8) Telefono: ', TEL);
    Writeln ('9) Mail: ', MAIL);     
    Writeln ('10) ESTADO: ');     
    IF ESTADO=TRUE THEN;
        Write ('ACTIVO');
    else
        Write ('INACTIVO');
    END;

    PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL; REG:DATOS_CONT);
    VAR
        OP:BYTE;
        OP_2:string[2];
        AUX:string[50];
        AUX_2:BOOLEAN[];
    begin
      Writeln ('¿Que dato desea modificar? (Ingrese nro. de dato o ingrese 0 para volver al menu)');
      Readln (OP);
      CASE OP OF
        0: // ACA VA EL PROCEDIMIENTO DE LMENU
        1: Writeln ('Desea modificar nro. de contribuyente? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.N_CONT:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        2: Writeln ('Desea modificar nombre? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.NOMBRE:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        3: Writeln ('Desea modificar apellido? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.APELLIDO:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        4: Writeln ('Desea modificar dirección? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DOMICILIO:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        5: Writeln ('Desea modificar ciudad? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.CIUDAD:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        6: Writeln ('Desea modificar DNI? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DNI:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        7: Writeln ('Desea modificar fecha de nacimiento? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.F_NAC:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        8: Writeln ('Desea modificar nro. de telefono? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.TEL:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        9: Writeln ('Desea modificar direccion de e-mail? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.MAIL:= AUX;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
        10: Writeln ('Desea modificar estado de contribuyente? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX_2);
            REG.MAIL:= AUX_2;
            END;
           ELSE
            MODIF_DATO (ARCH_C; POS; REG);
      END;
    end;
    
    procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL);
    begin
      MOSTRAR_DATOS (ARCH_C; POS, DATO);
      MODIF_DATO (ARCH_C; POS, DATO);
      GUARDAR_DATO(ARCH_C, POS; DATO);
    end;
end.