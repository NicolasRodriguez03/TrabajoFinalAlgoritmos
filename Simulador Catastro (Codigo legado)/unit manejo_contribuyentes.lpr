unit manejo_contribuyentes;

interface
    manejo_archivo_cont
    manejo_Arboles;
    MANEJO_TERRENOS;
    
 PROCEDURE ALTA_C(var ARCH_C: ARCH_C; VAR ARBOL_AYN:T_PUNT; VAR ARBOL_DNI:T_PUNT);
 PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL; REG:DATOS_CONT);
 procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL);
 PROCEDURE BAJA(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL );
 PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
 PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
end;

implementation
   PROCEDURE ALTA_C(var ARCH_C: ARCH_C; VAR ARBOL_AYN:T_PUNT; VAR ARBOL_DNI:T_PUNT);
    var
        AUX_X,AUX_Y:T_DATO_ARBOL;
        R:DATOS_CONT;
        POS:CARDINAL;
    begin
      CARGAR_CONT(R);
      POS:=FILESIZE(ARCH_C)
      GUARDAR_DATO (ARCH_C,POS,R);
      AUX_X.CLAVE:= CONCAT(R.APELLIDO, R.NOMBRE);
      AUX_Y.CLAVE:= (R.DNI);
      AUX_X.POS_ARCH:= POS;
      AUX_Y.POS_ARCH:= POS;
      AGREGAR_ARBOL(ARBOL_AYN, AUX_X);
      AGREGAR_ARBOL(ARBOL_DNI, AUX_Y);
    end;

    PROCEDURE MODIF_DATO_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL; VAR REG:DATOS_CONT; );
    VAR
        OP:BYTE;
        OP_2:string[2];
        AUX:string[50];
        AUX_2:BOOLEAN[];
    begin
      LEER_DATO_C(ARCH_C,POS,REG);
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
            MODIF_DATO_C (ARCH_C; POS; REG);
        2: Writeln ('Desea modificar nombre? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.NOMBRE:= AUX;
            
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        3: Writeln ('Desea modificar apellido? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.APELLIDO:= AUX;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        4: Writeln ('Desea modificar dirección? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DOMICILIO:= AUX;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        5: Writeln ('Desea modificar ciudad? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.CIUDAD:= AUX;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        6: Writeln ('Desea modificar DNI? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.DNI:= AUX;
            
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        7: Writeln ('Desea modificar fecha de nacimiento? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.F_NAC:= AUX;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        8: Writeln ('Desea modificar nro. de telefono? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.TEL:= AUX;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        9: Writeln ('Desea modificar direccion de e-mail? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX);
            REG.MAIL:= AUX;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
        10: Writeln ('Desea modificar estado de contribuyente? (SI/NO)');
           Readln (OP_2);
           IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
            BEGIN
            Writeln ('Ingrese nuevo dato');
            Readln (AUX_2);
            REG.MAIL:= AUX_2;
            END;
           ELSE
            MODIF_DATO_C (ARCH_C; POS; REG);
      END;
    end;
    
    procedure MODIFICACION_C(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL);
    begin
      MOSTRAR_DATOS_C(ARCH_C; POS, DATO);
      MODIF_DATO_C (ARCH_C; POS, DATO);
      GUARDAR_DATO(ARCH_C, POS; DATO);
    end;
   
    PROCEDURE BAJA(VAR ARCH_C:ARCHIVO_C; POS:CARDINAL; );
    VAR
        OP:STRING; reg=DATOS_CONT; X:STRING[8];
    begin
      MOSTRAR_DATOS_C(ARCH_C, POS);
      Writeln('Desea dar de baja a este contribuyente? (si/no)');
      Readln (OP);
      IF (OP='SI') OR (OP='Si') or (OP='si') then 
      begin
        READ(ARCH_C, REG);
        REG.ESTADO:= FALSE;
        WRITE(ARCH_C,REG);
        X:=REG.N_CONT;
        BAJA_CONT_TER ( ARCH_T; X);
      end;
    end;

    PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
    VAR 
        POS:CARDINAL;
        AUX:DATOS_CONT;
        AUX_X:T_DATO_ARBOL;
    begin
        POS:=0;
        crear_abrir_C(ARCH_C);
        WHILE NOT(EOF(ARCH_C)) DO
        begin
            LEER_DATO_c(ARCH_C,POS,AUX);
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
        crear_abrir_C(ARCH_C);
        WHILE NOT(EOF(ARCH_C)) DO
        begin
            LEER_DATO_c(ARCH_C,POS,AUX);
            AUX_X.CLAVE:= CONCAT(AUX.APELLIDO, AUX.NOMBRE);
            AUX_X.POS_ARCH:= POS;
            AGREGAR_ARBOL(ARBOL, AUX_X);
            POS:= POS+1;
        end;
    end;   

end.