{6.Se lee una sucesión de números enteros terminados con el 9999, se desea obtener:
a)	La suma de todas las unidades.
b)	La suma de los tres últimos dígitos de cada número.
c)	El promedio de los números leídos.
Ejemplo: se leen los números 132, 4201, 372, 23025, 9999 (no se procesa)
La respuesta será a) 10, b) 6-3-12-7, c) 5546.}
Program ejer2;
var
  num,sumauni,suma3dig,dig1,dig2,dig3,sumanum,aux,auxnum:integer;
  prom:real;
begin
  sumauni:= 0;
  aux:= 0;
  sumanum:= 0;
  prom:= 0;
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 9999) do begin
    auxnum:= num;
    suma3dig:= 0;
    sumanum:= sumanum + num;
    aux:= aux + 1;
    if (num <> 0) then begin
      dig1:= num MOD 10;
      sumauni:= sumauni + dig1;
      num:= num DIV 10;
      end;
      if (num <> 0) then begin
        dig2:= num MOD 10;
        num:= num DIV 10;
        end;
        if (num <> 0) then begin
          dig3:= num MOD 10;
          num:= num DIV 10;
          end;
    suma3dig:= dig1 + dig2 + dig3;
    writeln('La suma de los ultimos 3 digitos del numero ',auxnum,' es: ',suma3dig);
    write('Ingrese un numero: ');
    readln(num);
    end;
  prom:= sumanum / aux;
  writeln('La suma de todas las unidades es: ',sumauni);
  writeln('El promedio de todos los numeros leidos es: ',prom);
  writeln('Ingrese ENTER para finalizar');
  readln();
end.
