{4.- Se lee una secuencia de caracteres terminada en ‘*’.
Contar la cantidad de palabras de al menos seis caracteres que empiezan y
terminan con ‘s’, y en total tienen exactamente dos ‘e’.

Ejemplo:  sociedadesbbsextosbsociosbbbseriesb*      cantidad = 2 }


program Ej4P3;
var
  ant:char;
  car: char;
  cantpalabras: integer;
  cantletras: integer;
  ee: integer;

begin
  cantpalabras:= 0;
  writeln ('Ingrese una palabra.-');
  read (car);
  while (car = ' ') do
    read (car);

  while (car <> '*') do begin
    cantletras:= 0;
    ee:= 0;
    if (car = 's') then begin
      read (car);
      cantletras:= cantletras + 1;
      while (car <> ' ') and (car <> '*') do begin
        if (car = 'e') then
          ee:= ee+1;
        ant:= car;
        read (car);
        cantletras:= cantletras + 1;
      end;
      if (ee = 2) and (ant = 's') and (cantletras >= 6) then
        cantpalabras:= cantpalabras + 1;
    end
    else
      while (car = ' ') do
        read (car);
      while (car <> '*') and (car <> ' ') do
        read (car);
      while (car = ' ') do
        read (car);
  end;

  writeln ('La cantidad de palabras que "comienzan" y "terminan" con "s", y tienen 2 (e), son : ', cantpalabras );
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.

