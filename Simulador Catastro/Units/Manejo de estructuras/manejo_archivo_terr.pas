unit manejo_archivo_terr;

interface
    USES unicodeCRT, DEFINICION_DATOS, sysutils, validacion;
    Procedure crear_abrir_T(var ARCH_T:ARCHIVO_T);
    PROCEDURE LEER_DATO_T(VAR ARCH_T:ARCHIVO_T; POS:LongInt; VAR DATO: T_DATO_T);
    PROCEDURE GUARDAR_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:LongInt; REG:T_DATO_T);
    PROCEDURE MUESTRA_DATOS_T(VAR E:T_DATO_T);
    PROCEDURE MOSTRAR_DATOS_T(VAR ARCH_T: ARCHIVO_T; POS:LongInt);
    PROCEDURE CARGAR_T(VAR X: T_DATO_T; x1:string; x2:string);
    procedure busqueda_archivo_mens (VAR ARCH_T: archivo_t; x:string; var pos:LongInt);
    PROCEDURE AVALUAR(VAR X:T_DATO_T);
    Procedure Borrar_elemento(var arch_t:archivo_t; pos:longint);

implementation
Procedure crear_abrir_t(var ARCH_T:ARCHIVO_T);
    begin
    assign(ARCH_T, ruta_terr);
    {$I-}
    reset(ARCH_T);
    {$I+}
    if ioresult <> 0 then
        rewrite(ARCH_T);
    end;

    PROCEDURE LEER_DATO_T(VAR ARCH_T:ARCHIVO_T; POS:LongInt;VAR DATO: T_DATO_T);
    BEGIN
        //crear_abrir_t(ARCH_T);
        SEEK (ARCH_T,POS);
        READ(ARCH_T, DATO);
    END;

    PROCEDURE GUARDAR_DATO_T(VAR ARCH_T: ARCHIVO_T; POS:LongInt; REG:T_DATO_T);
    BEGIN
        //crear_abrir_t(ARCH_T);
        SEEK(ARCH_T, POS);
        WRITE(ARCH_T, REG);
    END;

    PROCEDURE MUESTRA_DATOS_T(VAR E:T_DATO_T);
    begin
    WITH (E) DO
        begin
            Writeln ('1) NUMERO DE CONTRIBUYENTE: ',N_CONT );
            Writeln ('2) NUMERO PLANO DE MENSURA: ', N_MENS);
            Writeln ('3) FECHA INSCRIPCIÓN: ', F_INC);
            Writeln ('4) Dirección: ', DOMICILIO);
            Writeln ('5) ZONA: ', ZONA);
            Writeln ('6) TIPO EDIFICACIÓN : ', TIPO_E);
            WRITELN ('7) AVALÚO: $', AVALUO:5:2);
            WRITELN ('8) SUPERFICIE: ', SUPERFICIE:5:2);
        end;
 END;
    PROCEDURE MOSTRAR_DATOS_T(VAR ARCH_T: ARCHIVO_T; POS:LongInt);
    VAR DATO:T_DATO_T;
    BEGIN
        LEER_DATO_T(ARCH_T,POS, DATO);
        MUESTRA_DATOS_T(DATO);
    END;

    PROCEDURE CARGAR_T(VAR X: T_DATO_T; x1:string; x2:string);
    BEGIN
        with (X) do
        begin
            n_cont:=X1;
            N_MENS:=x2;
            textcolor(magenta);
            Writeln ('Ingrese fecha de inscripcion ');
            textcolor(black);
            Readln (F_INC);
            while not chequeo_fecha(f_inc) do
            begin
                WRITELN ('Fecha inválida, por favor intente nuevamente');
                readln (f_inc); 
            end;
            textcolor(magenta);
            Writeln ('Ingrese domicilio parcelario');
            textcolor(black);
            Readln (DOMICILIO);
            textcolor(magenta);
            Writeln ('Ingrese superficie en metros cuadrados');
            textcolor(black);
            Readln (SUPERFICIE);
            textcolor(magenta);
            Writeln ('Ingrese zona[1-5]');
            textcolor(black);
            Readln (ZONA);
            while (zona<1) OR (zona>5) do
            begin
              textcolor(magenta);
              WRITELN ('INGRESE UN VALOR VALIDO ENTRE 1-5');
              textcolor(black);
              READLN(ZONA);
            end;
            textcolor(magenta);
            Writeln ('Ingrese tipo de edificación [1-5]');
            textcolor(black);
            textcolor(magenta);
            Readln (TIPO_E);
            WHILE (TIPO_E<1) OR (TIPO_E>5) DO 
            begin
              textcolor(magenta);
              WRITELN ('INGRESE UN VALOR VALIDO ENTRE 1-5');
              textcolor(black);
              READLN(TIPO_E);
            end;
        end;
    END;

    

    procedure busqueda_archivo_mens (VAR ARCH_T: archivo_t; x:string; var pos:LongInt);
    var i:word;T:T_DATO_T;
    begin
        pos:=-1;
        i:=0;
        while (pos=-1) and (i<FILESIZE(arch_t)) do
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

    Procedure Borrar_elemento(var arch_t:archivo_t; pos:longint);
    var
        aux_t:archivo_t;
        i,c:longint;
        aux_reg:t_dato_t;
    begin
      assign (AUX_T, RUTA_AUX);
      REWRITE(AUX_T);
      RESET(AUX_T);
      c:=0;
      For I:=0 to (FILESIZE(arch_t)-1) do
        BEGIN
        IF POS <> I THEN 
            begin
            LEER_DATO_T(arch_t, i, aux_reg);
            GUARDAR_DATO_T(aux_t, c, aux_reg);
            c:=c+1
            END;
        end;
      close(arch_t);
      close(aux_t);   
      erase(arch_t); 
      rename(aux_t,ruta_terr);
      arch_t:=(aux_t);
      crear_abrir_t(arch_t);
    end;

end.