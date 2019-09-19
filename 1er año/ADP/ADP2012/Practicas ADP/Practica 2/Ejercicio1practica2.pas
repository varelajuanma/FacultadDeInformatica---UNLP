Program ejer1prac2;
Var
  auto:integer;
  diamax1,diamax2:integer;
  max1,max2:integer;
  min:integer;
  diamin:integer;
  i:integer;
begin
  diamax1:=0;
  diamax2:=0;
  diamin:=0;
  max1:=-1;
  max2:=-1;
  min:=999;
  for i:=1 to 3 do begin
    writeln('ingrese la cantidad de autos vendidos el dia ',i);
    read(auto);
    if (auto>max1) then begin
      max2:=max1;
      max1:=auto;
      diamax2:=diamax1;
      diamax1:=i;
      end
    else
      if (auto>max2) then begin
        max2:=auto;
        diamax2:=i;
      end;
    end;
    if (auto<min) then begin
      min:=auto;
      diamin:=i;
    end;
  writeln ('el dia con mayor cantidad de ventas fue:',diamax1);
  writeln ('el segundo dia con mayor cantidad de ventas fue: ',diamax2);
  writeln ('la minima cantidad de ventas fue de ',min);
  readln;
  readln;
end.
