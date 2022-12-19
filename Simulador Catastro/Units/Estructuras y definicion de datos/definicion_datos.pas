unit definicion_datos;

interface
const
    ruta_terr='C:\Users\Standard\Downloads\Simulador Catastro\Archivos\Terrenos.dat';
    ruta_cont='C:\Users\Standard\Downloads\Simulador Catastro\Archivos\Contribuyentes.dat';

Type
	T_DATO_T= RECORD							// Registro de datos de cada terreno, está contenido en la info de los nodos
		N_CONT: STRING [8];		// Numero de contribuyente
		N_MENS: STRING[15];		// Numero de plano de mensura
		AVALUO: REAL;
		F_INC: STRING[10];
		DOMICILIO: STRING [60];
		SUPERFICIE: REAL;
		ZONA: BYTE;
		TIPO_E: BYTE;		// Tipo de la edificación
	END;

    DATOS_CONT= RECORD			// Registro de datos de cada contribuyentes, estan almacenados en el archivo
		N_CONT: STRING [8];		// Numero de contribuyente
		APELLIDO:string[30];
		NOMBRE: STRING [30];
		DIREC: STRING [30];
		CIUDAD: STRING [20];
		DNI: STRING [10];
		F_NAC: STRING[10];
		TEL: STRING [15];
		MAIL: STRING [50];
		ESTADO: BOOLEAN;
	END;

	ARCHIVO_C= FILE OF DATOS_CONT;
	ARCHIVO_T= FILE OF T_DATO_T;


VAR
    ARCH_C: ARCHIVO_C;
    ARCH_T: ARCHIVO_T;


IMPLEMENTATION


END.