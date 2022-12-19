unit menu_contribuyentes;

interface
USES CRT, manejo_arboles, MANEJO_CONTRIBUYENTES, Arboles, DEFINICION_DATOS, MANEJO_ARCHIVO_CONT, MANEJO_ARCHIVO_TERR;
PROCEDURE M_CONTRIBUYENTES();

implementation

  PROCEDURE M_CONTRIBUYENTES();
  VAR POS: LongInt; OP_1,OP,X,CLAVE:STRING; ARBOL_AYN,ARBOL_DNI:T_PUNT_A;
  BEGIN
  Clrscr;
  crear_abrir_C(arch_c);
  crear_abrir_T(arch_t);
  CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
  CHEQUEO_ESTADO(ARCH_C, ARCH_T);
  leer_clave(x,clave);
  If (x='nombre') or (x='NOMBRE') or (x='nombre') then
    Consulta(ARBOL_AYN, pos, clave)
  ELSE
    Consulta(ARBOL_DNI, pos, clave);
  if pos>=0 then
    begin
    Writeln ('MENU DE CONTRIBUYENTES');
    Writeln ('1) Baja');
    Writeln (Utf8ToAnsi('2) Modificación'));
    Writeln ('3) Consulta');
    READ (OP);
    If OP='1' then
        BAJA(ARCH_C, POS)
    else
        begin
        if OP='2' then
          MODIFICACION_C(ARCH_C,POS)
        else
          begin
          if OP='3' then
              BEGIN
              ClrScr;
              MOSTRAR_DATOS_C(ARCH_C, POS);
              Writeln('Presione cualquier tecla para continuar');
              readkey;
              END
          else
            Writeln (Utf8ToAnsi('Ingrese un valor válido'));
          end;
        end;
    end
  else
    begin
    Writeln('Contribuyente no encontrado, desea realizar el alta? (si/no)');
    Readln (OP_1);
    IF (OP_1='SI') OR (OP_1='Si') or (OP_1='si') then
      begin
      ClrScr;
      Writeln ('Realizando ALTA');
      ALTA_C(ARCH_C, ARBOL_AYN, ARBOL_DNI);
      end;
    end;
  close(arch_c);
  close(arch_t);
  END;

end.
