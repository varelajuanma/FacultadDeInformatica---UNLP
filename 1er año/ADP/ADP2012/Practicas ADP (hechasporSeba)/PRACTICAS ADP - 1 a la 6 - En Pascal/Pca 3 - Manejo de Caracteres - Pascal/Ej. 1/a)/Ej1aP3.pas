{                              EJ. 1)a)                                        }


program Ej1aP3;
var
  caract: char;
  cantidad: integer;
begin
  cantidad:= 0;
  writeln ('Ingrese un caracter : ');
  readln (caract);
  while (caract <> '.') do begin
    cantidad:= cantidad+1;
    writeln ('Ingrese nuevamente un caracter');
    readln (caract);
  end;
  writeln ('La cantidad de caracteres leidos es de : ' ,cantidad);
  writeln ('Presione ENTER para finalizar ');
  readln ();
end.
