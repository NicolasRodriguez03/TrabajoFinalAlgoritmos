unit ;

interface
uses
 menu_contribuyentes;
 menu_estadisticas;
 menu_listados_ordenados;
 menu_terrenos;

type

implementation
  PROCEDURE MENU();
  var
    resp:BYTE;
  begin
    Writeln ('Bienvenido!');
    Writeln ('1) Manejo de Contribuyentes');
    Writeln ('2) Manejo de Terrenos');
    Writeln ('3) Listados Ordenados e Impresion');
    Writeln ('4) Estadisticas');
    Readln (resp);

    case (resp) OF
     1: M_CONTRIBUYENTES;
     2: m_terrenos;
     3: mostrar_listados;
     4: M_ESTADISTICAS;
    END;
  END;
 
END.
