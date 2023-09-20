unit validacion;
    
interface
   function chequeo_fecha(x:string):boolean;
function no_contiene_letras(x:string):boolean;  

implementation
    function chequeo_fecha(x:string):boolean;   // Verifica si el string ingresado esta en formato de fecha DD/MM/AAAA
   var
    aux1,aux2,aux3:string;
    out1,out2,out3,output1,output2,output3:word;
   begin
    if Length(x)=10 then
    begin
      aux1:= copy(x,1,2);
      val(aux1, out1, output1);
       aux2:= copy(x,4,2);
      val(aux2, out2, output2);
      aux3:= copy(x,7,4);
      val(aux3, out3, output3);
      if (((out1<1) or (out1>31))  or ((out2<1) or (out2>12))) or (((out3<1500) or (out3>2023)) or ( (copy(x,3,1) <>  '/') or (copy(x,6,1) <> '/')))then
         chequeo_fecha:=false
      else
        chequeo_fecha:=true;
       end;
        end;     

function no_contiene_letras(x:string):boolean;  // Verifica si el string ingresado contiene letras
   var
    aux:string; i,c:byte;
    outr, output:word ;
    begin
        c:=1;
        if (length(x)>=7) and (length(x)<=8) then
        begin
            for i:=1 to length(x) do
            begin
                aux:= copy(x,i,1);
                val(aux, outr, output);
                if (outr=0) and (aux<>'0') then
                    c:=0;
            end;
            if c=0 then
                no_contiene_letras:=false
            else
                no_contiene_letras:=true
        end
        else
            no_contiene_letras:=false;
    end;  
end.