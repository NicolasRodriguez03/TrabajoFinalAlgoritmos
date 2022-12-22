unit Graficos;

{$mode ObjFPC}{$H+}
{$codepage utf8}

interface
   uses
    Classes, SysUtils, windows, unicodecrt;
   Procedure Box(X1,Y1, X2,Y2:longint);


implementation
  const
    EsquinaSupIzq=(#$E2#$94#$8C);
    EsquinaSupDer=(#$E2#$94#$90);
    EsquinaInferiorIzq=(#$E2#$94#$94);
    EsquinaInferiorDer=(#$E2#$94#$98);
    LineaHorizontal=(#$E2#$94#$80);
    LineaVertical=(#$E2#$94#$82);

  Procedure Box(X1,Y1, X2,Y2:longint);
  var
    i:longint;
  begin
    SetConsoleOutputCP(CP_UTF8);
    gotoxy(x1,y1);
      write(EsquinaSupIzq);
    gotoxy(x1,y2);
      write(EsquinaInferiorIzq);  
    gotoxy(x2,y1);
      write(EsquinaSupDer);
    gotoxy(x2,y2);
      write(EsquinaInferiorDer);
    For i:=(X1+1) to (X2-1) do
    begin
      Gotoxy(i,Y1); // superior
      Write(LineaHorizontal);
      Gotoxy(i,Y2); // inferior
      Write(LineaHorizontal);
    end;
    For I:=(Y1+1) to (Y2-1) do
    begin
      Gotoxy(X1,i); // lateral izq
      Write(LineaVertical);
      Gotoxy(X2,i); // lateral der
      Write(LineaVertical);
    end
  end;



end.           