unit menu_listados_ordenados;

interface
uses listados_ordenados;

procedure mostrar_listados

implementation

procedure mostrar_listados(); 
var resp: string;
begin 
    Writeln ('1) Mostrar Ordenado por apellido y nombre');
    Writeln ('2) Mostrar Ordenado por fecha de inscripcion');
    Writeln ('3) Mostrar Ordenado por zona');
        Readln (resp);
        If resp='1' then
            // ACA HAY QUE PONER EL PROCEDIMIENTO
        else
        begin
          if resp='2' then
            LISTADO_ZONA();
          else
          begin
            if resp='3' then
                LISTADO_FECHA();
            else
            Writeln ('Ingrese un valor valido');
          end;
        end;
END;
        

        