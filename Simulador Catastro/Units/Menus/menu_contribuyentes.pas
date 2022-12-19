unit menu_contribuyentes;

interface
USES CRT, manejo_arboles, MANEJO_CONTRIBUYENTES, Arboles, DEFINICION_DATOS, MANEJO_ARCHIVO_CONT;
PROCEDURE M_CONTRIBUYENTES();

implementation

  PROCEDURE M_CONTRIBUYENTES();
  VAR POS: LongInt; OP_1,OP,X,CLAVE:STRING; ARBOL_AYN,ARBOL_DNI:T_PUNT_A;
  BEGIN
  Clrscr;
  crear_abrir_C(arch_c);
  CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
  leer_clave(x,clave);
    If (x='Apellido y nombre') or (x='APELLIDO Y NOMBRE') or (x='apellido y nombre') then
      Consulta(ARBOL_AYN, pos, clave)
    ELSE
      Consulta(ARBOL_DNI, pos, clave);
    if pos>=0 then
      begin
          Writeln ('MENU DE CONTRIBUYENTES');
          Writeln ('1) Baja');
          Writeln ('2) Modificacion');
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
                      MOSTRAR_DATOS_C(ARCH_C, POS)
                      readkey;
                      END;
                  else
                    Writeln ('Ingrese un valor valido')
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
  END;

end.
