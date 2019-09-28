Program ejer1;
type
  arch_numenteros = file of integer;
var
  enteros:arch_numenteros;
  num:integer;
  nombrefisico:string;
begin
  write('Ingrese el nombre del archivo: ');
  readln(nombrefisico);
  assign(enteros,nombrefisico);
  rewrite(enteros);
  write('Ingrese un numero: ');
  readln(num);
  while (num <> 0) do begin
    write(enteros,num);
    write('Ingrese un numero: ');
    readln(num);
    end;
  close(enteros);
  writeln('Presione ENTER para finalizar');
  readln;
end.
