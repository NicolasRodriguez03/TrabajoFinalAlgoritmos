unit manejo_terrenos;

interface
uses
    definicion_datos;
    terreno;
    lista_terreno;
    PROCEDURE CARGAR_T(VAR X: T_DATO_T);
    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T);
    PROCEDURE AVALUO(VAR X:T_DATO_T);
    PROCEDURE GUARDAR_DATO (VAR ARCH: ARCHIVO_T, POS:CARDINAL; REG:T_DATO_T);
    Procedure crear_abrir(var ARCH_T:T_DATO_T);
end;

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

    PROCEDURE AVALUAR(VAR X:T_DATO_T);
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

    PROCEDURE GUARDAR_DATO_T(VAR ARCH_T: ARCHIVO_T, POS:CARDINAL; REG:T_DATO_T);
    BEGIN
        SEEK(ARCH_T, POS);
        WRITE(ARCH_T, REG);
    END;

    PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T);
    VAR
    BEGIN
        CARGAR_T(X);
        AVALUO(X);
        GUARDAR_DATO (ARCH_T,POS,X)
    END;

    PROCEDURE LEER_DATO_T(ARCH_T:ARCHIVO_T; POS:CARDINAL; DATO: T_DATO_T);   //esto esta bien, no tocar
    BEGIN 
    SEEK (ARHC_T,POS);
    READ(ARCH_T, DATO);
    END;

    PROCEDURE MUESTRA_DATOS(VAR E:T_DATO_T);   //esto esta bien, no tocar
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

    PROCEDURE MOSTRAR_DATOS_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL; VAR DATO: T_DATO_T);
        BEGIN   //esto esta bien, no tocar
        LEER_DATO(ARCH_C,POS, DATO);
        MUESTRA_DATOS(DATO);
        END;
    END;
    
    Procedure crear_abrir(var ARCH_T:T_DATO_T);
    begin
    assign(ARCH_T, ruta_terr);
    {$i-}
    reset(ARCH_T);
    {$i+}
    if ioresult <> 0 then
        rewrite(ARCH_T);
    end;

     procedure busqueda_archivo_mens (ARCH_T: archivo_t, x:string, var pos:word);
      var i:word;
      begin
      crear_abrir(arch_t);
      pos:=-1;
      i:=0;
      while pos<>-1 and i<FILESIZE(arch_t) do 
      begin
      LEER_DATO_T(ARCH_T,i,t)
      if t.N_MENS=x do 
      pos:=I
      else
      i:=i+1; 
      end;
end.


    PROCEDURE MODIF_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:CARDINAL; DATO:T_DATO_T);   //esto esta bien, no tocar
        VAR
            OP:BYTE; OP_2:STRING[2];
            OP_2:string[2];
            AUX:string[50];
            AUX_2: BYTE[1..5];
            AUX_3: REAL; 
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
                MODIF_DATO_T (ARCH_T; POS; DATO);
        END;
        end;    

    procedure MODIFICACION_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
    begin
      MOSTRAR_DATOS_T(ARCH_T; POS, DATO);                   //esto esta bien, no tocar
      MODIF_DATO_t(ARCH_T; POS, DATO);
      GUARDAR_DATO(ARCH_T, POS; DATO);
    end;

  
    PROCEDURE CONSULTA_T(VAR ARCH_T:ARCHIVO_T; POS:CARDINAL);
    VAR X:STRING;
    BEGIN 
    WRITELN ('INGRESE NUMERO DE PLANO DE MENSURA PARA REALIZAR CONSULTA:');
    READLN (X);
    busqueda_archivo_mens (ARCH_T, x, pos);
    MOSTRAR_DATOS_T(ARCH_T, POS, DATO);
    END;

    