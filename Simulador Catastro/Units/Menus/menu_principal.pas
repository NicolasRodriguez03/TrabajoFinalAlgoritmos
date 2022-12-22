unit menu_principal;

interface
uses
 menu_contribuyentes, definicion_datos, manejo_archivo_CONT,
 ARBOLES, MANEJO_ARBOLES, manejo_contribuyentes,
 menu_estadisticas, Graficos,
 menu_listados_ordenados,
 menu_terrenos, UnicodeCRT;

PROCEDURE MENU;

implementation
  PROCEDURE MENU;
  var
    resp:char;
    ARBOL_AYN, ARBOL_DNI:T_PUNT_A;
  begin
    crear_abrir_C(arch_c);
    CARGAR_ARBOL (ARCH_C, ARBOL_AYN, ARBOL_DNI);
    close (arch_c);
    textbackground(white);
    Clrscr;
    gotoxy (48,10);
    textcolor(red);
    Writeln ('MENU PRINCIPAL');
    textcolor(black);
    Box(37,9, 73,16);
    gotoxy (39,11);
    Writeln ('1) Manejo de Contribuyentes');
    gotoxy (39,12);
    Writeln ('2) Manejo de Terrenos');
    gotoxy (39,13);
    Writeln ('3) Listados Ordenados e Impresion');
    gotoxy (39,14);
    Writeln ('4) Estadísticas');
    gotoxy (42,15);
    writeln ('Respuesta: ');
    gotoxy (53,15);
    Readln (resp);
    case (resp) OF
      '1': M_CONTRIBUYENTES(ARBOL_AYN, ARBOL_DNI);
      '2': m_terrenos(ARBOL_AYN, ARBOL_DNI);
      '3': MENU_listados(ARBOL_AYN, ARBOL_DNI);
      '4': M_ESTADISTICAS;
    end;
    menu;
  END;

END.