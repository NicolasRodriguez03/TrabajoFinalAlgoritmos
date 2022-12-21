unit menu_listados_ordenados;

interface
uses listados_ordenados, CRT, DEFINICION_DATOS, Arboles, manejo_archivo_CONT, manejo_archivo_TERR, MANEJO_CONTRIBUYENTES;
procedure menu_listados;

implementation

  procedure menu_listados;
  var resp,x: string; ARBOL_AYN,ARBOL_DNI:T_PUNT_A;
  begin
    Clrscr;
    crear_abrir_T(arch_t);
    crear_abrir_c(arch_c);
    CHEQUEO_ESTADO(ARCH_C, ARCH_T);
    gotoxy(44,10);
    textcolor(green);
    WRITELN ('MENU DE LISTADOS ORDENADOS E IMPRESION');
    textcolor(black);
    gotoxy(39,11);
    Writeln ('1) Mostrar Ordenado por apellido y nombre');
    gotoxy(39,12);
    Writeln (Utf8ToAnsi('2) Mostrar Ordenado por fecha de inscripcion en un año determinado'));
    gotoxy(39,13);
    Writeln ('3) Mostrar Ordenado por zona');
    gotoxy(39,14);
    Writeln (Utf8ToAnsi('4) Impresión de comprobante'));
    gotoxy(42,15);
    Writeln ('Respuesta: ');
    gotoxy(54,15);
    Readln (resp);
    case resp OF
      '1':BEGIN
          Clrscr;
          CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
          textcolor(green);
          FILA_P_AYN;
          textcolor(black);
          listado_ordenado_ayn(arch_c, arch_t, ARBOL_AYN, 1);
          readkey;
          end;
      '2':BEGIN
          ClrScr;
          Writeln(Utf8ToAnsi('Ingrese año'));
          Readln (x);
          ClrScr;
          textcolor(green);
          FILA_P_FECHA;
          textcolor(black);
          LISTADO_FECHA(ARCH_T, x);
          WriteLn('');
          WriteLn('Ingrese cualquier tecla para continuar');
          readkey;
          end;
      '3':BEGIN
          ClrScr;
          textcolor(green);
          FILA_P_ZONA;
          textcolor(black);
          LISTADO_ZONA(ARCH_T);
          WriteLn('');
          WriteLn('Ingrese cualquier tecla para continuar');
          readkey;
          end;
      '4':BEGIN
          ClrScr;
          CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
          Clrscr;
          comprobante(arbol_ayn, ARBOL_DNI, arch_c, arch_t);
          readkey;
          end;
    end;
    close(arch_c);
    close(arch_t);
  END;

END.