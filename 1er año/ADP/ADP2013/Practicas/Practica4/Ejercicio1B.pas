Program ejer1B;
type
  conjletras= set of char;
var
  mayus,minus:conjletras;
  cantmayus,cantminus,cantnum:integer;
  car:char;
begin
  cantmayus:= 0;
  cantminus:= 0;
  cantnum:= 0;
  mayus:= ['A' .. 'Z'];
  minus:= ['a' .. 'z'];
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    if (car IN mayus) then
      cantmayus:= cantmayus + 1;
    if (car IN minus) then
      cantminus:= cantminus + 1;
    if (not(car IN mayus)) and (not(car IN minus)) then
      cantnum:= cantnum + 1;
    write('Ingrese un caracter: ');
    readln(car);
    end;
  writeln('La cantidad de mayusculas es de: ',cantmayus);
  writeln('La cantidad de minusculas es de: ',cantminus);
  writeln('La cantidad de numeros es de: ',cantnum);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
