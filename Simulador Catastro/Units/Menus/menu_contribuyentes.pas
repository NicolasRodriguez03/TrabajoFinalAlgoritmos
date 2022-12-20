unit menu_contribuyentes;

interface
USES CRT, manejo_arboles, MANEJO_CONTRIBUYENTES, Arboles, DEFINICION_DATOS, MANEJO_ARCHIVO_CONT, MANEJO_ARCHIVO_TERR;
PROCEDURE M_CONTRIBUYENTES;

implementation

  PROCEDURE M_CONTRIBUYENTES;
  VAR POS: LongInt; OP_1,OP,CLAVE1, CLAVE2:STRING; ARBOL_AYN,ARBOL_DNI:T_PUNT_A;
      X:BOOLEAN;
  BEGIN
    Clrscr;
    CLAVE2:='';
    crear_abrir_C(arch_c);
    crear_abrir_T(arch_t);
    CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
    CHEQUEO_ESTADO(ARCH_C, ARCH_T);
    leer_clave(x, clave1, clave2);
    If x then
      Consulta(ARBOL_AYN, pos, (CONCAT(clave1, ' ', clave2)) )
    ELSE
      Consulta(ARBOL_DNI, pos, clave1);
    ClrScr;
    if pos>=0 then
    begin
      Writeln ('MENU DE CONTRIBUYENTES');
      MOSTRAR_DATOS_C(ARCH_C, POS);
      Writeln();
      Writeln ('-1 Baja');
      Writeln (Utf8ToAnsi('-2 Modificación'));
      Writeln ('O ingrese cualquier otra tecla para regresar al menu principal');
      Writeln();
      READ (OP);
      case (OP) OF
        '1':begin
              ClrScr;
              BAJA(ARCH_C, POS);
            end;
        '2':begin
             ClrScr;
              MODIFICACION_C(ARCH_C,POS);
              readkey;
            end;
      end;
    end
    else
    begin
      Writeln('Contribuyente ', CONCAT(CLAVE1, ' ', CLAVE2),' no encontrado, desea realizar el alta? (si/no)');
      Readln (OP_1);
      IF (OP_1='SI') OR (OP_1='Si') or (OP_1='si') then
      begin
        ClrScr;
        Writeln ('Realizando ALTA');
        ALTA_C(ARCH_C, x, clave1, clave2);
      end;
    end;
    close(arch_c);
    close(arch_t);
  END;

end.