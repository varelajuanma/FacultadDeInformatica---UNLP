Program ejer5;
type
  cadena30 = string [30];
  electrodomestico = record
           codigo:integer;
           tipo:cadena30; {licuadora,tostadora,cafetera}
           marca:cadena30;
           nombrecliente:cadena30;
           falla:cadena30;
           monto:real;
           end;

procedure leerelectrodomestico (var elec:electrodomestico);
  begin
    with elec do begin
      write('Ingrese codigo del electrodomestico: ');
      readln(codigo);
      if (codigo <> -1) then begin
        write('Ingrese tipo del electrodomestico: ');
        readln(tipo);
        write('Ingrese marca del electrodomestico: ');
        readln(marca);
        write('Ingrese el nombre del cliente: ');
        readln(nombrecliente);
        write('Ingrese la falla del electrodomestico: ');
        readln(falla);
        write('Ingrese el monto de reparacion del electrodomestico: ');
        readln(monto);
        end;
      end;
  end;

procedure incisoA (var elec:electrodomestico; var marca:cadena30);
  var
    cantreparacion:integer;
  begin
    if (elec.marca = marca) and (codigo <> -1) do
      cantreparacion:= cantreparacion + 1;

procedure incisoB (var elec:electrodomestico; var marca:cadena30);

procedure incisoC (var elec:electrodomestico; var licuadoras:integer);
  begin
    if (elec.tipo = 'licuadora') and (elec.monto >= 50) do
      licuadoras:= licuadoras + 1;
  end;

begin

end.
