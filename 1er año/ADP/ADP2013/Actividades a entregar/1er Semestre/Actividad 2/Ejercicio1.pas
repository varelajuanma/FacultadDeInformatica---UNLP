Program ejer1;
type
  conjletras = set of char;

procedure secuenciaA (var leidos:conjletras; var patronA:boolean; var consonantes:conjletras);
  var
    car:char;
    vocales:conjletras;
  begin
    vocales:= ['a','e','i','o','u','A','E','I','O','U'];
    consonantes:= ['a'..'z','A'..'Z'] - vocales;
    writeln('Secuencia A');
    write('Ingrese un caracter: ');
    readln(car);
    while (car <> '@') and (patronA = true) do begin
      if (car IN consonantes) then begin
        leidos:= leidos + [car];
        write('Ingrese un caracter: ');
        readln(car);
        end
      else
        patronA:= false;
      end;
  end;

procedure secuenciaB (var leidos:conjletras; var patronB:boolean);
  var
    car:char;
  begin
    writeln('Secuencia B');
    write('Ingrese un caracter: ');
    readln(car);
    while (car <> '.') and (patronB = true) do begin
      if not (car IN leidos) then begin
        write('Ingrese un caracter: ');
        readln(car);
        end
      else
        patronB:= false;
      end;
  end;

var
  consonantes,leidos:conjletras;
  patronA,patronB:boolean;
begin
  patronA:= true;
  patronB:= true;
  leidos:= [];
  secuenciaA (leidos,patronA,consonantes);
  if (patronA = true) then begin
    secuenciaB (leidos,patronB);
    if (patronB = true) then begin
      writeln('CUMPLE CON LO PEDIDO!!!');
      end
    else
      writeln('El patron B no cumple con lo pedido.');
    end
  else
    writeln('El patron A no cumple con lo pedido.');
  writeln('Presione ENTER para finalizar');
  readln;
end.
