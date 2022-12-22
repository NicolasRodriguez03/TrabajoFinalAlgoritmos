unit menu_contribuyentes;

interface
USES CRT, manejo_arboles, MANEJO_CONTRIBUYENTES, Arboles, DEFINICION_DATOS, MANEJO_ARCHIVO_CONT, MANEJO_ARCHIVO_TERR;
PROCEDURE M_CONTRIBUYENTES(ARBOL_AYN, ARBOL_DNI:T_PUNT_A);

implementation

  PROCEDURE M_CONTRIBUYENTES(ARBOL_AYN, ARBOL_DNI:T_PUNT_A);
  VAR POS: LongInt; OP_1,OP,CLAVE1, CLAVE2:STRING;
      X:BOOLEAN;
  BEGIN
    textbackground(white);
    Clrscr;
    CLAVE2:='';
    crear_abrir_C(arch_c);
    crear_abrir_T(arch_t);
    CHEQUEO_ESTADO(ARCH_C, ARCH_T);
    leer_clave(x, clave1, clave2);
    if clave1<>('') then
    begin
      If x then
        Consulta(ARBOL_AYN, pos, (CONCAT(clave1, ' ', clave2)) )
      ELSE
        Consulta(ARBOL_DNI, pos, clave1);
      ClrScr;
      if pos>=0 then
      begin
        gotoxy (10,1);
        textcolor(blue);
        Writeln ('MENU DE CONTRIBUYENTES');
        textcolor(black);
        MOSTRAR_DATOS_C(ARCH_C, POS);
        Writeln();
        Writeln ('-1 Baja');
        Writeln ('-2 Modificación');
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
                ClrScr;
                MOSTRAR_DATOS_C(arch_c,pos);
                Writeln();
                Writeln('Presione cualquier tecla para continuar');
                readkey;
              end;
        end;
        close(arch_c);
        close(arch_t);
      end
      else
      begin
        Writeln('Contribuyente ', CONCAT(CLAVE1, ' ', CLAVE2),' no encontrado, desea realizar el alta? (si/no)');
        Readln (OP_1);
        IF (OP_1='SI') OR (OP_1='Si') or (OP_1='si') then
        begin
          ClrScr;
          Writeln ('Realizando ALTA');
          ALTA_C(arbol_dni, ARCH_C, x, clave1, clave2);
        end;
      close(arch_c);
      close(arch_t);
      end;
    end
    else
    begin
      close(arch_c);
      close(arch_t);
      Writeln('Por favor ingrese una clave válida');
      Writeln('Presione cualquier tecla para volver al menú de contribuyentes');
      readkey;
    M_CONTRIBUYENTES(ARBOL_AYN, ARBOL_DNI);
    end;
  end;

end.