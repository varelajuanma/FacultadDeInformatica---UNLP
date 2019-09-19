Program ejer14;
type
  conjletras = set of char;
procedure patronA (var car:char; var leidos:conjletras);
  var
    vocales,consonantes:conjletras;
    cumple:boolean;
  begin
    vocales:= ['a','e','i','o','u'];
    consonantes:= ['a'..'z'] - vocales;
    cumple:= true;
    while (car <> '@') do begin
      if (car IN consonantes) then begin
        leidos:= leidos + [car];
        write('Ingrese un caracter: ');
        readln(car);
        end
      else
        cumple:= false;
        write('Ingrese un caracter: ');
        readln(car);
      end;
    if (cumple = true) then begin
      writeln('La secuencia cumple con el patron A');
      end
    else
      writeln('La secuencia NO cumple con el patron A');
  end;
procedure patronB (var car:char; var leidos:conjletras);
  var
    nocumple:boolean;
  begin
    nocumple:= false;
    while (car <> '.') do begin
      if (not (car IN leidos)) then begin
        write('Ingrese un caracter: ');
        readln(car);
        end
      else
        nocumple:= true;
        write('Ingrese un caracter: ');
        readln(car);
      end;
    if (nocumple = false) then begin
      writeln('La secuencia cumple con el patron B');
      end
    else
      writeln('La secuencia NO cumple con el patron B');
  end;
var
  car:char;
  leidos:conjletras;
begin
  leidos:= [];
  write('Ingrese un caracter: ');
  readln(car);
  patronA (car,leidos);
  patronB (car,leidos);
  writeln('Presione ENTER para finalizar');
  readln;
end.
