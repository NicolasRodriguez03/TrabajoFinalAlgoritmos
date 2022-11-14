unit ARBOLES;

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
    PROCEDURE CREAR_ARBOL (VAR ARBOL: T_PUNT);
    PROCEDURE AGREGAR_ARBOL (VAR ARBOL: T_PUNT, X:T_DATO_ARBOL);

implementation

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

end.