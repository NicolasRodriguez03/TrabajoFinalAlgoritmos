unit menu_estadisticas;

interface
USES Estadisticas;


implementation

PROCEDURE M_ESTADISTICAS; 
VAR resp:string;
begin
    Writeln ('1) Cantidad de inscriptos entre dos fechas');
    Writeln ('2) Porcentaje de prrespietarios con mas de una prrespiedad');
    Writeln ('3) Porcentaje de prrespiedades por tipo de edificacion');
    Writeln ('4) Cantidad de prrespietarios dados de baja');
        Readln (resp);
        Case resp OF
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
END;


end.