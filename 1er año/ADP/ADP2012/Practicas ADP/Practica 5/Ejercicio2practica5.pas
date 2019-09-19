Program ejer2prac5;
procedure borrarblancos (var car:char);
  begin
    while (car = ' ') do
      readln(car);
  end;
procedure palabraslong5 (var long5:integer);
  var
    car:char;
    cant:integer;
  begin
    writeln('ingrese un caracter');
    readln(car);
    borrarblancos(car);
    while (car <> '*') do begin
      cant:=0;
      while (car <> ' ') and (car <> '*') do begin
        cant:=cant + 1;
        writeln('ingrese otro caracter');
        readln(car);
      end;
      if (cant = 5) then
        long5:=long5 + 1;
      borrarblancos(car);
    end;
  end;
var
  palabras5:integer;
begin
  palabras5:=0;
  palabraslong5(palabras5);
  writeln('La cantidad de palabras de longitud 5 ingresadas, fueron : ', palabras5);
  readln;
  readln;
end.
