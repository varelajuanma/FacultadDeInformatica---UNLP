Program ejer1prac4;
type
  conjletras=set of char;
var
  car:char;
  mayus:conjletras;
  minus:conjletras;
  num:conjletras;
  cantmayus, cantminus, cantnum:integer;
begin
  mayus:=['A'..'Z'];
  minus:=['a'..'z'];
  num:=['0'..'9'];
  cantmayus:=0;
  cantminus:=0;
  cantnum:=0;
  writeln('ingrese secuencia de caracteres');
  readln(car);
  while (car<>'!') do begin
    if(car in mayus) then
      cantmayus:=cantmayus + 1;
    if(car in minus) then
      cantminus:=cantminus + 1;
    if(car in num) then
      cantnum:=cantnum + 1;
    readln(car);
  end;
  writeln('la cantidad de mayusculas es de: ',cantmayus);
  writeln('la cantidad de minusculas es de: ',cantminus);
  writeln('la cantidad de numeros es de: ',cantnum);
  readln;
  readln;
end.
