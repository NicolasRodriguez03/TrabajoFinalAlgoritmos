unit estadisticas;

interface
definicion_datos;
manejo_contribuyente;


type


implementation
    FUNCTION cant_ins(VAR ARCH_C:ARCHIVO_C):INTEGER;
    var
        f_in,f_fin:String[10];
        C, I:INTEGER;
        X:T_DATO_T;
    begin
      Writeln('Ingrese fecha de inicio');
      Readln (F_IN);
      Writeln('Ingrese fecha de fin');
      Readln (F_FIN);
      FOR I:=0 TO (FILESIZE(ARCH_C)-1) DO
      begin
        LEER_DATO_C(ARCH_C,I,X);
        IF (X.F_INC<=F_IN) AND (X.F_INC>=F_FIN) THEN
        C:=C+1;
      end;
      cant_ins:=C;
    end;

    FUNCTION PORC_TIPO(Var ARCH_T:ARCHIVO_T; X:BYTE):REAL;
    VAR
        TOTAL,C:INTEGER;
    begin
      C:=0;
      TOTAL:=FILESIZE(ARCH_T);
      FOR 1:=0 TO (FILESIZE(ARCH_C)-1) DO
      BEGIN
        LEER_DATO_C(ARCH_T, POS, REG);
        IF REG.TIPO_E = X THEN
            C:=C+1;
      END;
      PORC_TIPO:=((C*100)/TOTAL);
    end;

    function Cant_baja(var ARCH_C:ARCHIVO_C):integer;
    VAR
        TOTAL, C, I:INTEGER;
        X:DATOS_CONT;
    begin
      C:=0
      TOTAL:=FILESIZE(ARCH_C);
      FOR I:=0 TO (FILESIZE(ARCH_C)-1) DO
      begin
        LEER_DATO_C(ARCH_C,I,X);
        IF X.ESTADO=FALSE THEN
        C:=C+1;
      end;
      Cant_baja:=((C*100)/TOTAL);
    end;
end.