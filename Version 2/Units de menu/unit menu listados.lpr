unit menu_listados_ordenados;

interface
uses listados_ordenados;

procedure mostrar_listados

implementation

procedure mV
var resp: string;
begin 
    Writeln ('1) Mostrar Ordenado por apellido y nombre');
    Writeln ('2) Mostrar Ordenado por fecha de inscripcion');
    Writeln ('3) Mostrar Ordenado por zona');
    Writeln ('4) Impresion de comprobante');
        Readln (resp);
        If resp='1' then
            FILA_P_AYN ();
            listado_ordenado_ayn(arch_c, arch_t, ARBOL_AYN, 1);
        else
        begin
          if resp='2' then
          FILA_P_ZONA();
            LISTADO_ZONA(ARCH_T);
          else
          begin
            if resp='3' then
            FILA_P_FECHA();
                LISTADO_FECHA(ARCH_T);
            else
              if resp='4' then
                comprobante(//NO SE);
              ELSE
                Writeln ('Ingrese un valor valido');
          end;
        end;
    MENU();
END;
        

        