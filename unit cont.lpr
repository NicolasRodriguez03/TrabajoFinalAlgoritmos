unit CONTRIBUYENTE;

interface

const
    ruta_cont='C:\TrabajoFinal\Contribuyentes.dat';

type
    DATOS_CONT: RECORD			// Registro de datos de cada contribuyentes, estan almacenados en el archivo
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

	ARCHIVO_C= FILE OF DATO_CONT	// Define al archivo de contribuyentes como un archivo compuesto por registros DATOS_CONT (linea 16)
end;

implementation

Procedure crear_abrir(var ARCH_C:ARCHIVO_C);
begin
  assign(ARCH_C, ruta_cont);
  {$i-}
  reset(ARCH_C);
  {$i+}
  if ioresult <> 0 then
    rewrite(ARCH_C);

end;
end.