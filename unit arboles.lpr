unit ARBOLES;
uses contribuyentes;

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
    PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);

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

    PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
    VAR 
        POS:CARDINAL;
        AUX:DATOS_CONT;
        AUX_X:T_DATO_ARBOL;
    begin
        POS:=0;
        WHILE NOT(EOF(ARCH_C)) DO
        begin
            SEEK(ARCH_C,POS);
            READ(ARCH_C,AUX);
            AUX_X.CLAVE:= AUX.DNI;
            AUX_X.POS_ARCH:= POS;
            AGREGAR_ARBOL(ARBOL, AUX_X);
            POS:= POS+1;
        end;
        
    end;

    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
    VAR 
        POS:CARDINAL;
        AUX:DATOS_CONT;
        AUX_X:T_DATO_ARBOL;
    begin
        POS:=0;
        WHILE NOT(EOF(ARCH_C)) DO
        begin
            SEEK(ARCH_C,POS);
            READ(ARCH_C,AUX);
            AUX_X.CLAVE:= CONCAT(AUX.APELLIDO, AUX.NOMBRE);
            AUX_X.POS_ARCH:= POS;
            AGREGAR_ARBOL(ARBOL, AUX_X);
            POS:= POS+1;
        end;
        
    end;

end.