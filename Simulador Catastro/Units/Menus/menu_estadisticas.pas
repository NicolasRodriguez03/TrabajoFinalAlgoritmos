unit menu_estadisticas;

interface
  USES Estadisticas, CRT, DEFINICION_DATOS, manejo_archivo_CONT, manejo_archivo_TERR;
  PROCEDURE M_ESTADISTICAS;


implementation

  PROCEDURE M_ESTADISTICAS;
  VAR resp:string;
      c_1:longint;
  begin
    Clrscr;
    crear_abrir_T(arch_t);
    crear_abrir_C(arch_c);
    CHEQUEO_ESTADO(ARCH_C, ARCH_T);
     gotoxy (44,10);
     textcolor (13);
    WRITELN (Utf8ToAnsi('MENU DE ESTADÍSTICAS'));
    gotoxy (39,11);
    textcolor(black);
    Writeln ('1) Cantidad de inscriptos entre dos fechas');
    gotoxy (39,12);
    Writeln (Utf8ToAnsi('2) Porcentaje de propietarios con más de una propiedad'));
    gotoxy (39,13);
    Writeln (Utf8ToAnsi('3) Porcentaje de propiedades por tipo de edificación'));
     gotoxy (39,14);
    Writeln ('4) Cantidad de propietarios dados de baja');
    gotoxy (42,15);
    Writeln('Respuesta: ');
    gotoxy (54,15);
    Readln (resp);
    Case (resp) OF
      '1':begin
          ClrScr;
          c_1:=cant_ins(ARCH_T);
          ClrScr;
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
          textcolor (13);
          write ('Tipo 1: ');
          textcolor (black);
          writeln (PORC_TIPO(ARCH_T, 1):5:2, ' %');
            textcolor (13);
          Write('Tipo 2: ');
          textcolor (black);
          writeln (PORC_TIPO(ARCH_T, 2):5:2, ' %');
             textcolor (13);
          Write ('Tipo 3: ');
          textcolor (black);
          writeln (PORC_TIPO(ARCH_T, 3):5:2, ' %');
          textcolor (13);
          Write('Tipo 4: ');
             textcolor (black);
          writeln (PORC_TIPO(ARCH_T, 4):5:2, ' %');
          textcolor (13);
          Write('Tipo 5: ');
             textcolor (black);
          writeln (PORC_TIPO(ARCH_T, 5):5:2, ' %');
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