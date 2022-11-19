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
    PROCEDURE CREAR_ARBOL (VAR ARBOL: T_PUNT);
    PROCEDURE AGREGAR_ARBOL (VAR ARBOL: T_PUNT, X:T_DATO_ARBOL);

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

    procedure leer_clave(var x:string; var clave:string);
    begin
    Writeln ('Desea buscar por NOMBRE o DNI?')
    Readln (x);
    If (x=nombre) or (x=NOMBRE) or (x=Nombre) then
        begin
        Writeln ('Ingrese nombre')
        Readln (CLAVE);
        end;
    ELSE
        begin
        Writeln ('Ingrese DNI')
        Readln (CLAVE)
        end;
    end;

    procedure buscar_en_arbol(x:string; clave:string; var pos:CARDINAL);
    begin
    If (x=nombre) or (x=NOMBRE) or (x=Nombre) then
        begin
        busqueda_arbol(arbol_nombre, pos, clave);
        end;
    else
        begin
        busqueda_arbol(arbol_dni, pos, clave);
        end;
    end;

    procedure busqueda_arbol(x: STRING; VAR ARBOL: T_PUNT; var pos: CARDINAL);         //ESTO FALTA
        begin
    IF ARBOL=NIL THEN 
    POS:= -1;
    ELSE 
    IF X=ARBOL.INFO.CLAVE THEN 
        POS:=ARBOL.INFO.POS_ARCH
    ELSE 
       IF  X > ARBOL.CLAVE THEN 
        busqueda_arbol (X,ARBOL.H_D,POS);
        ELSE 
        busqueda_arbol (X,ARBOL.H_I,POS);
end;


end.