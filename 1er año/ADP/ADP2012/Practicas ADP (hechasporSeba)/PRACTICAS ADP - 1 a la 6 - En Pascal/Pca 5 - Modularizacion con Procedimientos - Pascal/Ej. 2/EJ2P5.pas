                            {EJ.2 - P5}

{2.- Se lee una secuencia de caracteres terminada en ‘*’.
Escriba un módulo que determine la cantidad de palabras de longitud cinco
que componen esa secuencia. Puede haber blancos al principio y al final de
la secuencia.    }

{-----------------------------------------------------------------------------}
program Ej2P5;

                  { ----- Proceso secuencia -----  }
procedure secuencia (var palab5: integer);
  var
    car: char;
    cant: integer;
                  { ----- Proceso descartar blancos -----  }
  procedure descartarblancos;
  begin
    while (car= ' ') do
      read (car);
  end;
                { ----- fin blancos -----  }
  begin
    writeln ('Ingrese secuencia de caracteres terminada en * ');
    read (car);
    descartarblancos;
    while (car <> '*') do begin
      cant:= 0;
      while ((car <> ' ') and (car <> '*')) do begin
        cant:= cant + 1;
        read (car);
      end;
      if (cant = 5) then
        palab5:= palab5 + 1;
      descartarblancos;
    end;
  end;
                { ----- fin secuencia -----  }

var
  palabras5: integer;
begin
  palabras5:= 0;
  secuencia (palabras5);
  writeln ('La cantidad de palabras de longitud 5 ingresadas, fueron : ', palabras5);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.

