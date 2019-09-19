Program ejer6prac4;
Var
  num:integer;
  resto:integer;
  suma:integer;
  digmayor:integer;
begin
  suma:=0;
  writeln('ingrese un sucesion de numeros');
  readln(num);
  while (num <> 8888) do begin
    resto:= num mod 10;
    digmayor:=-1;
    suma:=suma + resto;
    while (num > 0) do begin
      resto:= num mod 10;
      if (resto > digmayor) then
        digmayor:=resto;
      num:=num div 10;
    end;
    writeln('el digito mayor es el: ',digmayor);
    writeln('ingrese otro numero');
    readln(num);
  end;
  writeln('la suma de todas las unidades es de: ',suma);
  readln;
  readln;
end.
