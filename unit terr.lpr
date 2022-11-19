unit TERRENO;

interface
uses
    lista_terreno;


const
    ruta_terr='C:\TrabajoFinal\Terrenos.dat';

Type
	T_DATO_T: RECORD								// Registro de datos de cada terreno, está contenido en la info de los nodos
		N_CONT: STRING [8];		// Numero de contribuyente
		N_MENS: STRING[15]		// Numero de plano de mensura
		AVALUO: REAL;
		F_INC: STRING[10];
		DOMICILIO: STRING [60];
		SUPERFICIE: REAL;
		ZONA: BYTE[1..5]
		TIPO_E: BYTE[1..5]		// Tipo de la edificación
	END;


	ARCHIVO_T= FILE OF T_DATO_T
end;



implementation
Procedure crear_abrir(var ARCH_T:T_DATO_T);
begin
  assign(ARCH_T, ruta_terr);
  {$i-}
  reset(ARCH_T);
  {$i+}
  if ioresult <> 0 then
    rewrite(ARCH_T);
end;

end.