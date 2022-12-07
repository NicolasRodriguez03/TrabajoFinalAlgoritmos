unit ;

interface
uses
    arboles;
    definicion_datos;
    manejo_contribuyente;
    manejo_terrenos;
    lista_terreno;
    listados_ordenados;
    estadisticas;

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
      1:BEGIN
        leer_clave(x; clave);
        
        END;
        
      2:begin
        Writeln ('1) Ordenado por apellido y nombre');
        Writeln ('2) Ordenado por fecha de inscripcion');
        Writeln ('3) Ordenado por zona');
        Readln (resp_2);
        Case resp_2 OF
          1:
          2:MUESTRA_LISTA(L_F);
          3:LISTADO_FECHA(L_Z);
        end;
        end;

      3:begin
        Writeln ('1) Cantidad de inscriptos entre dos fechas');
        Writeln ('2) Porcentaje de propietarios con mas de una propiedad');
        Writeln ('3) Porcentaje de propiedades por tipo de edificacion');
        Writeln ('4) Cantidad de propietarios dados de baja');
        Readln (resp_2);
        Case resp_2 OF
          1:Writeln (cant_ins(L:T));
          2:
          3:begin
            Writeln('Tipo 1: ', PORC_TIPO(L_F, ARCH_T, 1), ' %');
            Writeln('Tipo 2: ', PORC_TIPO(L_F, ARCH_T, 2), ' %');
            Writeln('Tipo 3: ', PORC_TIPO(L_F, ARCH_T, 3), ' %');
            Writeln('Tipo 4: ', PORC_TIPO(L_F, ARCH_T, 4), ' %');
            Writeln('Tipo 5: ', PORC_TIPO(L_F, ARCH_T, 5), ' %');
            end;
          4:Writeln ('Hay ', Cant_baja(ARCH_C), ' contribuyentes dados de baja');
        end;
        end;
    end;
  end;
end.