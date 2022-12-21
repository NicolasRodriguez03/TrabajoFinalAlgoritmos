unit menu_principal;

interface
uses
 menu_contribuyentes,
 menu_estadisticas, Graficos,
 menu_listados_ordenados,
 menu_terrenos, UnicodeCRT;

PROCEDURE MENU;

implementation
  PROCEDURE MENU;
  var
    resp:BYTE;
  begin
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
      1: M_CONTRIBUYENTES;
      2: m_terrenos;
      3: MENU_listados;
      4: M_ESTADISTICAS;
    end;
    menu;
  END;

END.
