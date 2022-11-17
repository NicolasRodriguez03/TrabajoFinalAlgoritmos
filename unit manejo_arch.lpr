unit manejo_contribuyente;

interface
uses
  unit_archivo;
  unit_arboles;
    PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C, VAR ARBOL:T_PUNT);
    PROCEDURE ALTA(r: DATO_CONT; var ARCH_C: ARCH_C);
    PROCEDURE CARGAR_T(VAR X: DATOS_CONT);
    PROCEDURE GUARDA_DATO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    


implementation

PROCEDURE RECUP_ARCH_DNI (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
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

    PROCEDURE RECUP_ARCH_AYN (VAR ARCH_C:ARCHIVO_C; VAR ARBOL:T_PUNT);      // ANTES VERIFICAR QUE EXISTA EL ARCHIVO
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
      with (R) do
      begin
          GUARDAR_DATO (ARCH_C,POS,R);
          AGREGAR_ARBOL(R);
      end;
    end;

    PROCEDURE GUARDA_DATO(VAR ARCH_C:ARCHIVO_C; var POS:WORD; REG:DATOS_CONT);
    BEGIN
        SEEK(ARCH_C, POS);
        WRITE(ARCH_C, REG);
    END;

end.