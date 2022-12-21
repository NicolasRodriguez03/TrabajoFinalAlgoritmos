unit menu_principal;

interface
uses
 menu_contribuyentes,
 menu_estadisticas,
 menu_listados_ordenados,
 menu_terrenos, CRT;

PROCEDURE MENU;

implementation
  PROCEDURE MENU;
  var
    resp:BYTE;
  begin
    textbackground(white);
    Clrscr;
    gotoxy (47,10);
    textcolor(red);
    Writeln ('MENU PRINCIPAL');
    textcolor(black);
    gotoxy (39,11);
    Writeln ('1) Manejo de Contribuyentes');
    gotoxy (39,12);
    Writeln ('2) Manejo de Terrenos');
    gotoxy (39,13);
    Writeln ('3) Listados Ordenados e Impresion');
    gotoxy (39,14);
    Writeln (Utf8ToAnsi('4) Estadísticas'));
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

