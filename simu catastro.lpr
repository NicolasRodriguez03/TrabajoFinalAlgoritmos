program simu_catastro
// Este codigo ha sido generado por el modulo psexport 20180802-w32 de PSeInt.
// Es posible que el codigo generado no sea completamente correcto. Si encuentra
// errores por favor reportelos en el foro (http://pseint.sourceforge.net).

Program tp4_15;

Var
	operador: String;
	valor_1: Real;
	valor_2: Real;
Begin
	WriteLn('Ingresar valor 1: ');
	ReadLn(valor_1);
	WriteLn('Ingresar operador: ');
	ReadLn(operador);
	WriteLn('Ingresar valor 2: ');
	ReadLn(valor_2);
	Case operador Of
		'+': Begin
			WriteLn('Resultado: ',valor_1+valor_2);
		End;
		'-': Begin
			WriteLn('Resultado: ',valor_1-valor_2);
		End;
		'*': Begin
			WriteLn('Resultado: ',valor_1*valor_2);
		End;
		'/': Begin
			If valor_2=0 Then Begin
				WriteLn('No esta definida division por 0');
			End
			Else Begin
				WriteLn('Resultado: ',valor_1/valor_2);
			End;
		End;
		Else Begin
			WriteLn('Ingrese un operador v�lido');
		End;
	End;
End.

