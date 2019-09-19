Program ejercicio2;
type
  subrango = 0 .. 9;
  conjunto = set of subrango;
var
  numero,digito,i:integer;
  leidos,repetidos:conjunto;
begin
  write('Ingrese un numero: ');
  readln(numero);
  while (numero <> 999) do begin
    leidos:= [];
    repetidos:= [];
    while (numero <> 0) do begin
      digito:= numero MOD 10;
      if (digito IN leidos) then
        repetidos:= repetidos + [digito];
      leidos:= leidos + [digito];
      numero:= numero DIV 10;
      end;
    for i:=0 to 9 do
      if (i IN repetidos) then
        writeln('Se repite el digito: ',i);
    if (repetidos = []) then
        writeln('No se repitio ningun digito');
    write('Ingrese otro numero: ');
    readln(numero);
    end;
  writeln('Ingrese ENTER para finalizar');
  readln;
end.



