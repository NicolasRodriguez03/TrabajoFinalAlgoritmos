unit manejo_archivo_terr;

interface
    USES DEFINICION_DATOS;
    Procedure crear_abrir_T(var ARCH_T:ARCHIVO_T);
    PROCEDURE LEER_DATO_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL; DATO: T_DATO_T);
    PROCEDURE GUARDAR_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL; REG:T_DATO_T);
    PROCEDURE MUESTRA_DATOS_T(VAR E:T_DATO_T);
    PROCEDURE MOSTRAR_DATOS_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL);
    PROCEDURE CARGAR_T(VAR X: T_DATO_T);
    procedure busqueda_archivo_mens (VAR ARCH_T: archivo_t; x:string; var pos:CARDINAL);
    PROCEDURE AVALUAR(VAR X:T_DATO_T);
const
    ruta_terr='C:\Users\Standard\Downloads\Simulador Catastro\Archivos\Terrenos.dat';
    ruta_cont='CC:\Users\Standard\Downloads\Simulador Catastro\Archivos\Contribuyentes.dat';


implementation
Procedure crear_abrir_t(var ARCH_T:ARCHIVO_T);
    begin
    assign(ARCH_T, ruta_terr);
    {$i-}
    reset(ARCH_T);
    {$i+}
    if ioresult <> 0 then
        rewrite(ARCH_T);
    end;

    PROCEDURE LEER_DATO_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL; DATO: T_DATO_T);
    BEGIN
    crear_abrir_t(ARCH_T);
    SEEK (ARCH_T,POS);
    READ(ARCH_T, DATO);
    END;

    PROCEDURE GUARDAR_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL; REG:T_DATO_T);
    BEGIN
    crear_abrir_t(ARCH_T);
        SEEK(ARCH_T, POS);
        WRITE(ARCH_T, REG);
    END;

    PROCEDURE MUESTRA_DATOS_T(VAR E:T_DATO_T);
    begin
    WITH (E) DO
        begin
            Writeln ('1) NUMERO DE CONTRIBUYENTE: ',N_CONT );
            Writeln ('2) NUMERO PLANO DE MENSURA:', N_MENS);
            Writeln ('3) FECHA INSCRIPCION: ', F_INC);
            Writeln ('4) Direccion:', DOMICILIO);
            Writeln ('5) ZONA', ZONA);
            Writeln ('6) TIPO EDIFICACION : ', TIPO_E);
            WRITELN ('7) AVALUO: ', AVALUO) ;
            WRITELN ('8) SUPERFICIE: ', SUPERFICIE) ;
        end;
 END;
    PROCEDURE MOSTRAR_DATOS_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL);
    VAR DATO:T_DATO_T;
    BEGIN
        LEER_DATO_T(ARCH_T,POS, DATO);
        MUESTRA_DATOS_T(DATO);
    END;

    PROCEDURE CARGAR_T(VAR X: T_DATO_T);
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

    procedure busqueda_archivo_mens (VAR ARCH_T: archivo_t; x:string; var pos:CARDINAL);
      var i:word;T:T_DATO_T;
      begin
      crear_abrir_t(arch_t);
      pos:=-1;
      i:=0;
      while (pos<>-1) and (i<FILESIZE(arch_t)) do
      begin
      LEER_DATO_T(ARCH_T,i,t);
      if t.N_MENS=x THEN
      pos:=I
      else
      i:=i+1;
    end;
 END;

    PROCEDURE AVALUAR(VAR X:T_DATO_T);
    VAR
        AUX_ZONA, AUX_TIPO_E, BASICO:REAL;
    BEGIN
        BASICO:=12308.60;
        CASE X.ZONA OF
            1: AUX_ZONA:= 1.5;
            2: AUX_ZONA:= 1.1;
            3: AUX_ZONA:= 0.7;
            4: AUX_ZONA:= 0.4;
            5: AUX_ZONA:= 0.1;
        END;
        CASE X.TIPO_E OF
            1: AUX_TIPO_E:= 1.7;
            2: AUX_TIPO_E:= 1.3;
            3: AUX_TIPO_E:= 1.1;
            4: AUX_TIPO_E:= 0.8;
            5: AUX_TIPO_E:= 0.5;
        END;
        X.AVALUO:= (BASICO*X.SUPERFICIE)*(AUX_ZONA*AUX_TIPO_E);
    END;

end.


