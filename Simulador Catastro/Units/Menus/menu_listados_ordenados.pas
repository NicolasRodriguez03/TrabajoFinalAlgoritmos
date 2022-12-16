unit menu_listados_ordenados;

interface
uses listados_ordenados, CRT, DEFINICION_DATOS, Arboles, MANEJO_ARBOLES;
procedure menu_listados();

implementation

procedure menu_listados();
var resp: string;  N_DNI:STRING; POS:CARDINAL;
begin
Clrscr;
    Writeln ('1) Mostrar Ordenado por apellido y nombre');
    Writeln ('2) Mostrar Ordenado por fecha de inscripcion en un año determinado');
    Writeln ('3) Mostrar Ordenado por zona');
    Writeln ('4) Impresion de comprobante');
        Readln (resp);
        If resp='1' then
          BEGIN
            FILA_P_AYN ();
            listado_ordenado_ayn(arch_c, arch_t, ARBOL_AYN, 1) ;
          end
        else
        begin
          if resp='2' then
            BEGIN
          FILA_P_ZONA();
            LISTADO_ZONA(ARCH_T);
            end
          else
          begin
            if resp='3' then
              BEGIN
            FILA_P_FECHA();
                LISTADO_FECHA(ARCH_T);
              end
            else
              if resp='4' then
               BEGIN
                  Writeln('Ingrese DNI:');
                  READLN(N_DNI);
                  CONSULTA(ARBOL_DNI,POS, N_DNI);
                  comprobante(ARBOL_DNI,arch_c,arch_t,POS)
               end
              ELSE
                Writeln ('Ingrese un valor valido');
          end;
        end;
END;

END.
