Program ejer3cap2;
type
  productos = record
            nombre:string;
            cantidad:integer;
            precio:real;
            tipo:string; {comestible,limpieza,vestimenta}
            end;
  arch_prod = file of productos;

procedure recorrido (var archprod:arch_prod);
  var
    prod:productos;
  begin
    reset(archprod);
    while not eof(archprod) do begin
      read(archprod,prod);
      if (prod.tipo = 'limpieza') or (prod.cantidad > 100) then begin
        writeln('------PRODUCTO------');
        writeln('Nombre: ',prod.nombre);
        writeln('Cantidad: ',prod.cantidad);
        writeln('Precio: ',prod.precio);
        writeln('Tipo: ',prod.tipo);
        end;
      end;
    close(archprod);
  end;

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
  recorrido(archprod);
  writeln('Ingrese ENTER para finalizar');
  readln;
end.
