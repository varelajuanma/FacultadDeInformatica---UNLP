program E1P5;
procedure secuencia (var c:char; var v:boolean);
var
  ant: char;
begin
  writeln('ingrese la secuencia de caracteres');
  read(c);
  while((c <> '.') and (v = false)) do begin
    ant:= c;
    read(c);
    if((ant = 'p') and (c = 'a')) then
      v:= true;
  end;
end;
var
  encontro: boolean;
  car: char;
begin
  encontro:= false;
  secuencia (car, encontro);
  writeln('pa: ', encontro);
  readln();
  readln();
end.



