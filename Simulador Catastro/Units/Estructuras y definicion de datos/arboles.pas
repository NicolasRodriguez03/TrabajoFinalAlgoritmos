unit Arboles;
interface
Type
	T_DATO_ARBOL= RECORD			// Registro del nodo de busqueda, almacena el dato clave a buscar, y la posición dentro del archivo
		POS_ARCH:LongInt;
		CLAVE: STRING [100];
	end;

	T_PUNT_A= ^T_NODO;		// Puntero de los nodos de busqueda

	T_NODO=  RECORD			// Nodo de busqueda
		INFO:T_DATO_ARBOL ;
		H_I,H_D: T_PUNT_A;
	END;


    FUNCTION ARBOL_VACIO (ARBOL:T_PUNT_A): BOOLEAN;
    FUNCTION ARBOL_LLENO (ARBOL:T_PUNT_A): BOOLEAN;
    PROCEDURE CREAR_ARBOL (VAR ARBOL: T_PUNT_A);
    PROCEDURE AGREGAR_ARBOL (VAR ARBOL: T_PUNT_A; X:T_DATO_ARBOL);

implementation

    FUNCTION ARBOL_VACIO (ARBOL:T_PUNT_A): BOOLEAN;
    BEGIN
        ARBOL_VACIO:= (ARBOL = NIL);
    END;

    FUNCTION ARBOL_LLENO (ARBOL:T_PUNT_A): BOOLEAN;
    BEGIN
        ARBOL_LLENO:= GETHEAPSTATUS.TOTALFREE < SIZEOF (T_NODO);
    END;

    PROCEDURE CREAR_ARBOL (VAR ARBOL: T_PUNT_A);
    BEGIN
        ARBOL:= NIL;
    END;

    PROCEDURE AGREGAR_ARBOL (VAR ARBOL: T_PUNT_A; X:T_DATO_ARBOL);
    BEGIN;
    
    IF ARBOL= NIL THEN
        BEGIN
            NEW (ARBOL);
            ARBOL^.INFO:= X;
            ARBOL^.H_I:= NIL;
            ARBOL^.H_D:= NIL;
        END
    else
        begin
            IF ARBOL^.INFO.CLAVE > X.CLAVE THEN
                AGREGAR_ARBOL (ARBOL^.H_I, X)   
            else
                AGREGAR_ARBOL (ARBOL^.H_D, X)
        end;
    END;




end.