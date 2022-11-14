///////////////////////////////// SECCION DE CONTRIBUYENTES /////////////////////////////////
	

VAR
	ARCH_C:ARCHIVO_C; ARBOL_DNI, ARBOL_AYN:T_PUNT;
end;



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




