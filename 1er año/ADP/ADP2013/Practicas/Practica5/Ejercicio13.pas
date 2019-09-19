Program ejer13;
procedure patronA (var num:integer);
  var
    cantnum:integer;
  begin
    cantnum:= 0;
    while (num <> 0) do begin
      cantnum:= cantnum + 1;
      write('Ingrese un numero: ');
      readln(num);
      end;
    if (cantnum >= 6) then begin
      writeln('La secuencia cumple con el patron A');
      end
    else
      writeln('La secuencia NO cumple con el patron A');
  end;
procedure patronB (var num:integer);
  var
    digito:integer;
    impar:boolean;
  begin
    impar:= false;
    while (num <> 999) do begin
      digito:= num MOD 10;
      if ((digito MOD 2) = 0) then begin
        write('Ingrese un numero: ');
        readln(num);
        end
      else
        impar:= true;
        write('Ingrese un numero: ');
        readln(num);
      end;
    if (impar = false) then begin
      writeln('La secuencia cumple con el patron B');
      end
    else
      writeln('La secuencia NO cumple con el patron B');
  end;
var
  num:integer;
begin
  write('Ingrese un numero: ');
  readln(num);
  patronA(num);
  patronB(num);
  writeln('Presione ENTER para finalizar');
  readln;
end.
