unit menu_contribuyentes;

interface
USES CRT, manejo_arboles, MANEJO_CONTRIBUYENTES, Arboles, DEFINICION_DATOS, MANEJO_ARCHIVO_CONT;
PROCEDURE M_CONTRIBUYENTES();

implementation

PROCEDURE M_CONTRIBUYENTES();
VAR POS: CARDINAL; OP_1,OP,X,CLAVE:STRING;
BEGIN
Clrscr;
leer_clave(X,CLAVE);
    If (x='nombre') or (x='NOMBRE') or (x='Nombre') then
      BUSCAR(ARBOL_AYN, pos)
    ELSE
      BUSCAR(ARBOL_DNI, pos);

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
            MODIFICACION_C(ARCH_C,POS)
          else
          begin
            if OP='3' then
                 MOSTRAR_DATOS_C(ARCH_C, POS)
            else
              Writeln ('Ingrese un valor valido');
              M_CONTRIBUYENTES();
          end;
        end;
end
 else
 begin
  Writeln('Contribuyente no encontrado, desea realizar el alta? (si/no)');
  Readln (OP_1);
  IF (OP='SI') OR (OP='Si') or (OP='si') then
    begin
    Writeln ('Realizando ALTA');
    ALTA_C(ARCH_C, ARBOL_AYN, ARBOL_DNI);
    end;
  m_CONTRIBUYENTES();
 end;
  END;

end.
