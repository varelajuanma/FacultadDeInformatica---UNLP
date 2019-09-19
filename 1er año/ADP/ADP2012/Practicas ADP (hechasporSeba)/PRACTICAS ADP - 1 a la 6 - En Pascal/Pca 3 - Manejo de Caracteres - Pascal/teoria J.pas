program palabra;
var
  cant: integer;
  car: char;
begin
  cant:=0;
  read(car);
  while (car = ' ') do
    read (car);
  while (car <> '*') do begin
    if (car = 'J') then
      cant:= cant + 1;
    while (car <> '*') and (car <> ' ' )do
      read (car);
    while (car = ' ') do
      read (car);
  end;
  writeln('La cantidad de palabras que comienzan con la letra J es: ', cant);
  writeln('Presione la tecla "enter" para finalizar...');
  readln;
  readln;
end.





