///////////////////////////////// SECCION DE CONTRIBUYENTES /////////////////////////////////
	

VAR
	ARCH_C:ARCHIVO_C; ARBOL_DNI, ARBOL_AYN:T_PUNT;
end;



///////////////////////////////// SECCION DE TERRENOS /////////////////////////////////

Type

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




