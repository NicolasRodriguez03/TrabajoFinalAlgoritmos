unit menu_estadisticas;

interface
  USES Estadisticas, CRT, DEFINICION_DATOS, LISTA, manejo_archivo_CONT, manejo_archivo_TERR;
  PROCEDURE M_ESTADISTICAS();


implementation

  PROCEDURE M_ESTADISTICAS();
  VAR resp:string;
  begin
  Clrscr;
  crear_abrir_T(arch_t);
  crear_abrir_C(arch_c);
  WRITELN ('MENU DE ESTADISTICAS');
  Writeln ('1) Cantidad de inscriptos entre dos fechas');
  Writeln ('2) Porcentaje de propietarios con mas de una propiedad');
  Writeln ('3) Porcentaje de propiedades por tipo de edificacion');
  Writeln ('4) Cantidad de propietarios dados de baja');
  Readln (resp);
  Case (resp) OF
    '1':begin
        ClrScr;
        Writeln (cant_ins(ARCH_T));
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    '2':begin
        ClrScr;
        Writeln((PROP_MP(arch_c,arch_t)), '%');
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    '3':begin
        ClrScr;
        Writeln('Tipo 1: ', PORC_TIPO(ARCH_T, 1), ' %');
        Writeln('Tipo 2: ', PORC_TIPO(ARCH_T, 2), ' %');
        Writeln('Tipo 3: ', PORC_TIPO(ARCH_T, 3), ' %');
        Writeln('Tipo 4: ', PORC_TIPO(ARCH_T, 4), ' %');
        Writeln('Tipo 5: ', PORC_TIPO(ARCH_T, 5), ' %');
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    '4':begin
        ClrScr;
        Writeln ('Hay ', Cant_baja(ARCH_C), ' contribuyentes dados de baja');
        WriteLn('Presione cualquier tecla para continuar');
        end;
    end;
    close(arch_c);
    close(arch_t);
  end;

end.
