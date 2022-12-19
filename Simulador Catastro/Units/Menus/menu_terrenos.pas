unit menu_terrenos;

interface
USES manejo_terrenos, CRT,DEFINICION_DATOS, MANEJO_ARCHIVO_TERR;
procedure m_terrenos();

implementation
procedure m_terrenos();
var
    x_1:string[15]; //numero de plano de mensura
    OP,OP_1:STRING; POS:longint;
begin
Clrscr;
crear_abrir_T(ARCH_T);
Writeln('Ingrese n. de plano de mensura');
Readln (x_1);
busqueda_archivo_mens(arch_t,x_1,pos);
if pos>=0 then
begin
    ClrScr;
    Writeln('MENU DE TERRENOS');
    Writeln ('1) Baja');
    Writeln (Utf8ToAnsi('2) Modificación'));
    Writeln ('3) Consulta');
    READ (OP);
    If OP='1' then
        BAJA_TERRENO(arch_t, pos)
    else
        begin
        if OP='2' then
            MODIFICACION_T(ARCH_T, POS)
        else
            begin
            if OP='3' then
                begin
                MOSTRAR_DATOS_T(ARCH_T, POS);
                readkey;
                end
            else
                Writeln (Utf8ToAnsi('Ingrese un valor válido'))
            end;
        end;
end
else
    begin
    Writeln('Terreno no encontrado, desea realizar el alta? (si/no)');
    Readln (OP_1);
    IF (OP_1='SI') OR (OP_1='Si') or (OP_1='si') then
        begin
        Writeln ('Realizando ALTA');
        ALTA_T(ARCH_T);
        end;
    end;
CLOSE(ARCH_T);
end;

end.