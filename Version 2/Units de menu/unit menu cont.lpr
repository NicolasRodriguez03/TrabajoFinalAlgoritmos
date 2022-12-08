unit menu_contribuyentes;

interface

Type

implementation

PROCEDURE M_CONTRIBUYENTES ;
VAR 
BEGIN
BUSCAR(pos); 
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
    WRITELN('Contribuyente no encontrado, sera dado de alta');
    ALTA_C(ARCH_C, ARBOL_AYN, ARBOL_DNI);
 end;


end.