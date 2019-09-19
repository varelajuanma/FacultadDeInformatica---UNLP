                            {EJ.1 - P5}

{1.- Escriba un módulo que lea una secuencia de caracteres terminada en punto,
y retorne verdadero si en la secuencia aparece al menos una vez la 'p' seguida
de la ‘a’, o que retorne falso en caso contrario.
Nota: en caso de encontrar la subsecuencia ‘pa’ se debe dejar de procesar.    }

{-----------------------------------------------------------------------------}
program Ej1P5;
var
  encontro: boolean;

procedure secuencia (var enc:boolean);
  var
    ant: char;
    car:char;
  begin
    writeln ('Ingrese 1er. caracter');
    readln (car);
    while ((car <> '.') and (enc = False)) do begin
      ant:= car;
      writeln ('Ingrese caracter');
      readln (car);
      if ((ant = 'p') and (car = 'a')) then
        enc:= True;
    end;
  end;

begin
  encontro:=False;
  secuencia (encontro);
  writeln ('¿ La secuencia (pa) fue encontrada ? : ', encontro);
  writeln ('Presione ENTER para finalizar');
  readln ();
end.







