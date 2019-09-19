								{Pca. 2 - Ej. 6}
{6.- Se desea procesar la información de los productos del INDEC. De cada producto se leen los
siguiente datos: código de producto, precio y si pertenece a la canasta básica o no. La lectura
de los productos termina cuando se lee un código de producto igual a -1, el cual no debe
procesarse. Se pide calcular los dos productos más caros y el valor total de la canasta básica.}

program Ej6P2;
var
  codigo: integer;
  precio: integer;
  canastabasica: char; {"S"= SI ; "N"= NO}
  preciomax1: real;
  preciomax2: real;
  codmax1: integer;
  codmax2: integer;
  valortotalcanastabasica: real;
begin
  preciomax1:= -1;
  preciomax2:= -1;
  codmax1:= 0;
  codmax2:= 0;
  valortotalcanastabasica:= 0;
  
  writeln ('Ingrese por favor el codigo del producto : ');
  readln (codigo);
  while (codigo <> -1) do begin
    writeln ('Ingrese el precio : ');
    readln (precio);
	writeln ('Ingrese "S" si pertenece a canasta basica; o ingrese "N" si no pertenece : ');
    read (canastabasica);
    if (canastabasica = 'S') or (canastabasica = 's') then
      valortotalcanastabasica:= valortotalcanastabasica + precio;
	
	if (precio > preciomax1) then begin
	  preciomax2:= preciomax1;
	  codmax2:= codmax1;
	  preciomax1:= precio;
	  codmax1:= codigo;
	end
	else
	  if (precio > preciomax2) then begin
	    preciomax2:= precio;
		codmax2:= codigo;
	  end;
     writeln ('Ingrese por favor el codigo del producto : ');
     readln (codigo);

  end;
  write (' El 1er. producto mas caro es el : ' , codmax1, ' con ', preciomax1:2:2, ' $ ');
  writeln ();
  write (' El 2do. producto mas caro es el : ' , codmax2, ' con ', preciomax2:2:2, ' $ ');
  writeln ();
  write (' El valor total de la canasta basica es de : ', valortotalcanastabasica:2:2, ' con ', ' $ ');
  writeln ();
  write ('Presione ENTER para finalizar');
  readln ();
end.
