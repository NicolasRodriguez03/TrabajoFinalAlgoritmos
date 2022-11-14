unit CONTRIBUYENTES;

interface
    PROCEDURE ALTA(r: DATO_CONT; var ARCH_C: ARCH_C);
    PROCEDURE CARGAR_T(VAR X: DATOS_CONT);
    PROCEDURE GUARDA_DATO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);

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

VAR
	ARCH_C:ARCHIVO_C; ARBOL_DNI, ARBOL_AYN:T_PUNT;
end;
  end;

implementation

    PROCEDURE CARGAR_T(VAR X: DATOS_CONT);
    BEGIN
        with (X) do
        begin
            Writeln ('Ingrese numero de contribuyente:');
            Readln(N_CONT);
            Writeln ('Ingrese Apellido:');
            Readln (APELLIDO);
            Writeln ('Ingrese nombre:');
            Readln (nombre);
            Writeln ('Ingrese direccion:');
            Readln (DIREC);
            Writeln ('Ingrese ciudad');
            Readln (ciudad);
            Writeln ('Ingrese DNI:');
            Readln (DNI);
            Writeln ('Ingrese fecha de nacimiento:');
            Readln (F_NAC);
            Writeln ('Ingrese telefono:');
            Readln (TEL);
            Writeln ('Ingrese mail:');
            Readln (mail);
        end;
    END;

    PROCEDURE ALTA(r: DATOS_CONT; var ARCH_C: ARCH_C);
    var
    begin
        with (r) do
        begin
            GUARDAR_DATO (ARCH_C,POS,R);
            GUARDAR_ARBOL();
        end;
    end;




    PROCEDURE GUARDA_DATO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    BEGIN
        SEEK(ARCH_C, POS);
        WRITE(ARCH_C, REG);
    END;

end.