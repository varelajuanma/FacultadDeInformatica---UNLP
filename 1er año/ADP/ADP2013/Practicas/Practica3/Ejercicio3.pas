Program ejer3;
var
  car,pri,med,ult:char;
  cantpa,cante,cantl:integer;
begin
  cantpa:=0;
  write('ingrese un caracter: ');
  readln(car);
  while (car = ' ') do begin
    write('ingrese un caracter: ');
    readln(car);
    end;
  while (car <> '*') do begin
    cante:=0;
    cantl:=0;
    if (car = 'S') then
      pri:=car;
    while (car <> '*') and (car <> ' ') do begin
      cantl:=cantl + 1;
      med:=car;
      ult:=car;
      write('ingrese un caracter: ');
      readln(car);
      if(med = 'E') then
        cante:=cante + 1;
      end;
    if (pri = 'S') and (ult = 'S') and (cante = 2) and (cantl >= 6) then
      cantpa:= cantpa + 1;
    while (car = ' ') do begin
      write('ingrese un caracter: ');
      readln(car);
      end;
    end;
  writeln('la cantidad de palabras con al menos 6 letras que empiezan y terminan con "S" y tiene dos "E" es de :',cantpa);
  writeln('ingrese ENTER para finalizar');
  readln;
end.
