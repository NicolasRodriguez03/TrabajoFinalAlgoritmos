unit menu_terrenos;

interface
USES manejo_terrenos, CRT,DEFINICION_DATOS, MANEJO_ARCHIVO_TERR;
procedure m_terrenos();

implementation
procedure m_terrenos();
var
    x_1:string[15]; //numero de plano de mensura
    OP,OP_1:STRING; POS:CARDINAL;
begin
Clrscr;
Writeln('Ingrese n. de plano de mensura');
Readln (x_1);
busqueda_archivo_mens(arch_t,x_1,pos);
if pos>=0 then
begin
    Writeln ('1) Baja');
    Writeln ('2) Modificacion');
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
              MOSTRAR_DATOS_T(ARCH_T, POS)
            else
            Writeln ('Ingrese un valor valido')
          end;
        end;
end
 else
 begin
  Writeln('Terreno no encontrado, desea realizar el alta? (si/no)');
  Readln (OP_1);
  IF (OP='SI') OR (OP='Si') or (OP='si') then
    begin
    Writeln ('Realizando ALTA');
    ALTA_T(ARCH_T);
    end;
  m_terrenos();
END;
 end;

end.
