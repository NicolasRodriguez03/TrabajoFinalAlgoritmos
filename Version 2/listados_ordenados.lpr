unit listados_ordenados;

interface
    definicion_datos;
    lista_terreno;
    arboles;


type
  T = class
  
  end;

implementation
    PROCEDURE LISTADO_AYN_CON_AVALUO(VAR ARBOL:T_PUNT; L:T_LISTA);
    BEGIN
    IF ARBOL <> NIL THEN BEGIN
        BEGIN
            INORDEN (ARBOL^.H_I);
            WRITELN (ARBOL^.INFO.CLAVE);
            LEER_DATO_C(ARCH_C, ARBOL^.POS_ARCH, REG);
            Primero(L)
            while not(FINLISTA(L)) do
                IF L.ACT^.INFO.N_CONT = REG.N_CONT THEN
                MUESTRA_DATOS(L.ACT);
                SIGUIENTE(L);
            END;
            INORDEN (ARBOL^.SAD);
        end;
    END;
    
    PROCEDURE LISTADO_FECHA(var L:T_LISTA);
    VAR X:STRING[4]
    begin
      Writeln('Ingrese año');
      Readln (x);
          PRIMERO(L);
        WHILE NOT FIN(L) DO
        BEGIN
            RECUPERAR(L,E);
                if COPY(E.F_INC,7,10)=x
                MUESTRA_DATOS(E);
            SIGUIENTE(L);
        END;    
    end;
end.