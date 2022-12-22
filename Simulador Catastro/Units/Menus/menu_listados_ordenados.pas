unit menu_listados_ordenados;

interface
uses listados_ordenados, unicodeCRT, DEFINICION_DATOS, Arboles, manejo_archivo_CONT, manejo_archivo_TERR, MANEJO_CONTRIBUYENTES,
      graficos, validacion;
procedure menu_listados(ARBOL_AYN, ARBOL_DNI:T_PUNT_A);

implementation
    procedure Titulo_Menu;
    begin
      gotoxy(36,10);
      textcolor(green);
      WRITELN ('MENU DE LISTADOS ORDENADOS E IMPRESION');
      textcolor(black);
    end;

  procedure menu_listados(ARBOL_AYN, ARBOL_DNI:T_PUNT_A);
  var resp,x: char;
  begin
    textbackground(white);
    Clrscr;
    crear_abrir_T(arch_t);
    crear_abrir_c(arch_c);
    CHEQUEO_ESTADO(ARCH_C, ARCH_T);
    Box(30,9, 80,17);
    titulo_menu;
    gotoxy(33,11);
    Writeln ('1) Mostrar Ordenado por apellido y nombre');
    gotoxy(33,12);
    Writeln ('2) Mostrar Ordenado por fecha de inscripcion');
    Gotoxy(36,13);
    write('en un año determinado');
    gotoxy(33,14);
    Writeln ('3) Mostrar Ordenado por zona');
    gotoxy(33,15);
    Writeln ('4) Impresión de comprobante');
    gotoxy(42,16);
    Writeln ('Respuesta: ');
    gotoxy(54,16);
    Readln (resp);
    case resp OF
      '1':BEGIN
          Clrscr;
          textcolor(green);
          FILA_P_AYN;
          textcolor(black);
          listado_ordenado_ayn(arch_c, arch_t, ARBOL_AYN, 1);
          readkey;
          end;
      '2':BEGIN
          ClrScr;
          Box(30,9, 80,17);
          titulo_menu;
          Gotoxy(48,12);
          Write('Ingrese año');
          gotoxy(53,14);
          Readln (x);
          while not(chequeo_fecha(x)) do
          begin
            WRITELN ('Fecha inválida, por favor intente nuevamente');
            readln (x); 
          end;
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
          comprobante(arbol_ayn, ARBOL_DNI, arch_c, arch_t);
          readkey;
          end;
    end;
    close(arch_c);
    close(arch_t);
  END;

END.