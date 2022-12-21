unit menu_terrenos;

interface
USES manejo_terrenos, CRT,DEFINICION_DATOS, MANEJO_ARCHIVO_TERR, manejo_archivo_cont;
procedure m_terrenos;

implementation
    procedure m_terrenos;
    var
        x_1:string[15]; //numero de plano de mensura
        OP,OP_1:STRING; POS:longint;
    begin
        Clrscr;
        crear_abrir_T(ARCH_T);
        Writeln('Ingrese n. de plano de mensura');
        Readln (x_1);
        if x_1<>('') then
        begin
            busqueda_archivo_mens(arch_t,x_1,pos);
            if pos>=0 then
            begin
                ClrScr;
                gotoxy (10,1);
                textcolor(magenta);
                Writeln('MENU DE TERRENOS');
                textcolor (black);
                MOSTRAR_DATOS_T(ARCH_T, POS);
                Writeln();
                Writeln ('-1 Baja');
                Writeln (Utf8ToAnsi('-2 Modificación'));
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
                Writeln('Terreno no encontrado, desea realizar el alta? (si/no)');
                Readln (OP_1);
                IF (OP_1='SI') OR (OP_1='Si') or (OP_1='si') then
                begin
                    ClrScr;
                    crear_abrir_c(arch_c);
                    Writeln ('Realizando ALTA');
                    ALTA_T(ARCH_T, x_1);
                    CLOSE(ARCH_C);
                end;
            end;
            CLOSE(ARCH_T);
        end
        else
        begin
            CLOSE(ARCH_T);
            Writeln(Utf8ToAnsi('Por favor ingrese un número de mensura válido'));
            Writeln(Utf8ToAnsi('Presione cualquier tecla para volver al menú de terrenos'));
            readkey;
            m_terrenos;
        end;
        
    end;

end.