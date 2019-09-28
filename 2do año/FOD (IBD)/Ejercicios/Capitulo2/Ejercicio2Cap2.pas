Program ejer2cap2;
type
  productos = record
            nombre:string;
            cantidad:integer;
            precio:real;
            tipo:string; {comestible,limpieza,vestimenta}
            end;
  arch_prod = file of productos;

var
  archprod:arch_prod;
  nombrefisico:string;
  prod:productos;
begin
  write('Ingrese el nombre del archivo: ');
  readln(nombrefisico);
  assign(archprod,nombrefisico);
  rewrite(archprod);
  write('Ingrese el nombre del producto: ');
  readln(prod.nombre);
  while (prod.nombre <> 'ZZZ') do begin
    write('Ingrese la cantidad actual de este producto: ');
    readln(prod.cantidad);
    write('Ingrese el precio unitario de este producto: ');
    readln(prod.precio);
    write('Ingrese el tipo de producto: ');
    readln(prod.tipo);
    write(archprod,prod);
    write('Ingrese el nombre del producto: ');
    readln(prod.nombre);
    end;
  close(archprod);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
