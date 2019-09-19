Program ejer4B;
type
  conjletras= set of char;
var
  car,L1,L2: char;
  leidos: conjletras;
  cantrep: integer;
begin
  cantrep:= 0;
  leidos:= [];
  write('Ingrese un caracter para L1: ');
  readln(car);
  L1:= car;
  write('Ingrese un caracter para L2: ');
  readln(car);
  L2:= car;
  write('Ingrese un caracter: ');
  readln(car);
  while (car <> '.') do begin
    if (car = L1) then begin
      write('Ingrese un caracter: ');
      readln(car);
      while (car <> L2) do begin
        if (car IN leidos) then
          cantrep:= cantrep + 1;
        leidos:= leidos + [car];
        write('Ingrese un caracter: ');
        readln(car);
        end;
      end;
    write('Ingrese un caracter: ');
    readln(car);
    end;
  writeln('La cantidad de letras entre L1 y L2 repetidas es: ',cantrep);
  writeln('Presione ENTER para finalizar');
  readln;
end.
