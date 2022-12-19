unit menu_principal;

interface
uses
 menu_contribuyentes,
 menu_estadisticas,
 menu_listados_ordenados,
 menu_terrenos, CRT;

PROCEDURE MENU();

implementation
  PROCEDURE MENU();
  var
    resp:BYTE;
  begin
  Clrscr;
  Writeln ('MENU PRINCIPAL');
  Writeln ('1) Manejo de Contribuyentes');
  Writeln ('2) Manejo de Terrenos');
  Writeln ('3) Listados Ordenados e Impresion');
  Writeln (Utf8ToAnsi('4) Estadísticas'));
  Readln (resp);
  case (resp) OF
     1: begin
        M_CONTRIBUYENTES();
        MENU();
        end;

     2: begin
        m_terrenos();
        MENU();
        end;

     3: begin
        MENU_listados();
        MENU();
        end;

     4: begin
        M_ESTADISTICAS;
        MENU();
        end;
     END;
  END;

END.


