unit estadisticas;

interface
USES
SYSUTILS,definicion_datos,
manejo_archivo_TERR, manejo_archivo_CONT;

FUNCTION CONVERTIR_FECHA(X:STRING):INTEGER;
FUNCTION cant_ins(VAR ARCH_t:ARCHIVO_t):INTEGER;
FUNCTION PORC_TIPO(Var ARCH_T:ARCHIVO_T; X:BYTE):REAL;
function Cant_baja(var ARCH_C:ARCHIVO_C):REAL;
FUNCTION PROP_MP (VAR ARCH_C: ARCHIVO_C; VAR ARCH_T: ARCHIVO_T ):REAL;

implementation
    FUNCTION CONVERTIR_FECHA(X:STRING):INTEGER; // Convierte las fechas de formato DD/MM/AAAA a n° de dias
    var d,m,a:integer;
    begin
      D:= STRTOINT(COPY(X,1,2));
      M:= STRTOINT(COPY(X,4,2));
      A:= STRTOINT(COPY(X,7,4));
      CONVERTIR_FECHA:= ((A*365)+(M*30)+D);
    end;

  FUNCTION cant_ins(VAR ARCH_t:ARCHIVO_t):INTEGER;  // Devuelve el n° de terrenos inscriptos entre 2 fechas
    var
        f_in,f_fin:String[10];
        C:INTEGER; i:LongInt;
        X:t_dato_t;
        F1,F2,F3: INTEGER;
    begin
      i:=0;    C:=0;
      Writeln('Ingrese fecha de inicio (DD/MM/AAAA)');
      Readln (F_IN);
      F1:=CONVERTIR_FECHA(F_IN);
      Writeln('Ingrese fecha de fin (DD/MM/AAAA)');
      Readln (F_FIN);
      F2:= CONVERTIR_FECHA(F_FIN) ;
      FOR I:=0 TO (FILESIZE(ARCH_T)-1) DO
      begin
        LEER_DATO_t(ARCH_t,I,X);
        F3:= CONVERTIR_FECHA(X.f_inc);
        IF (F3>=F1) AND (F3<=F2) THEN
          C:=C+1;
      end;
      cant_ins:=C;
    end;

    FUNCTION PORC_TIPO(Var ARCH_T:ARCHIVO_T; X:BYTE):REAL;  // Devuelve el porcentaje de terrenos que pertenecen al tipo dado
    VAR
        TOTAL,C,I:INTEGER; 
        REG:T_DATO_T;
    begin
      C:=0;
      TOTAL:=FILESIZE(ARCH_T);
      FOR I:=0 TO (FILESIZE(ARCH_T)-1) DO
      BEGIN
        LEER_DATO_T(ARCH_T, I, REG);
        IF REG.TIPO_E = X THEN
            C:=C+1;
      END;
      If TOTAL <> 0 THEN
        PORC_TIPO:=((C*100)/TOTAL)
      ELSE
        PORC_TIPO:= 0;
    end;

    function Cant_baja(var ARCH_C:ARCHIVO_C):REAL;  // Devuelve el porcentaje de contribuyentes que están dados de baja
    VAR
        TOTAL, C:INTEGER;
        C1,I:LongInt;
        X:DATOS_CONT;
    begin
      C:=0 ;  I:=0;
      TOTAL:=FILESIZE(ARCH_C);
      FOR I:=0 TO (FILESIZE(ARCH_C)-1) DO
      begin
        C1:=I;
        LEER_DATO_C(ARCH_C,C1,X);
        IF X.ESTADO=FALSE THEN
          C:=C+1;
      end ;
      If TOTAL <> 0 THEN
        Cant_baja:=((C*100)/TOTAL)
      ELSE
        Cant_baja:= 0;
    end;


   FUNCTION PROP_MP (VAR ARCH_C: ARCHIVO_C; VAR ARCH_T: ARCHIVO_T ):REAL; // Devuelve el porcentaje de contribuyentes con mas de una propiedad
   VAR C,J,TOTAL,TOTAL_MP:longint; 
        I,C1:LongInt;
        X:DATOS_CONT;
        X_1:T_DATO_T;
   BEGIN
    TOTAL:=0;
    TOTAL_MP:=0;
    I:=0;
    FOR I:=0 TO (FILESIZE(ARCH_C)-1) DO
    BEGIN
      C:=0;
      C1:=I;
      LEER_DATO_C(ARCH_C,C1,X);
      IF X.ESTADO = TRUE THEN
      BEGIN
        J:=0;
        TOTAL:=TOTAL+1;
        WHILE (C<2) AND (J<=(FILESIZE(ARCH_T)-1)) DO
        BEGIN
          LEER_DATO_T(ARCH_T,J,X_1);
          IF X_1.N_CONT= X.N_CONT THEN
            C:=C+1;
          j:=j+1
        END;
      END;
      IF C>=2 THEN
        TOTAL_MP:= TOTAL_MP+1;
    END;
    If TOTAL <> 0 THEN
      PROP_MP:= ((TOTAL_MP*100)/TOTAL)
    ELSE
      PROP_MP:= 0;
    writeln('total ', total);
    writeln('total mp ', total_mp);
  END;
end.

