unit manejo_Arboles;

interface
  USES
     CRT, manejo_archivo_cont, definicion_datos, Arboles;
  procedure leer_clave(var x:string; var clave:string);
  PROCEDURE CONSULTA(VAR ARBOL:T_PUNT_A; var pos:CARDINAL; CLAVE:STRING);
 PROCEDURE BUSCAR (ARBOL:T_PUNT_A; VAR POS:CARDINAL);
  PROCEDURE MUESTRA_DATOS (VAR ARCH_C:ARCHIVO_C ; ARBOL: T_PUNT_A);
  FUNCTION PREORDEN(ARBOL:T_PUNT_A; BUSCADO:STRING):T_PUNT_A;
  PROCEDURE AGREGAR (VAR ARBOL:T_PUNT_A; X:T_DATO_ARBOL);
  PROCEDURE SUPRIMIR_NODO (VAR ARBOL:T_PUNT_A);
  PROCEDURE ELIMINA_NODO(ARBOL:T_PUNT_A;BUSCADO:STRING);

implementation
    procedure leer_clave(var x:string; var clave:string); // Lee la clave y el tipo al que pertenece
    begin
    Writeln ('Desea por apellido y nombre, o por DNI? (Ingresar "Apellido y nombre" o "DNI")');
    Readln (x);
    Writeln ('Ingrese su clave de busqueda');
    Readln (CLAVE);
    end;

PROCEDURE MUESTRA_DATOS (VAR ARCH_C:ARCHIVO_C; ARBOL: T_PUNT_A);  // Muestra los datos del archivo en la posicion contenida por nodo de arbol dado
VAR
  X:WORD;
BEGIN
X:= ARBOL^.INFO.POS_ARCH;
MOSTRAR_DATOS_C(arch_c,x);
END;

FUNCTION PREORDEN(ARBOL:T_PUNT_A; BUSCADO:STRING):T_PUNT_A; // Realiza una busqueda preorden, se usa en el arbol de apellido y nombre
BEGIN
IF (ARBOL = NIL) THEN PREORDEN := NIL
ELSE
  IF ( ARBOL^.INFO.CLAVE = BUSCADO) THEN
    PREORDEN:= ARBOL
  ELSE IF ARBOL^.INFO.CLAVE > BUSCADO THEN
    PREORDEN := PREORDEN(ARBOL^.H_I,BUSCADO)
  ELSE
    PREORDEN := PREORDEN(ARBOL^.H_D,BUSCADO)
END;

PROCEDURE CONSULTA(VAR ARBOL:T_PUNT_A; var pos:CARDINAL; CLAVE:STRING); // Realiza una busqueda por preorden y devuelve la posicion en el archivo
VAR
  AUX:T_PUNT_A;
begin
  POS:=-1;
    AUX:= PREORDEN(ARBOL, CLAVE);
  IF AUX<>NIL THEN
    POS:= AUX^.INFO.POS_ARCH;
  end;

PROCEDURE BUSCAR (ARBOL:T_PUNT_A; VAR POS:CARDINAL);  // Es el comando que se usa cuando se invoca cuando se quiere realizar la consulta
VAR CLAVE,X:STRING;
BEGIN
 ClrScr;
 IF ARBOL_VACIO (ARBOL) THEN
  WriteLn ('El arbol se encuentra vacio')
 ELSE
   LEER_CLAVE(X,CLAVE);
  CONSULTA(ARBOL,POS,CLAVE);
 end;

PROCEDURE AGREGAR (VAR ARBOL:T_PUNT_A; X:T_DATO_ARBOL); // Agrega un record de dato_arbol al arbol dado, si no existe lo genera
BEGIN
IF ARBOL = NIL THEN
BEGIN
NEW (ARBOL);
ARBOL^.INFO:= X;
ARBOL^.H_I:= NIL;
ARBOL^.H_D:= NIL;
END
ELSE IF ARBOL^.INFO.CLAVE > X.CLAVE THEN
AGREGAR (ARBOL^.H_I,X)
ELSE
AGREGAR (ARBOL^.H_D,X)
END;


PROCEDURE SUPRIMIR_NODO (VAR ARBOL:T_PUNT_A); // 
VAR
 ANT, TEMP: T_PUNT_A;
BEGIN
  TEMP:= ARBOL;
  IF ARBOL^.H_D = nil THEN
    ARBOL:=ARBOL^.H_I
  ELSE
    IF ARBOL^.H_I = nil THEN
      ARBOL:= ARBOL^.H_D
    ELSE
    BEGIN
      TEMP:= ARBOL^.H_I;
      ANT:= ARBOL;
      WHILE TEMP^.H_D <> nil DO
      BEGIN
        ANT:= TEMP;
        TEMP:= ARBOL^.H_D;
      end;
      ARBOL^.INFO:= TEMP^.INFO;
      IF ANT = ARBOL THEN
        ANT^.H_I:= TEMP^.H_I
      ELSE
        ANT^.H_D:= TEMP^.H_I;
    end;
    DISPOSE (TEMP);
end;

PROCEDURE ELIMINA_NODO(ARBOL:T_PUNT_A;BUSCADO:STRING);  //
VAR
  ARBOL1:T_PUNT_A;
BEGIN
  ARBOL1:= PREORDEN (ARBOL,BUSCADO);
  SUPRIMIR_NODO (ARBOL1);
end;


end.
