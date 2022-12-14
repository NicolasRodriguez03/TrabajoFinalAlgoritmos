unit ARBOLES;
uses contribuyente;

Type
	T_DATO_ARBOL= RECORD			// Registro del nodo de busqueda, almacena el dato clave a buscar, y la posición dentro del archivo
		POS_ARCH:CARDINAL;
		CLAVE: STRING [100];
	end;

	T_PUNT= ^T_NODO;		// Puntero de los nodos de busqueda

	T_NODO=  RECORD			// Nodo de busqueda
		INFO:T_DATO_ARBOL ;
		H_I,H_D: T_PUNT;
	END;

interface
    FUNCTION ARBOL_VACIO (ARBOL:T_PUNT): BOOLEAN;
    FUNCTION ARBOL_LLENO (ARBOL:T_PUNT): BOOLEAN;
    PROCEDURE CREAR_ARBOL (VAR ARBOL: T_PUNT);
    PROCEDURE AGREGAR_ARBOL (VAR ARBOL: T_PUNT, X:T_DATO_ARBOL);
    procedure suprime (var raiz:t_punt; x:t_dato);

implementation

    FUNCTION ARBOL_VACIO (ARBOL:T_PUNT): BOOLEAN;
    BEGIN
        ARBOL_VACIO:= (ARBOL = NIL);
    END;

    FUNCTION ARBOL_LLENO (ARBOL:T_PUNT): BOOLEAN;
    BEGIN
        ARBOL_LLENO:= GETHEAPSTATUS.TOTALFREE < SIZEOF (T_NODO);
    END;

    PROCEDURE CREAR_ARBOL (VAR ARBOL: T_PUNT);
    BEGIN
        ARBOL:= NIL;
    END;

    PROCEDURE AGREGAR_ARBOL (VAR ARBOL: T_PUNT, X:T_DATO_ARBOL);
    BEGIN;
    IF ARBOL= NIL;
        BEGIN
            NEW (ARBOL);
            ARBOL^.INFO:= X;
            ARBOL^.H_I:= NIL;
            ARBOL^.H_D:= NIL;
        END;
    else
        begin
            IF ARBOL^.INFO.CLAVE > X.CLAVE
                AGREGAR_ARBOL (ARBOL^.H_I, X)
            else
                AGREGAR_ARBOL (ARBOL^.H_D, X)
        end;
    END;

procedure suprime (var raiz:t_punt; x:t_dato);
 begin
 if raiz <> nil then
    if x < raiz^.info then
        suprime (raiz^.sai,x);
    else
        if x < raiz^.info then
        suprime (raiz^.sad,x);
    else
        if (raiz^.sai = nil) and (raiz^.sad = nil) then
        raiz:= nil;
        else
            if (raiz^.sai = nil) then
             raiz:= raiz^.sad;
            else
                if (raiz^.sad = nil) then
                raiz:= raiz^.sai;
                else
                    raiz^.info:= suprime_min (raiz^.sad);
 end;


end.