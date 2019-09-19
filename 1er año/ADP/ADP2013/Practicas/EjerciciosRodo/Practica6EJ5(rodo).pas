program p6ej4;
type
    cadena=string;
    aparato=record
                  codigo:integer;
                  cliente:cadena;
                  marca:cadena;
                  tipo:cadena;
                  falla:cadena;
                  monto:real;
            end;
procedure leer(var electrodomestico:aparato);
begin
     with electrodomestico do
     begin
          writeln('ingrese codigo');
          readln(codigo);
          if (codigo <> -1) then
          begin
               writeln('ingrese cliente');
               readln(cliente);
               writeln('ingrese marca');
               readln(marca);
               writeln('ingrese falla');
               readln(falla);
               writeln('ingrese monto');
               readln(monto);
               writeln('ingrese tipo');
               readln(tipo);
          end;
     end;
end;
procedure lic(electrodomestico:aparato; var licuadoras:integer);
begin
     if (electrodomestico.tipo = 'licuadora') and (electrodomestico.monto >= 50) then
        licuadoras:=licuadoras + 1;
end;
procedure analizar(electrodomestico:aparato; var reparacion:integer; var recaudacion:real);
begin
     reparacion:=reparacion + 1;
     recaudacion:=recaudacion + electrodomestico.monto;
end;
procedure max(var mayormarca:cadena; reparacion:integer; marca:cadena; var maxreparacion:integer);
begin
     if (reparacion > maxreparacion) then
     begin
          maxreparacion:=reparacion;
          mayormarca:=marca;
     end;
end;
var
   electrodomestico:aparato;
   marca:cadena;
   mayormarca:cadena;
   reparacion:integer;
   recaudacion:real;
   licuadoras:integer;
   maxreparacion:integer;
begin
     licuadoras:=0;
     maxreparacion:=0;
     writeln('ingrese electrodomestico');
     leer(electrodomestico);
     while (electrodomestico.codigo <> -1) do
     begin
          marca:=electrodomestico.marca;
          reparacion:=0;
          recaudacion:=0;
          while (electrodomestico.marca = marca) or (electrodomestico.codigo = -1) do
          begin
               analizar(electrodomestico,reparacion,recaudacion);
               lic(electrodomestico,licuadoras);
               writeln('ingrese otro electrodomestico');
               leer(electrodomestico);
          end;
          max(mayormarca,reparacion,marca,maxreparacion);
          writeln('el monto en reparaciones que recaudara la marca es:', recaudacion);
     end;
     writeln('la cantidad de licuadoras en reparacion cuyo precio del arreglo es igual o mayor que 50$ es:', licuadoras);
     writeln('la marca con mayor electrodomesticos en reparacion es:', mayormarca);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
