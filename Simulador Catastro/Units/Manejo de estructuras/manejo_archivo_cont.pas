unit manejo_archivo_cont;

interface
    uses definicion_datos;
    Procedure crear_abrir_C(var ARCH_C:ARCHIVO_C);
    PROCEDURE CARGAR_CONT(VAR X: DATOS_CONT);
    PROCEDURE LEER_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:CARDINAL; REG:DATOS_CONT);
    PROCEDURE GUARDA_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:CARDINAL; REG:DATOS_CONT);
    PROCEDURE MOSTRAR_DATOS_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL);
    FUNCTION OBTENER_N_CONT (VAR ARCH_C:ARCHIVO_C; POS: CARDINAL):STRING;


implementation
    Procedure crear_abrir_C(var ARCH_C:ARCHIVO_C);
    begin
    assign(ARCH_C, ruta_cont);
    {$i-}
    reset(ARCH_C);
    {$i+}
    if ioresult <> 0 then
        rewrite(ARCH_C);
    end;


    PROCEDURE CARGAR_CONT(VAR X: DATOS_CONT);
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

    PROCEDURE LEER_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:CARDINAL; REG:DATOS_CONT);
    BEGIN
        crear_abrir_C(ARCH_C);
        SEEK(ARCH_C, POS);
        READ(ARCH_C, REG);
    END;

    PROCEDURE GUARDA_DATO_C(VAR ARCH_C:ARCHIVO_C; var POS:CARDINAL; REG:DATOS_CONT);
    BEGIN
        crear_abrir_C(ARCH_C);
        SEEK(ARCH_C, POS);
        WRITE(ARCH_C, REG);
    END;

    PROCEDURE MOSTRAR_DATOS_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL);
    VAR DATO:DATOS_CONT;
    BEGIN
    LEER_DATO_C(ARCH_C,POS, DATO);
    WITH (DATO) DO
    BEGIN
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
    IF ESTADO=TRUE THEN
        Write ('ACTIVO')
           else
        Write ('INACTIVO')
    END;
    END;

    FUNCTION OBTENER_N_CONT (VAR ARCH_C:ARCHIVO_C; POS: CARDINAL):STRING;
    Var dato: DATOS_CONT;
    begin
        LEER_DATO_C(arch_c,pos,dato);
        OBTENER_N_CONT:= dato.n_cont;
    end;
end.
