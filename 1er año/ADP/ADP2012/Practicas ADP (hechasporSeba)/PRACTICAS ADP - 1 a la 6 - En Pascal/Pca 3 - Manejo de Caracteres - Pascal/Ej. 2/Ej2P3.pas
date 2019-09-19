{                                   EJ. 2                                     }

{2.-  Se lee una secuencia de caracteres hasta encontrar  un punto.
Contar la cantidad de palabras e informar la longitud de la palabra más larga
que comienza con 't'. }

program Ej2P3;
var
  cant: integer;
  car: char;
  palabras: integer;
  palabramaxt: integer;

begin
  palabramaxt:= 0;
  palabras:= 0;
  writeln ('Por favor ingrese el 1er. caracter :');
  read (car);
  while (car = ' ') do
    read (car);
  while (car <> '.') do begin
    cant:= 0;    {VER}
    if (car = 't') then begin
      cant:= cant + 1;
      palabras:= palabras + 1;
      read (car);
      while (car <> '.') and (car <> ' ') do begin
        cant:= cant + 1;
        read (car);
      end;
      if (cant > palabramaxt) then
        palabramaxt:= cant;
    while (car <> '.') and (car <> ' ') do
      read (car);
    palabras:= palabras + 1;
    end;
    read (car);
  end;
  writeln ('La cantidad de palabras es : ' ,palabras);
  writeln ('La palabra mas larga que comienza con la letra "t" es de ' ,palabramaxt, ' caracteres');
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
