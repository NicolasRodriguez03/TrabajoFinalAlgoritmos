unit estadisticas;

interface
definicion_datos;
manejo_contribuyente;


type


implementation
    FUNCTION cant_ins(L:T_LISTA):INTEGER;
    var
        f_in,f_fin:String[10];
        C:INTEGER;
        X:T_DATO_T;
    begin
      Writeln('Ingrese fecha de inicio');
      Readln (F_IN);
      Writeln('Ingrese fecha de fin');
      Readln (F_FIN);
      PRIMERO(L);
      WHILE NOT(FINLISTA(L)) DO;
      RECUPERAR(L, X);
      IF (X.F_INC>=F_IN) AND (X.F_INC<=F_FIN) THEN
        C:=C+1;
      SIGUIENTE(L);
      END;
      cant_ins:=C;
    end;

    FUNCTION PORC_TIPO(VAR L:T_LISTA;var ARCH_T:ARCHIVO_T; X:BYTE):REAL;
    VAR
        TOTAL,C:INTEGER;
    begin
      C:=0;
      TOTAL:=FILESIZE(ARCH_T);
      PRIMERO(L);
      WHILE NOT(FINLISTA(L)) DO
        RECUPERAR(L,Y);
        IF Y.TIPO_E = X THEN
            C:=C+1;
        SIGUIENTE(L);
      END;
      PORC_TIPO:=((C*100)/TOTAL);
    end;

    function Cant_baja(var ARCH_C:ARCHIVO_C):integer;
    VAR
        TOTAL, C:INTEGER;
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