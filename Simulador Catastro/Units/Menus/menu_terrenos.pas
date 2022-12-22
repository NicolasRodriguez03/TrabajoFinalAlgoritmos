unit menu_terrenos;

interface
USES manejo_terrenos, unicodeCRT,DEFINICION_DATOS, arboles, MANEJO_ARCHIVO_TERR, manejo_archivo_cont, graficos;
procedure m_terrenos(ARBOL_AYN, ARBOL_DNI:T_PUNT_A);

implementation
    procedure Titulo_Menu;
    begin
        gotoxy (48,10);
        textcolor(magenta);
        Writeln('MENU DE TERRENOS');
        textcolor (black);
    end;



    procedure m_terrenos(ARBOL_AYN, ARBOL_DNI:T_PUNT_A);
    var
        x_1:string[15]; //numero de plano de mensura
        OP,OP_1:STRING; POS:longint;
    begin
        textbackground(white);
        Clrscr;
        crear_abrir_T(ARCH_T);
        Box(37,9, 73,16);
        Titulo_Menu;
        Gotoxy(40,11);
        Writeln('Ingrese n. de plano de mensura');
        Gotoxy(50,13);
        Readln (x_1);
        if x_1<>('') then
        begin
            busqueda_archivo_mens(arch_t,x_1,pos);
            if pos>=0 then
            begin
                ClrScr;
                Box(1,9, 63,23);
                gotoxy (25,10);
                textcolor(magenta);
                Writeln('MENU DE TERRENOS');
                textcolor (black);
                MOSTRAR_DATOS_T(ARCH_T, POS);
                Writeln();
                Writeln ('-1 Baja');
                Writeln ('-2 Modificación');
                Writeln ('O ingresa cualquier otra tecla para regresar al menu principal');
                Writeln();
                READ (OP);
                case OP OF
                    '1':begin
                        ClrScr;
                        BAJA_TERRENO(arch_t, pos);
                        end;
                    '2':begin
                        ClrScr;
                        MODIFICACION_T(ARCH_T, POS);
                        ClrScr;
                        MOSTRAR_DATOS_T(ARCH_T, POS);
                        Writeln();
                        Writeln('Presione cualquier tecla para continuar');
                        readkey;
                        end;
                end;
            end
            else
            begin
                ClrScr;
                Box(37,9, 73,16);
                Titulo_Menu;
                Gotoxy(46,11);
                Write('Terreno no encontrado');
                Gotoxy(40,12);
                Write ('desea realizar el alta? (si/no)');
                Gotoxy(53,14);
                Readln (OP_1);
                IF (OP_1='SI') OR (OP_1='Si') or (OP_1='si') then
                begin
                    ClrScr;
                    crear_abrir_c(arch_c);
                    Writeln ('Realizando ALTA');
                    ALTA_T(ARBOL_DNI, ARCH_T, x_1);
                    CLOSE(ARCH_C);
                end;
            end;
            CLOSE(ARCH_T);
        end
        else
        begin
            CLOSE(ARCH_T);
            Writeln('Por favor ingrese un número de mensura válido');
            Writeln('Presione cualquier tecla para volver al menú de terrenos');
            readkey;
            m_terrenos(ARBOL_AYN, ARBOL_DNI);
        end;

    end;

end.