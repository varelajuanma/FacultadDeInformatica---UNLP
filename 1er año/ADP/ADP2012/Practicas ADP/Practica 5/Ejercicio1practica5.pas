Program ejer1prac5;
Procedure secuencia (var enc:boolean);
  var
    car:char;
    ant:char;
  begin
    writeln('escriba una secuencia de caracteres');
    readln(car);
    while (car <> '.') and (enc = false) do begin
      ant:=car;
      writeln('ingrese otro caracter');
      readln(car);
      if (ant = 'p') and (car = 'a') then
        enc:=true;
    end;
  end;
var
  encontro:boolean;
begin
  encontro:=false;
  secuencia(encontro);
  writeln('¿la secuencia pa fue encontrada?:',encontro);
  readln;
  readln;
end.
