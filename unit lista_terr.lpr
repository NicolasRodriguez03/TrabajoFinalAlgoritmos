unit lista_terreno;

interface
    PROCEDURE CREARLISTA (VAR L:T_LISTA);
    PROCEDURE AGREGAR (VAR L:T_LISTA; X:T_DATO_T);
    FUNCTION LISTA_LLENA (VAR L:T_LISTA): BOOLEAN;
    FUNCTION LISTA_VACIA (VAR L:T_LISTA): BOOLEAN;
    PROCEDURE ELIMINARLISTA (VAR L:T_LISTA;BUSCADO: STRING; VAR X:T_DATO_T);
    PROCEDURE SIGUIENTE(VAR L:T_LISTA);
    PROCEDURE PRIMERO (L:T_LISTA);
    PROCEDURE FIN (L:T_LISTA): BOOLEAN;

type

	T_DATO_T: RECORD								// Registro de datos de cada terreno, está contenido en la info de los nodos
		N_CONT: STRING [8];		// Numero de contribuyente
		N_MENS: STRING[15]		// Numero de plano de mensura
		AVALUO: REAL;
		DOMICILIO: STRING [60];
		SUPERFICIE: REAL;
		ZONA: BYTE[1..5]
		TIPO_E: BYTE[1..5]		// Tipo de la edificación
	END;

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

PROCEDURE AGREGAR (VAR L:T_LISTA; X:T_DATO_T);
VAR DIR, ANT : T_PUNT;
BEGIN
    NEW (DIR);
    DIR^.INFO:= X;
    IF (L.CAB= NIL) OR (L.CAB^.INFO.N_CONT > X.N_CONT) THEN
    BEGIN
        DIR^.SIG:= L.CAB;
        L. CAB:=DIR;
    END
    ELSE
    BEGIN
        ANT:= L.CAB;
        L.ACT:= L.CAB^.SIG;
        WHILE (L.ACT <> NIL) AND (L.ACT^.INFO.N_CONT < X.N_CONT) DO
        BEGIN
            ANT:= L.ACT;
            L.ACT:= L.ACT^.SIG
        END;
        DIR^.SIG:= L.ACT;
        ANT^.SIG:= DIR;
    END;
    INC(L.TAM)
END;

PROCEDURE SIGUIENTE(VAR L:T_LISTA);
BEGIN
    L.ACT:= L.ACT^.SIG;
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

PROCEDURE PRIMERO (L:T_LISTA);
BEGIN
    L.ACT = L.CAB;
END;

PROCEDURE FIN (L:T_LISTA): BOOLEAN;
BEGIN
    FIN:= L.ACT = NIL;
END;

FUNCTION LISTA_LLENA (VAR L:T_LISTA): BOOLEAN;
BEGIN
    LISTA_LLENA:= GETHEAPSTATUS.TotalFree < SIZEOF(T_NODO) ;
END;

FUNCTION LISTA_VACIA (VAR L:T_LISTA): BOOLEAN;
BEGIN
    LISTA_VACIA:= L.TAM=0;
END;

PROCEDURE RECUPERAR (L:T_LISTA; VAR E:T);
BEGIN
    E:= L^.INFO;
END;