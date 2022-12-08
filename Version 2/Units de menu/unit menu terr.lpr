unit menu_terrenos;

interface
USES manejo_terrenos;
Type

implementation
procedure m_terrenos();
var
    x_1:string[15]; //numero de plano de mensura
    OP:STRING;
begin
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
            // ACA HAY QUE PONER EL PROCEDIMIENTO
        else
        begin
          if OP='2' then
              MODIFICACION_T(ARCH_T, POS);
          else
          begin
            if OP='3' then
                  // ACA HAY QUE PONER EL PROCEDIMIENTO
            else
            Writeln ('Ingrese un valor valido');
          end;
        end;
end;
 else
 begin
   Writeln ('Realizar ALTA');
 end;

end.