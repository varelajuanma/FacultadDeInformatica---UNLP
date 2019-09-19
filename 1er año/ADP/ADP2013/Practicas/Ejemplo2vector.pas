{Se lee una secuencia de letras minusculas que termina en '.' .
Informar la cantidad de veces que aparece cada letra}

Program ejerejemplo2;
type
  vector = array ['a'..'z'] of integer;
var
  cont:vector;
  i, car:char;
begin
  for i:= 'a' to 'z' do
    cont[i]:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    cont[car]:= cont[car] + 1;
    write('Ingrese un caracter: ');
    readln(car);
    end;
  for i:= 'a' to 'z' do
    writeln('La letra ',i,' aparecio ',cont[i],' veces.');
  writeln('Presione ENTER para finalizar');
  readln;
end.
