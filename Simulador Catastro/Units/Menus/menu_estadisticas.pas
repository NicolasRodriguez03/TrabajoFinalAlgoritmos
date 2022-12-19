unit menu_estadisticas;

interface
  USES Estadisticas, CRT, DEFINICION_DATOS, LISTA, manejo_archivo_CONT, manejo_archivo_TERR;
  PROCEDURE M_ESTADISTICAS();


implementation

  PROCEDURE M_ESTADISTICAS();
  VAR resp:string;
      c_1:longint;
  begin
  Clrscr;
  crear_abrir_T(arch_t);
  crear_abrir_C(arch_c);
  CHEQUEO_ESTADO(ARCH_C, ARCH_T);
  WRITELN (Utf8ToAnsi('MENU DE ESTADÍSTICAS'));
  Writeln ('1) Cantidad de inscriptos entre dos fechas');
  Writeln (Utf8ToAnsi('2) Porcentaje de propietarios con más de una propiedad'));
  Writeln (Utf8ToAnsi('3) Porcentaje de propiedades por tipo de edificación'));
  Writeln ('4) Cantidad de propietarios dados de baja');
  Readln (resp);
  Case (resp) OF
    '1':begin
        ClrScr;
        c_1:=cant_ins(ARCH_T);
        WRITELN('NUMERO DE INSCRIPTOS ENTRE DOS FECHAS: ',c_1);
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    '2':begin
        ClrScr;
        Writeln('El ', (PROP_MP(arch_c,arch_t)):5:2, Utf8ToAnsi('% de los propietarios tiene más de una propiedad'));
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    '3':begin
        ClrScr;
        Writeln('Tipo 1: ', PORC_TIPO(ARCH_T, 1):5:2, ' %');
        Writeln('Tipo 2: ', PORC_TIPO(ARCH_T, 2):5:2, ' %');
        Writeln('Tipo 3: ', PORC_TIPO(ARCH_T, 3):5:2, ' %');
        Writeln('Tipo 4: ', PORC_TIPO(ARCH_T, 4):5:2, ' %');
        Writeln('Tipo 5: ', PORC_TIPO(ARCH_T, 5):5:2, ' %');
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    '4':begin
        ClrScr;
        Writeln ('El ', Cant_baja(ARCH_C):5:2, Utf8ToAnsi('% de los contribuyentes están dados de baja'));
        WriteLn('Presione cualquier tecla para continuar');
        readkey;
        end;
    end;
    close(arch_c);
    close(arch_t);
  end;

end.
