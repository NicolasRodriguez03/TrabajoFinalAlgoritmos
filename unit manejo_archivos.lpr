unit manejo_archivo_cont;

interface
uses
  unit_archivo;
  unit_arboles;
    PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE ALTA(r: DATO_CONT; var ARCH_C: ARCH_C);
    PROCEDURE CARGAR_CONT(VAR X: DATOS_CONT);
    PROCEDURE GUARDA_DATO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    
end;


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

    PROCEDURE MOSTRAR_DATOS_C(VAR ARCH_C: ARCHIVO_C; POS:CARDINAL);
    VAR DATO:DATOS_CONT;
    BEGIN
    LEER_DATO(ARCH_C,POS, DATO);
    WITH (DATO) DO              
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

    

    Procedure crear_abrir(var ARCH_C:ARCHIVO_C);
    begin
    assign(ARCH_C, ruta_cont);
    {$i-}
    reset(ARCH_C);
    {$i+}
    if ioresult <> 0 then
        rewrite(ARCH_C);

    end;
end.