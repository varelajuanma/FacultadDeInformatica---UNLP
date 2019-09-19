Program ejer1A;
type
  conjunto= set of char;
var
  car:char;
  cantmayus:integer;
  mayusculas:conjunto;
begin
  cantmayus:= 0;
  mayusculas:= ['A'..'Z'];
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    if (car IN mayusculas) then
      cantmayus:= cantmayus + 1;
    write('Ingrese otro caracter: ');
    readln(car);
    end;
  writeln('La cantidad de letras mayusculas es de: ',cantmayus);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
