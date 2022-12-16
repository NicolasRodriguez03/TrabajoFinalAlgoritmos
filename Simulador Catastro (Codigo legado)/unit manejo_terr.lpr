unit manejo_terrenos;

interface
uses
    definicion_datos;
    lista;
    manejo_archivo_terr;
    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T);
    PROCEDURE MODIF_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL; VAR DATO:T_DATO_T);
    procedure MODIFICACION_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL); 
    PROCEDURE CONSULTA_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
    procedure BAJA_CONT_TER (VAR ARCH_T:ARCHIVO_T; X:STRING[8]);
    procedure BAJA_TERRENO (VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
end;

implementation
    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T);
    VAR
    BEGIN
        CARGAR_T(X);
        AVALUO(X);
        GUARDAR_DATO_T(ARCH_T,FILESIZE(arch_t),X);
    END;


    PROCEDURE MODIF_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL; VAR DATO:T_DATO_T);   //esto esta bien, no tocar
        VAR
            OP:BYTE; OP_2:STRING[2];
            OP_2:string[2];
            AUX:string[50];
            AUX_2: BYTE[1..5];
            AUX_3: REAL; 
        begin
        LEER_DATO_T(ARCH_T, POS, DATO);
        Writeln ('¿Que dato desea modificar? (Ingrese nro. de dato o ingrese 0 para volver al menu)');
        Readln (OP);
        CASE OP OF
            1: Writeln ('Desea modificar nro. de contribuyente? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX);
                DATO.N_CONT:= AUX;
                END;
            ELSE
                MODIF_DATO_T (ARCH_T; POS; DATO);
            2: Writeln ('Desea modificar numero plano de mensura? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX);
                dato.N_MENS:= AUX;
                END;
            ELSE
                MODIF_DATO_T (ARCH_t; POS; dato);
            3: Writeln ('Desea modificar fecha de inscripcion? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX);
                dato.f_inc:= AUX;
                END;
            ELSE
                MODIF_DATO_T (ARCH_t; POS; dato);
            4: Writeln ('Desea modificar dirección? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX);
                dato.domicilio:= AUX;
                END;
            ELSE
                MODIF_DATO_T (ARCH_t; POS; dato);
            5: Writeln ('Desea modificar zona? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX_2);
                dato.zona:= AUX_2;
                AVALUAR(DATO);
                END;
            ELSE
                MODIF_DATO_T (ARCH_t; POS; dato);
            6: Writeln ('Desea modificar tipo edificacion? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX_2);
                dato.tipo_e:= AUX_2;
                AVALUAR(DATO);
                END;
            ELSE
                MODIF_DATO_T (ARCH_T; POS; DATO);
            7: Writeln ('NO PUEDE MODIFICAR AVALUO');
                MODIF_DATO_T (ARCH_t; POS; DATO);
            8: Writeln ('Desea modificar SUPERFICIE? (SI/NO)');
            Readln (OP_2);
            IF (OP_2='SI') or (OP_2='si') or (OP_2='Si') then
                BEGIN
                Writeln ('Ingrese nuevo dato');
                Readln (AUX_3);
                DATO.SUPERFICIE:= AUX_3;
                AVALUAR(DATO);
                END;
            ELSE
                MODIF_DATO_T(ARCH_T; POS; DATO);
        END;
        end;    

    procedure MODIFICACION_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
    begin
      MOSTRAR_DATOS_T(ARCH_T; POS, DATO);                   //esto esta bien, no tocar
      MODIF_DATO_t(ARCH_T; POS, DATO);
      GUARDAR_DATO_T(ARCH_T, POS; DATO);
    end;

  
    PROCEDURE CONSULTA_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
    VAR X:STRING;
    BEGIN 
    WRITELN ('INGRESE NUMERO DE PLANO DE MENSURA PARA REALIZAR CONSULTA:');
    READLN (X);
    busqueda_archivo_mens (ARCH_T, x, pos);
    MOSTRAR_DATOS_T(ARCH_T, POS, DATO);
    END;

    procedure BAJA_CONT_TER (VAR ARCH_T:ARCHIVO_T; X:STRING[8]);
    Var I:CARDINAL; TEMP: T_DATO_T;
    BEGIN
    crear_abrir_t(ARCH_T);
    FOR I:=0 TO (FILESIZE(ARCH_T)-1) DO
    begin
    LEER_DATO_T(ARCH_T,I,TEMP);
    IF TEMP.N_CONT=X THEN 
    BEGIN
        TEMP.N_CONT=' ';
        WRITE(ARCH_T,TEMP);
    END;
    end;

    procedure BAJA_TERRENO (VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
    Var REG:T_DATO_T;  OP:STRING [2];
    BEGIN
    MOSTRAR_DATOS_T(ARCH_T, POS);
    Writeln ('Desea dar de baja a este terreno? (SI/NO)');
    Readln (OP);
    IF (OP='SI') OR (OP='Si') or (OP='si') then 
        BEGIN
        READ(ARCH_T,REG);
        REG.N_CONT:=(' ');
        WRITE(ARCH_T, REG);
        END;
    menu_terrenos();
    end;
END;





    