unit manejo_archivo_cont;

interface
    uses definicion_datos, sysutils, MANEJO_ARCHIVO_TERR;
    Procedure crear_abrir_C(var ARCH_C:ARCHIVO_C);
    PROCEDURE LEER_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:LongInt; VAR REG:DATOS_CONT);
    PROCEDURE GUARDA_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:LongInt; REG:DATOS_CONT);
    PROCEDURE MOSTRAR_DATOS_C(VAR ARCH_C: ARCHIVO_C; POS:LongInt);
    FUNCTION OBTENER_N_CONT (VAR ARCH_C:ARCHIVO_C; POS: LongInt):STRING;
    FUNCTION CANT_PROPIEDADES (VAR ARCH_T:ARCHIVO_T; x:DATOS_CONT):INTEGER;
    PROCEDURE CHEQUEO_ESTADO(var ARCH_C: ARCHIVO_C;var ARCH_T:ARCHIVO_T);


implementation
    Procedure crear_abrir_C(var ARCH_C:ARCHIVO_C);
    begin
    assign(ARCH_C, ruta_cont);
    {$I-}
    reset(ARCH_C);
    {$I+}
    if ioresult <> 0 then
        rewrite(ARCH_C);
    end;
   
    PROCEDURE LEER_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:LongInt; VAR REG:DATOS_CONT);
    BEGIN
        //crear_abrir_C(ARCH_C);
        SEEK(ARCH_C, POS);
        READ(ARCH_C, REG);
    END;

    PROCEDURE GUARDA_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:LongInt; REG:DATOS_CONT);
    BEGIN
        //crear_abrir_C(ARCH_C);
        SEEK(ARCH_C, POS);
        WRITE(ARCH_C, REG);
    END;

    PROCEDURE MOSTRAR_DATOS_C(VAR ARCH_C: ARCHIVO_C; POS:LongInt);
    VAR DATO:DATOS_CONT;
    BEGIN
    LEER_DATO_C(ARCH_C,POS, DATO);
    WITH (DATO) DO
        BEGIN
        Writeln ('1) NÚMERO DE CONTRIBUYENTE: ',N_CONT );
        Writeln ('2) NOMBRE: ', NOMBRE);
        Writeln ('3) APELLIDO: ',APELLIDO);
        Writeln ('4) Dirección: ', DIREC);
        Writeln ('5) Ciudad: ',ciudad);
        Writeln ('6) DNI: ', DNI);
        Writeln ('7) Nacimiento: ', F_NAC);
        Writeln ('8) Telefono: ', TEL);
        Writeln ('9) Mail: ', MAIL);
        IF ESTADO=TRUE THEN
            Writeln ('10) ESTADO: ACTIVO')
        else
            Writeln ('10) ESTADO: INACTIVO')
        END;
    END;

    FUNCTION OBTENER_N_CONT (VAR ARCH_C:ARCHIVO_C; POS: LongInt):STRING;
    Var dato: DATOS_CONT;
    begin
        LEER_DATO_C(arch_c,pos,dato);
        OBTENER_N_CONT:= dato.n_cont;
    end;

    FUNCTION CANT_PROPIEDADES (VAR ARCH_T:ARCHIVO_T; x:DATOS_CONT):INTEGER;
    var J,C:longint; X_1:T_DATO_T;
    begin
        C:=0;
        FOR J:=0 TO (FILESIZE(ARCH_T)-1) DO
            BEGIN
            LEER_DATO_T(ARCH_T,J,X_1);
            IF X_1.N_CONT= X.N_CONT THEN
                C:=C+1;
            END;   
        CANT_PROPIEDADES:=C;
    end;

    PROCEDURE CHEQUEO_ESTADO(var ARCH_C: ARCHIVO_C;var ARCH_T:ARCHIVO_T);
    VAR 
        I, I_AUX:longint;
        DATO_C:DATOS_CONT;
    begin
        FOR I:=0 TO (FILESIZE(ARCH_C)-1) DO
        begin
            I_AUX:=I;
            LEER_DATO_C(ARCH_C, I_AUX, DATO_C);
            IF CANT_PROPIEDADES(ARCH_T, DATO_C)>=1 THEN
                DATO_C.ESTADO:=TRUE
            ELSE
                DATO_C.ESTADO:=FALSE;
            GUARDA_DATO_C(ARCH_C, I_AUX, DATO_C);
        end;
    end;
end.