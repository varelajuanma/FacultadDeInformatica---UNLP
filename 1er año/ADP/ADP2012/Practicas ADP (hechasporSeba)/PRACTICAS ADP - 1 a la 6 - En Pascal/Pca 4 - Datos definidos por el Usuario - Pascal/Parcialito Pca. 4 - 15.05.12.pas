                  {PARCIALITO PRACTICA Nº 4 - 15/05/12}


{Se lee una secuencia de caracteres terminada en '.' Informar la cantidad de
palabras que comienzan con vocal
NOTA: No olvidarse de descartar blancos.}


program Parcialito;
type
  letras = set of char;

var
  vocales: letras;
  car: char;
  cantpalab: integer;
  primera: char;

begin
  vocales:= ['a','e','i','o','u','A','E','I','O','U'];
  cantpalab:= 0;

  writeln ('Ingrese secuencia de caracteres terminada en . ');
  read (car);
  while (car = ' ') do
    read (car);

  while (car <> '.') do begin
    if (car in vocales) then begin
      primera:= car;
      read (car);
      while ((car <> '.') and (car <> ' ')) do
        read (car);
      if (primera in vocales) then
        cantpalab:= cantpalab + 1;
    end;
    while ((car <> '.') and (car <> ' ')) do
      read (car);
    while (car = ' ') do
      read (car);
  end;
  writeln ('La cantidad de palabras que comienzan con Vocales son : ', cantpalab);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
