unit menu_listados_ordenados;

interface
uses listados_ordenados, CRT, DEFINICION_DATOS, Arboles, MANEJO_ARBOLES, manejo_archivo_CONT, manejo_archivo_TERR, MANEJO_CONTRIBUYENTES;
procedure menu_listados();

implementation

  procedure menu_listados();
  var resp,x: string;  N_DNI:STRING; POS:LongInt; ARBOL_AYN,ARBOL_DNI:T_PUNT_A; 
  begin
  Clrscr;
  crear_abrir_T(arch_t);
  crear_abrir_c(arch_c);
  CHEQUEO_ESTADO(ARCH_C, ARCH_T);
  WRITELN ('MENU DE LISTADOS ORDENADOS E IMPRESION');
  Writeln ('1) Mostrar Ordenado por apellido y nombre');
  Writeln ('2) Mostrar Ordenado por fecha de inscripcion en un anio determinado');
  Writeln ('3) Mostrar Ordenado por zona');
  Writeln (Utf8ToAnsi('4) Impresión de comprobante'));
  Readln (resp);
  If resp='1' then
    BEGIN
    Clrscr;
      CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
    FILA_P_AYN ();
    listado_ordenado_ayn(arch_c, arch_t, ARBOL_AYN, 1);
    readkey;
    end
  else
    if resp='2' then
      BEGIN
      ClrScr;
      Writeln(Utf8ToAnsi('Ingrese año'));
      Readln (x);
      ClrScr;
      FILA_P_FECHA();
      LISTADO_FECHA(ARCH_T, x);
      WriteLn('');
      WriteLn('Ingrese cualquier tecla para continuar');
      readkey;
      end
    else
      if resp='3' then
        BEGIN
        ClrScr;
        FILA_P_ZONA();
        LISTADO_ZONA(ARCH_T);
        WriteLn('');
        WriteLn('Ingrese cualquier tecla para continuar');
        readkey;
        end
      else
        if resp='4' then
          BEGIN
          ClrScr;
          CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
          CONSULTA(ARBOL_DNI, POS, N_DNI);
          Clrscr;
          comprobante(ARBOL_DNI, arch_c, arch_t, POS);
          readkey;
          end
        ELSE
          begin
          ClrScr;
          Writeln ('El valor ingresado no es valido, presione cualquier tecla para continuar');
          readkey;
          end;
  close(arch_c);
  close(arch_t);
  END;

END.
