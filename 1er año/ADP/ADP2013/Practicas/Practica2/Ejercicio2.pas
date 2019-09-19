Program ejer2;
var
  num, max, min, total:integer;
begin
  max:=-1;
  min:=999;
  total:=0;
  write('ingrese un numero: ');
  read(num);
  while (num <> -1) do begin
    if (num > max) then
      max:=num;
    if (num < min) then
      min:=num;
    total:=total + num;
    write('ingrese otro numero: ');
    read(num);
    end;
  writeln('el valor maximo ingresado fue: ',max);
  writeln('el valor minimo ingresado fue: ',min);
  writeln('el valor total de los numeros ingresados fue: ',total);
  readln;
  readln;
end.
