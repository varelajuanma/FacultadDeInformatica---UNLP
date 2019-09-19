Program ejer6prac2;
var
  codigoproducto:integer;
  codigomax1:integer;
  codigomax2:integer;
  precio:real;
  canastabasica:integer; {'1' si pertenece y '2' si no pertecene}
  productomax1:real;
  productomax2:real;
  valortotal:real;
begin
  productomax1:=-1;
  productomax2:=-1;
  codigomax1:=0;
  codigomax2:=0;
  valortotal:=0;
  writeln('ingrese el codigo de un producto');
  readln(codigoproducto);
  while (codigoproducto <> -1) do begin
    writeln('ingrese el precio del producto');
    readln(precio);
    writeln('ingrese "1" o "2" para la canasta basica');
    readln(canastabasica);
    if (canastabasica = 1 ) then
      valortotal:=valortotal + precio;
    if (precio > productomax1) then begin
      productomax2:=productomax1;
      productomax1:=precio;
      codigomax2:=codigomax1;
      codigomax1:=codigoproducto;
    end
    else
      if(precio > productomax2) then begin
        productomax2:=precio;
        codigomax2:=codigoproducto
      end;
    writeln('ingrese el codigo de otro producto');
    read(codigoproducto);
  end;
  writeln('el primer producto mas caro es el codigo ',codigomax1);
  writeln('el segundo producto mas caro es el codigo ',codigomax2);
  writeln('el valor total de la canasta basica es de ',valortotal);
  readln;
  readln;
end.
