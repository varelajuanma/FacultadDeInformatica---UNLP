                            {EJ.3 - P5}

{3.- Se lee una secuencia de caracteres terminada en ‘*’.
Escriba un módulo que procese la secuencia y retorne los caracteres
numéricos que no aparecen en la misma.
Realice un programa que invoque al módulo e imprima el resultado.      }

{-----------------------------------------------------------------------------}
program Ej3P5;
type
  number = set of char;

procedure procesar (var c: number);
  var
    car: char;
  begin
    writeln ('Ingrese secuencia de caracteres finalizada en *');
    read (car);
    while (car <> '*') do begin
      if (car in c) then
        c:= c - [car];
      read (car);
    end;
  end;

var
  conjnum: number;
  i: char;

begin
  conjnum:= ['0','1','2','3','4','5','6','7','8','9'];
  procesar (conjnum);
  for i:= '0' to '9' do begin
    if (i in conjnum) then
      writeln ('Los caracteres numericos que no aparecen son : ', i);
  end;
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.

