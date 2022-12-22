unit menu_estadisticas;
                                      
{$codepage utf8}
interface
  USES Estadisticas, unicodeCRT, DEFINICION_DATOS, manejo_archivo_CONT, manejo_archivo_TERR, graficos, windows;
  PROCEDURE M_ESTADISTICAS;


implementation
    procedure Titulo_Menu;
    begin
        gotoxy (44,10);
        textcolor (13);
        WRITELN ('MENU DE ESTADÍSTICAS');
        gotoxy (33,11);
        textcolor(black);
    end;




  PROCEDURE M_ESTADISTICAS;
  VAR resp:char;
      c_1:longint;
  begin
    textbackground(white);
    Clrscr;
    Titulo_Menu;
    Box(30,9, 80,16);
    crear_abrir_T(arch_t);
    crear_abrir_C(arch_c);
    CHEQUEO_ESTADO(ARCH_C, ARCH_T);
    gotoxy (33,11);
    Writeln ('1) Cantidad de inscriptos entre dos fechas');
    gotoxy (33,12);
    Writeln ('2) % de propietarios con más de una propiedad');
    gotoxy (33,13);
    Writeln ('3) % de propiedades por tipo de edificación');
     gotoxy (33,14);
    Writeln ('4) Cantidad de propietarios dados de baja');
    gotoxy (33,15);
    Writeln('Respuesta: ');
    gotoxy (54,15);
    Readln (resp);
    Case (resp) OF
      '1':begin
          ClrScr;
          Box(37,9, 73,16);
          c_1:=cant_ins(ARCH_T);
          ClrScr;
          Box(37,9, 73,16);
          WRITELN('NUMERO DE INSCRIPTOS ENTRE DOS FECHAS: ',c_1);
          WriteLn('Presione cualquier tecla para continuar');
          readkey;
          end;
      '2':begin
          ClrScr;
          Box(30,9, 80,16);
          Titulo_Menu;
          Gotoxy(40,12);
          Write('El ', (PROP_MP(arch_c,arch_t)):5:2, '% de los propietarios');
          Gotoxy(42,13);
          Write ('tiene más de una propiedad');
          Gotoxy(36,14);
          Write('Presione cualquier tecla para continuar');
          readkey;
          end;
      '3':begin
          ClrScr;
          Box(35,9, 75,16);
          textcolor (13);
          Gotoxy(45,10);
          write ('Tipo 1: ');
          textcolor (black);
          write (PORC_TIPO(ARCH_T, 1):5:2, ' %');
            textcolor (13);
          Gotoxy(45,11);
          Write('Tipo 2: ');
          textcolor (black);
          write (PORC_TIPO(ARCH_T, 2):5:2, ' %');
             textcolor (13);
          Gotoxy(45,12);
          Write ('Tipo 3: ');
          textcolor (black);
          write (PORC_TIPO(ARCH_T, 3):5:2, ' %');
          textcolor (13);
          Gotoxy(45,13);
          Write('Tipo 4: ');
             textcolor (black);
          write (PORC_TIPO(ARCH_T, 4):5:2, ' %');
          textcolor (13);
          Gotoxy(45,14);
          Write('Tipo 5: ');
             textcolor (black);
          write (PORC_TIPO(ARCH_T, 5):5:2, ' %');
          Gotoxy(36,15);
          Write('Presione cualquier tecla para continuar');
          readkey;
          end;
      '4':begin
          ClrScr;
          Writeln ('El ', Cant_baja(ARCH_C):5:2,'% de los contribuyentes están dados de baja');
          WriteLn('Presione cualquier tecla para continuar');
          Gotoxy(60,60);
          readkey;
          end;
      end;
      close(arch_c);
      close(arch_t);
  end;

end.