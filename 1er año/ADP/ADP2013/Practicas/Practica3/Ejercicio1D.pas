Program ejer1d;
var
  car,ant:char;
  cantFCF:integer;
begin
  cantFCF:=0;
  write('ingrese caracter: ');
  readln(car);
  while (car <> '.') do begin
    ant:=car;
    write('ingrese otro caracter: ');
    readln(car);
    if (ant = 'F') and (car = 'C') or (ant = 'C') and (car = 'F') then begin
      cantFCF:=cantFCF + 1;
      ant:=car;
      end;
    write('ingrese otro caracter: ');
    readln(car);
    end;
  writeln('la cantidad de FC o CF es de: ',cantFCF);
  writeln('ingrese ENTER para finalizar');
  readln ();
end.
