Program ejer3;
procedure leerpseguidoa (var encontro:boolean);
  var
    car,ant: char;
  begin
    write('Ingrese un caracter: ');
    readln(car);
    while (car <> '.') and (encontro = false) do begin
      ant:= car;
      write('Ingrese un caracter: ');
      readln(car);
      if (ant = 'p') and (car = 'a') then
        encontro:= true;
      end;
    if (encontro = true) then begin
      writeln('Se encontro la subsecuencia "pa"');
      end
    else
      writeln('No se encontro la subsecuencia "pa"');
  end;
var
  encontro: boolean;
begin
  encontro:= false;
  leerpseguidoa (encontro);
  writeln('Presione ENTER para finalizar');
  readln;
end.
