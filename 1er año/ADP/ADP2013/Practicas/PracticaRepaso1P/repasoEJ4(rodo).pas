program repasoEJ4;
type
    codigo=1..4;
    cadena=string[15];
    registro=record
                   nombre:cadena;
                   apellido:cadena;
                   montobasico:real;
                   categoria:codigo;
             end;
    vector=array[codigo]of real;
procedure leer(var cliente:registro);
begin
     with cliente do
     begin
          writeln('ingrese apellido');
          readln(apellido);
          if (apellido <> 'zzz') then
          begin
               writeln('ingrese nombre');
               readln(nombre);
               writeln('ingrese monto basico a pagar');
               readln(montobasico);
               writeln('ingrese categoria de servicio');
               readln(categoria);
          end;
     end;
end;
procedure iniciar(var total:vector);
var
   i:integer;
begin
     for i:=1 to 4 do
     begin
          total[i]:=0;
     end;
end;
procedure sumar(var total:vector; cliente:registro; var tabla:vector);
var
   pos:integer;
begin
     pos:=cliente.categoria;
     total[pos]:=total[pos] + cliente.montobasico + tabla[pos];
end;
procedure recaudado(var total:vector);
var
   i:integer;
begin
     for i:=1 to 4 do
     begin
          writeln('el monto total recaudado para la categoria de servicio: ',i,' es: ',total[i]);
     end;
end;
procedure max(cliente:registro; var cantmax:real; var nomMax:cadena);
begin
     if (cliente.montobasico > cantmax) then
     begin
          cantmax:=cliente.montobasico;
          nomMax:=cliente.nombre;
     end;
end;
var
   total:vector;
   tabla:vector;
   cantmax:real;
   nomMax:cadena;
   cliente:registro;
begin
     cantmax:=0;
     nomMax:='zzz';
     iniciar(total);
     writeln('ingrese cliente');
     leer(cliente);
     while (cliente.apellido <> 'zzz') do
     begin
          sumar(total,cliente,tabla);
          if (cliente.categoria = 2) then
             max(cliente,cantmax,nomMax);
          writeln('ingrese otro cliente');
          leer(cliente);
     end;
     writeln('recaudacion total para todos los sercicios');
     recaudado(total);
     if (nomMax = 'zzz') then
     begin
          writeln('nadie pago servicio de cable categoria 2');
          end
          else
          writeln('el nombre de la persona que mas pago por el servicio de cable 2 es: ',nomMax);
          writeln('ingrese ENTER para finalizar');
          readln;
end.
