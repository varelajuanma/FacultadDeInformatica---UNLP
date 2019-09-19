                                {EJ. 7 - PCA-3}
{7.- Se lee una secuencia de caracteres terminada en '*'.
La secuencia está dividida en oraciones que terminan en '.'.
Para cada oración se pide contar e informar la cantidad de veces que aparece la
subsecuencia 'TE'. Además informar en cuántas oraciones no aparece dicha
subsecuencia.}


program Ej7P3;
var
  car: char;
  ant: char;
  siTE: integer;
  noTE: integer;

begin
  noTE:= 0;
  writeln ('Ingrese secuencias de caracteres terminadas en . ');
  read( car);
  while (car = ' ') do
    read (car);

  while (car <> '*') do begin
    siTE:= 0;
    while (car = ' ') do
      read (car);
    while (car <> '.') do begin
      ant:= car;
      read (car);
      if ((ant = 'T') and (car = 'E')) then
        siTE:= siTE + 1;
      while (car = ' ') do
        read (car);
    end;
    writeln ('En esta oracion, la subsecuencia "TE" aparecio : ', siTE, ' veces');
    if (siTE = 0) then
      noTE:= noTE + 1;

    read (car);
  end;

  writeln (noTE, ' oraciones no tuvieron la subsecuencia TE ');
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
