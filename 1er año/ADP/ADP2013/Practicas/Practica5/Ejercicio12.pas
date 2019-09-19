Program ejer12;
type
  conjnum = set of char;
procedure analizarsecuencia (var car:char; var numeros:conjnum);
  begin
    while (car <> '*') do begin
      if (car IN numeros) then
        numeros:= numeros - [car];
      write('Ingrese un caracter: ');
      readln(car);
      end;
  end;
var
  car:char;
  i:char;
  numeros:conjnum;
begin
  numeros:= ['0','1','2','3','4','5','6','7','8','9'];
  write('Ingrese un caracter: ');
  readln(car);
  analizarsecuencia(car,numeros);
  for i:= '0' to '9' do
    if (i IN numeros) then
      writeln('El numero ',i,' no esta en la secuencia de caracteres');
  writeln('Presione ENTER para finalizar');
  readln;
end.
