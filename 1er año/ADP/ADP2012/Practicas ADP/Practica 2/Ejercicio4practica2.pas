Program ejer4prac2;
var
  pajaro:integer;
  i:integer;
  paismin1:integer;
  paismin2:integer;
  masde40:integer;
  pais1:integer;
  pais2:integer;
  porcentaje:real;
begin
  paismin1:=999;
  paismin2:=999;
  pais1:=0;
  pais2:=0;
  masde40:=0;
  porcentaje:=0;
  for i:=1 to 14 do begin
    writeln('ingrese cantidad de pajaros en el ',i,' pais.');
    readln(pajaro);
    if (pajaro < paismin1) then begin
      paismin1:=pajaro;
      paismin2:=paismin2;
      pais2:=pais1;
      pais1:=i;
    end
    else
      if(pajaro < paismin2) then begin
        paismin2:=pajaro;
        pais2:=i;
      end;
    if (pajaro > 40) then
      masde40:=masde40 + 1;
  end;
  porcentaje:= (masde40 * 14) div 100;
  writeln('el primer pais con menor cantidad de especies es el ',pais1);
  writeln('el segundo pais con menor cantidad de especies es el ',pais2);
  writeln('el porcentaje de paises con mas de 40 especies es de: ',porcentaje);
  readln;
  readln;
end.
