///////////////////////////////// SECCION DE CONTRIBUYENTES /////////////////////////////////

Type
	T_DATO_ARBOL= RECOR			// Registro del nodo de busqueda, almacena el dato clave a buscar, y la posición dentro del archivo
		POS_ARCH:WORD;
		CLAVE: STRING [100];
	end;

	T_PUNT= ^T_NODO;		// Puntero de los nodos de busqueda

	T_NODO= RECORD			// Nodo de busqueda
		INFO: DATOS_CONT;
		H_I,H_D: T_PUNT;
	END;

	ARBOL_DNI: T_PUNT;			// Arbol de busqueda ordenado por DNI
	ARBOL_AYN: T_PUNT;			// Arbol de busqueda ordenado por apoellido y nombre

	DATOS_CONT: RECORD			// Registro de datos de cada contribuyentes, estan almacenados en el archivo
		N_CONT: STRING [8];		// Numero de contribuyente
		APPELLIDO:string[30];
		NOMBRE: STRING [30];
		DIREC: STRING [30];
		CIUDAD: STRING [20];
		DNI: STRING [10];
		F_NAC: STRING[10];
		TEL: STRING [15];
		MAIL: STRING [50];
		ESTADO: BOOLEAN;
	END;

	T_ARCHIVO_C= DATOS_CONT;			//// Creo que esto es redundante, si lo borramos hay que fijarnos que no aparezca en el argumento de los procedimientos
	END;

	ARCHIVO_C= FILE OF T_ARCHIVO_C		// Define al archivo de contribuyentes como un archivo compuesto por registros DATOS_CONT (linea 19)
end;

VAR
	ARCH_C:ARCHIVO_C
end;

///// Seccion de procedimientos de contribuyentes /////

PROCEDURE ALTA_CONTRIBUYENTE ()
var 
begin

end;

PROCEDURE ALTA(r: DATO_CONT; var ARCH_C: ARCH_C);
var
begin
	with (r) do
	begin
		GUARDAR_DATO (ARCH_C,POS,R);
		GUARDAR_ARBOL_DNI();					// Estos no nos tenemos que
		GUARDAR_ARBOL_NOMBRES()					// olvidar de definirlos
	end;
end;

PROCEDURE GUARDA_REGISTRO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
BEGIN
	SEEK(ARCH_C, POS);
	WRITE(ARCH_C, REG);
END;




///////////////////////////////// SECCION DE TERRENOS /////////////////////////////////

Type

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

	T_ARCHIVO_T= T_LISTA;							// Define al tipo de archivo,					// esto también creo que es redundante 
	END;

	ARCHIVO_T= FILE OF T_ARCHIVO_T					// Define a la lista como una serie de listas
end;

VAR
	ARCH_T: ARCHIVO_T;
end;

///// Seccion de procedimientos de terrenos /////

PROCEDURE CARGAR_T(VAR X: T_DATO_T);
VAR
BEGIN
	with (X) do
	begin
		Writeln (‘Ingrese numero de contribuyente’);
		Readln(N_CONT);
		Writeln (‘Ingrese número de plano de mensura’);
		Readln (N_MENS);
		Writeln (‘Ingrese domicilio parcelario’);
		Readln (DOMICILIO);
		Writeln (‘Ingrese superficie en metros cuadrados’);
		Readln (SUPERFICIE);
		Writeln (‘Ingrese zona’);
		Readln (ZONA);
		Writeln (‘Ingrese tipo de edificación’);
		Readln (TIPO_E);
	end;
END;

PROCEDURE AVALUO(VAR X:T_DATO_T)
VAR
	AUX._ZONA, AUX_TIPO_E, BASICO:REAL;
BEGIN
	BASICO:=12308.60;
	CASE X.ZONA OF
		1: AUX._ZONA:= 1.5
		2: AUX._ZONA:= 1.1
		3: AUX._ZONA:= 0.7
		4: AUX._ZONA:= 0.4
		5: AUX._ZONA:= 0.1
	END;
	CASE X.TIPO_E OF
		1: AUX._TIPO_E:= 1.7;
		2: AUX._TIPO_E:= 1.3;
		3: AUX._TIPO_E:= 1,1;
		4: AUX._TIPO_E:= 0,8;
		5: AUX._TIPO_E:= 0,5;
	END;
	X.AVALUO:= BASE*X.SUPERFICIE*AUX_ZONA*AUX_TIPO_E;
END;

PROCEDURE GUARDAR_DATO (VAR ARCH: ARCHIVO_T, POS:CARDINAL; REG:T_DATO_T)
BEGIN
	SEEK(ARCH, POS);
	WRITE(ARCH, REG);
END;

PROCEDURE ALTA_T (VAR ARCH_T: ARCHIVO_T)
VAR
BEGIN
	CARGAR_T(X);
	AVALUO(X);
	GUARDAR_DATO (ARC_T,POS,X)
END;