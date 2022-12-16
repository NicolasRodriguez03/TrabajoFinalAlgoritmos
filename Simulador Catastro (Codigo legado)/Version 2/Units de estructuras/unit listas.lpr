unit lista;
    

interface
    PROCEDURE CREARLISTA (VAR L:T_LISTA);
    FUNCTION LISTA_LLENA (VAR L:T_LISTA): BOOLEAN;
    FUNCTION LISTA_VACIA (VAR L:T_LISTA): BOOLEAN;
    PROCEDURE SIGUIENTE(VAR L:T_LISTA);
    PROCEDURE PRIMERO (L:T_LISTA);
    PROCEDURE FIN (L:T_LISTA): BOOLEAN;
    PROCEDURE RECUPERAR (L:T_LISTA; VAR E:T);
    PROCEDURE BUSCAR (L:T_LISTA; BUSCADO:STRING[50] ;VAR ENC:BOOLEAN);
    PROCEDURE ELIMINARLISTA (VAR L:T_LISTA;BUSCADO: STRING; VAR X:T_DATO_T);
    PROCEDURE AGREGAR_ZONA (VAR L:T_LISTA; X:T_DATO_T);
    PROCEDURE AGREGAR_FECHA(VAR L:T_LISTA; X:T_DATO_T);

type


	T_PUNT_T= ^T_NODO_T;							// Puntero de la lista de terrenos 

	T_NODO_T= RECORD								// Nodo de esa lista de terrenos
		INFO: T_DATO_T;
		SIG: T_PUNT_T;
	END;

	T_LISTA: RECORD									// Lista de terrenos
		CAB,ACT: T_PUNT
		TAM: INTEGER;
	END;
END;

IMPLEMENTATION

    PROCEDURE CREARLISTA (VAR L:T_LISTA);
    BEGIN
        L.TAM:=0;
        L.CAB:=NIL;
    END;

    FUNCTION LISTA_LLENA (VAR L:T_LISTA): BOOLEAN;
    BEGIN
        LISTA_LLENA:= GETHEAPSTATUS.TotalFree < SIZEOF(T_NODO) ;
    END;

    FUNCTION LISTA_VACIA (VAR L:T_LISTA): BOOLEAN;
    BEGIN
        LISTA_VACIA:= L.TAM=0;
    END;

    PROCEDURE SIGUIENTE(VAR L:T_LISTA);
    BEGIN
        L.ACT:= L.ACT^.SIG;
    END;

    PROCEDURE PRIMERO (L:T_LISTA);
    BEGIN
        L.ACT = L.CAB;
    END;

    PROCEDURE FIN (L:T_LISTA): BOOLEAN;
    BEGIN
        FIN:= L.ACT = NIL;
    END;

    PROCEDURE ELIMINARLISTA (VAR L:T_LISTA;BUSCADO: STRING; VAR X:T_DATO_T;);
    VAR
        DIR,ANT:T_PUNTERO;
    BEGIN
        IF L.CAB^.INFO.N_CONT = BUSCADO THEN
        BEGIN
            X:= L.CAB^.INFO;
            DIR:= L.CAB;
            L. CAB:=DIR^.SIG;
            DISPOSE (DIR);
        END;
        ELSE
        BEGIN
            ANT:= L.CAB;
            L.ACT:= L.CAB^.SIG;
            WHILE (L.ACT^.INFO.N_CONT < X.N_CONT) DO
            BEGIN
                ANT:= L.ACT;
                L.ACT:= L.ACT^.SIG
            END;
            X:= L.ACT^.INFO;
            ANT^.SIG:= L.ACT^.SIG;
            DISPOSE (L.ACT);
        END;
        DEC(L.TAM)
    END;

    PROCEDURE RECUPERAR (L:T_LISTA; VAR E:T);
    BEGIN
        E:= L^.INFO;
    END;

    PROCEDURE BUSCAR (L:T_LISTA; BUSCADO:STRING[50] ;VAR ENC:BOOLEAN);
    VAR
        E:T_DATO_T;
    BEGIN
        PRIMERO(L);
        WHILE NOT FIN(L) AND (NOT ENC) DO
        BEGIN
            RECUPERAR(L,E);
            IF E.N_CONT = BUSCADO THEN 
                ENC:=TRUE
            ELSE 
                SIGUIENTE (L);
        END;
    END;

    PROCEDURE AGREGAR_ZONA(VAR L:T_LISTA; X:T_DATO_T);
    VAR DIR, ANT : T_PUNT;
    BEGIN
        NEW (DIR);
        DIR^.INFO:= X;
        IF (L.CAB= NIL) OR ((L.CAB^.INFO.ZONA) < (X.ZONA)) THEN
        BEGIN
            DIR^.SIG:= L.CAB;
            L.CAB:= DIR;
        END
        ELSE
        BEGIN
            ANT:= L.CAB;
            L.ACT:= L.CAB^.SIG;
            WHILE (L.ACT <> NIL) AND ((L.ACT^.INFO.ZONA) < (X.ZONA)) DO
            BEGIN
                ANT:= L.ACT;
                L.ACT:= L.ACT^.SIG
            END;
            DIR^.SIG:= L.ACT;
            ANT^.SIG:= DIR;
        END;
        INC(L.TAM)
    END;

    PROCEDURE AGREGAR_FECHA(VAR L:T_LISTA; X:T_DATO_T);
    VAR DIR, ANT : T_PUNT;
    BEGIN
        NEW (DIR);
        DIR^.INFO:= X;
        IF (L.CAB= NIL) OR ((L.CAB^.INFO.F_INC) < (X.F_INC)) THEN
        BEGIN
            DIR^.SIG:= L.CAB;
            L.CAB:= DIR;
        END
        ELSE
        BEGIN
            ANT:= L.CAB;
            L.ACT:= L.CAB^.SIG;
            WHILE (L.ACT <> NIL) AND ((L.ACT^.INFO.F_INC) < (X.F_INC)) DO
            BEGIN
                ANT:= L.ACT;
                L.ACT:= L.ACT^.SIG
            END;
            DIR^.SIG:= L.ACT;
            ANT^.SIG:= DIR;
        END;
        INC(L.TAM)
    END;


end.