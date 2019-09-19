{9.- Se lee una secuencia de caracteres terminada en ‘.’ (punto).
Informar cuales son las vocales que no aparecieron en la secuencia.

Ejemplo: axps0)c/v&wo1e. 
Deberia informar: i u                                                         }

{-----------------------------------------------------------------------------}

program Ej9P4;
type
  conjvocales = set of char;


var
  voc: conjvocales;
  car: char;


begin
  voc:= ['a','e','i','o','u'];

  writeln ('Ingrese secuencia de caracteres terminada en .');
  read (car);

  while (car <> '.') do begin
    if (car in voc) then
      voc:= voc - [car];
    read (car);
  end;
  if ('a' in voc) then writeln ('a : Vocal no ingresada en la secuencia');
  if ('e' in voc) then writeln ('e : Vocal no ingresada en la secuencia');
  if ('i' in voc) then writeln ('i : Vocal no ingresada en la secuencia');
  if ('o' in voc) then writeln ('o : Vocal no ingresada en la secuencia');
  if ('u' in voc) then writeln ('u : Vocal no ingresada en la secuencia');
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


