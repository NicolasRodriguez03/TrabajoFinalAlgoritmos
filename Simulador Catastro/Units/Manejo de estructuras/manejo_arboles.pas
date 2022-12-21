unit manejo_Arboles;

interface
  USES
     CRT, manejo_archivo_cont, definicion_datos, Arboles;
  
  PROCEDURE CONSULTA(VAR ARBOL:T_PUNT_A; var pos:LongInt; CLAVE:STRING);
  PROCEDURE MUESTRA_DATOS (VAR ARCH_C:ARCHIVO_C ; ARBOL: T_PUNT_A);
  FUNCTION PREORDEN(ARBOL:T_PUNT_A; BUSCADO:STRING):T_PUNT_A;

implementation
  PROCEDURE MUESTRA_DATOS (VAR ARCH_C:ARCHIVO_C; ARBOL: T_PUNT_A);  // Muestra los datos del archivo en la posicion contenida por nodo de arbol dado
  VAR
    X:WORD;
  BEGIN
    X:= ARBOL^.INFO.POS_ARCH;
    MOSTRAR_DATOS_C(arch_c,x);
  END;

  FUNCTION PREORDEN(ARBOL:T_PUNT_A; BUSCADO:STRING):T_PUNT_A; // Realiza una busqueda preorden, se usa en el arbol de apellido y nombre
  BEGIN
  IF (ARBOL = NIL) THEN
    PREORDEN:= NIL
  ELSE
    IF ( ARBOL^.INFO.CLAVE = BUSCADO) THEN
      PREORDEN:= ARBOL
    ELSE
      IF ARBOL^.INFO.CLAVE > BUSCADO THEN
        PREORDEN := PREORDEN(ARBOL^.H_I,BUSCADO)
      ELSE
        PREORDEN := PREORDEN(ARBOL^.H_D,BUSCADO)
  END;

  PROCEDURE CONSULTA(VAR ARBOL:T_PUNT_A; var pos:LongInt; CLAVE:STRING); // Realiza una busqueda por preorden y devuelve la posicion en el archivo
  VAR
    AUX:T_PUNT_A;
  begin
    POS:=-1;
      AUX:= PREORDEN(ARBOL, CLAVE);
    IF AUX<>NIL THEN
      POS:= AUX^.INFO.POS_ARCH;
    end;

end.