unit ;

interface

type
  manejo_contribuyente;
  lista_terreno;
  definicion_datos;
  end;
procedure Impresion(pos:CARDINAL);
implementation

procedure Impresion(pos:CARDINAL);
var
begin
  MOSTRAR_DATOS_C(ARCH_C, POS, REG);
  CONSULTA_T(ARCH_T, POS);
end;

end.