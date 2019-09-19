Program ejer5;
type
  rango = 'a' .. 'z';
  vector = array [rango] of integer;

procedure iniciarvector (var v:vector);
  var
    i:char;
  begin
    for i:= 'a' to 'z' do
      v[i]:= 0;
  end;

var
  v:vector;
  car,i:char;
begin
  iniciarvector (v);
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    v[car]:= v[car] + 1;
    write('Ingrese un caracter: ');
    readln(car);
    end;
  for i:= 'a' to 'z' do
    writeln('La letra ',i,' se ingreso ',v[i],' veces');
  writeln('Presione ENTER para finalizar');
  readln;
end.
