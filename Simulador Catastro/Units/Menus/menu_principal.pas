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
   Clrscr;
   Writeln ('MENU PRINCIPAL');
   Writeln ('1) Manejo de Contribuyentes');
   Writeln ('2) Manejo de Terrenos');
   Writeln ('3) Listados Ordenados e Impresion');
   Writeln (Utf8ToAnsi('4) Estadísticas'));
   Writeln ('O ingresa cualquier otra tecla para regresar al menu principal');
   Writeln();
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

