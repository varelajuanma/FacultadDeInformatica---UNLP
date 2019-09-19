Program ejer11;
procedure descartarblancos (var car:char);
  begin
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
  end;
procedure analizarpalabra (var car:char; var cantp:integer);
  var
    cantl:integer;
  begin
    cantl:= 0;
    while (car <> '*') and (car <> ' ') do begin
      cantl:= cantl + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantl = 5) then
      cantp:= cantp + 1;
    descartarblancos(car);
  end;
var
  car:char;
  cantp:integer;
begin
  cantp:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  descartarblancos(car);
  while (car <> '*') do
    analizarpalabra(car,cantp);
  writeln('La cantidad de palabras con longitud cinco son: ',cantp);
  writeln('Presione ENTER para finalizar');
  readln;
end.
