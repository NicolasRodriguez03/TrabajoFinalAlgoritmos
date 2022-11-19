unit ;

interface
uses
    arboles;
    contribuyente;
    manejo_contribuyente;
    terreno;
    manejo_terrenos;
    lista_terreno;

type

implementation
  PROCEDURE MENU();
  var
    resp:BYTE;
  begin
    Writeln ('Bienvenido!');
    Writeln ('1) Ingresar clave');
    Writeln ('2) Ver listados ordenados');
    Writeln ('3) Ver estadisticas')
    Readln (resp);
    case resp OF
      1: // MODIFICAR PARA QUE HAGA TODO YA DIGAMOS
        leer_clave(x; clave);
        
      2:Writeln ('1) Ordenado por apellido y nombre');
        Writeln ('2) Ordenado por fecha de inscripcion');
        Writeln ('3) Ordenado por zona');

      3:Writeln ('1) Cantidad de inscriptos entre dos fechas');
        Writeln ('2) Porcentaje de propietarios con mas de una propiedad');
        Writeln ('3) Porcentaje de propiedades por tipo de edificacion');
        Writeln ('4) Cantidad de propietarios dados de baja');
    end;
  end;
end.