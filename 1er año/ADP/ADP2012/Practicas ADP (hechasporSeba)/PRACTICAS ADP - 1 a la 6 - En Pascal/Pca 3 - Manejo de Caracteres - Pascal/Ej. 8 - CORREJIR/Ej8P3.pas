                            {EJ. 8 - PCA.3}

{ 8.- Se lee una secuencia de caracteres terminadas en 'b.' (blanco punto).
La secuencia representa a un párrafo.
El párrafo es un conjunto de oraciones, donde cada oración está delimitada por
un '*'.
Sólo la oración final tiene 'b.' (blanco punto). 

Determinar: 
a) cantidad total de oraciones leídas. 
b) la oración con menor cantidad de palabras. 
c) la cantidad de veces que aparece la palabra ‘la’.   }

program Ej9P3;
var
  car: char;
  ant: char;
  totoraciones: integer;
  cantla:integer;
  cantpalabras: integer;
  paldeoracmin: integer;


begin
  totoraciones:= 0;
  paldeoracmin:= 3000;
  cantla:= 0;

  writeln ('Ingrese secuencia de caracteres');
  read (car);
  while (car = ' ') do
    read (car);

  ant:= car;
  read (car);
  while ((ant <> ' ') and (car <> '.')) do begin {Condicion de FIN de programa}
    cantpalabras := 0;

    while (car <> '*') do begin            {Condicion para FIN de una oracion}
      if ((ant = 'l') and (car = 'a')) then
        cantla := cantla + 1;
      ant:= car;
      read (car);
      if (car = ' ') then
        cantpalabras := cantpalabras + 1;
      if (car = '*') then begin
        totoraciones:= totoraciones + 1;
        cantpalabras := cantpalabras + 1;
      end;
    end;
    if (cantpalabras < paldeoracmin) then
      paldeoracmin:= cantpalabras;
    ant:= car;
    read (car);
    while (car = ' ') do
      read (car);
  end;
  writeln ('a) La cantidad total de oraciones leidas fueron : ', totoraciones );
  writeln ('b) La oracion con menor cantidad de palabras ingresadas fue de : ', paldeoracmin );
  writeln ('c) La cantidad de veces que aparece la palabra "la", son : ', cantla, ' veces ');
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
