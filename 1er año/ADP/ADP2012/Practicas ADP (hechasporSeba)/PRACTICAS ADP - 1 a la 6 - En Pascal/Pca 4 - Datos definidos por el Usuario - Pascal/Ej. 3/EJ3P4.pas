{3.- Realice un programa que lea dos letras L1 y L2 y lea una sucesión de
caracteres terminada en punto, e informe cuántos caracteres en total se
repiten entre L1 y L2.

Ejemplo: L1=a    L2=e

Losoa+ cyas5ah oy yus 5e6 7 g rand7mpljnyekldfjhglkjd5a4hh326.

Hay 6caracteres entre L1 y L2 que se repiten.

Note que los caracteres L1 y L2 pueden no existir.                          }

{-----------------------------------------------------------------------------}

program Ej3P4;
type
  caracteres=set of char;

var
  leidos:caracteres;
  L1:char;
  L2:char;
  car:char;
  repetidos:integer;

begin
  writeln ('Ingrese caracter para L1');
  readln (L1);

  writeln ('Ingrese caracter para L2');
  readln (L2);

  writeln ('Ingrese secuencia de caracteres terminada en . ');
  read(car);

  {Inicializo Variables}
  repetidos:= 0;
  leidos:= [];

  while (car <> '.') do begin     {Condicion General de FIN}
    if (car = L1) then begin
      read(car);
      while ((car <> L2) and (car <> '.')) do begin  { Fin de contar repetidas}
        if car in leidos then begin
          repetidos:= repetidos + 1;
        end
        else
          leidos:= leidos + [car];
          read(car);
      end;
    end
    else
      read(car);
  end;
  writeln ('La cantidad de caracteres repetidos fue ', repetidos);
  writeln ('Presione ENTER para finalizar');
  readln();
  readln();
end.

