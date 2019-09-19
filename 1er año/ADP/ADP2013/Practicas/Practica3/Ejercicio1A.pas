Program ejer1A;
var
  car:char;
  cantcar:integer;
begin
  cantcar:=0;
  write('ingrese caracter: ');
  readln(car);
  while (car <> '.') do begin
    cantcar:=cantcar + 1;
    write('ingrese otro caracter: ');
    readln(car);
    end;
  writeln('la cantidad de caracteres leidos fue de: ',cantcar);
  writeln('ingrese ENTER para finalizar');
  readln ();
end.
