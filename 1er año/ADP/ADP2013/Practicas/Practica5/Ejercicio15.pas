Program ejer15;
procedure descartarblancos (var car:char);
  begin
    while (car = ' ') do begin
      write('Ingrese un caracter: ');
      readln(car);
      end;
  end;
procedure patronV (var car:char; var cantp:integer);
  var
    cumpleV:boolean;
  begin
    cumpleV:= true;
    while (car <> '&') do begin
      if (car = 'a') then begin
        cantp:= cantp + 1;
        end
      else
        cumpleV:= false;
      while (car <> '&') and (car <> ' ') do begin
        write('Ingrese un caracter: ');
        readln(car);
        end;
      descartarblancos(car);
      end;
    if (cumpleV = true) then begin
      writeln('La secuencia cumple con el patron V');
      end
    else
      writeln('La secuencia NO cumple con el patron V');
  end;
procedure patronQ (var car:char; var cantp:integer);
  var
    cantl:integer;
  begin
    cantl:= 0;
    write('Ingrese un caracter: ');
    readln(car);
    while (car <> '.') do begin
      cantl:= cantl + 1;
      write('Ingrese un caracter: ');
      readln(car);
      end;
    if (cantl = cantp) then begin
      writeln('La secuencia cumple con el patron Q');
      end
    else
      writeln('La secuencia NO cumple con el patron Q');
  end;
var
  car:char;
  cantp:integer;
begin
  cantp:= 0;
  write('Ingrese un caracter: ');
  readln(car);
  descartarblancos(car);
  patronV(car,cantp);
  patronQ(car,cantp);
  writeln('Presione ENTER para finalizar');
  readln;
end.
