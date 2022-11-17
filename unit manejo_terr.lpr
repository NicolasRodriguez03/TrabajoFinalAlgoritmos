unit manejo_terrenos;

interface
uses
    unit_archivo;
    PROCEDURE CARGAR_T(VAR X: T_DATO_T);
    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T);
    PROCEDURE AVALUO(VAR X:T_DATO_T);
    PROCEDURE GUARDAR_DATO (VAR ARCH: ARCHIVO_T, POS:CARDINAL; REG:T_DATO_T);

implementation

    PROCEDURE CARGAR_T(VAR X: T_DATO_T);
    VAR
    BEGIN
        with (X) do
        begin
            Writeln ('Ingrese numero de contribuyente');
            Readln(N_CONT);
            Writeln ('Ingrese número de plano de mensura');
            Readln (N_MENS);
            Writeln ('Ingrese domicilio parcelario');
            Readln (DOMICILIO);
            Writeln ('Ingrese superficie en metros cuadrados');
            Readln (SUPERFICIE);
            Writeln ('Ingrese zona');
            Readln (ZONA);
            Writeln ('Ingrese tipo de edificación');
            Readln (TIPO_E);
        end;
    END;

    PROCEDURE AVALUO(VAR X:T_DATO_T);
    VAR
        AUX._ZONA, AUX_TIPO_E, BASICO:REAL;
    BEGIN
        BASICO:=12308.60;
        CASE X.ZONA OF
            1: AUX._ZONA:= 1.5
            2: AUX._ZONA:= 1.1
            3: AUX._ZONA:= 0.7
            4: AUX._ZONA:= 0.4
            5: AUX._ZONA:= 0.1
        END;
        CASE X.TIPO_E OF
            1: AUX._TIPO_E:= 1.7;
            2: AUX._TIPO_E:= 1.3;
            3: AUX._TIPO_E:= 1,1;
            4: AUX._TIPO_E:= 0,8;
            5: AUX._TIPO_E:= 0,5;
        END;
        X.AVALUO:= BASE*X.SUPERFICIE*AUX_ZONA*AUX_TIPO_E;
    END;

    PROCEDURE GUARDAR_DATO (VAR ARCH: ARCHIVO_T, POS:CARDINAL; REG:T_DATO_T);
    BEGIN
        SEEK(ARCH, POS);
        WRITE(ARCH, REG);
    END;

    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T);
    VAR
    BEGIN
        CARGAR_T(X);
        AVALUO(X);
        GUARDAR_DATO (ARC_T,POS,X)
    END;

end.