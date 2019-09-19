program actividad1Cuat2Corregido;
type
    cadena=string[30];
    indice=1..5;
    pasajero=record
                  dni:integer;
                  nombre:cadena;
                  tarifa:indice;
                  edad:integer;
            end;
    listapasajeros=^reg;
    reg=record
              datos:pasajero;
              sig:listapasajeros;
        end;
    registro=record
                   codigo:integer;
                   capacidad:integer;
                   listado:listapasajeros;
             end;
    lista=^nodo;
    nodo=record
               vuelo:registro;
               sig:lista;
         end;
    vector=array[indice]of real;
procedure maximo (cantaux:integer; var codmax:integer; var max:integer;l:lista);
begin
     if (cantaux > max) then
     begin
          max:=cantaux;
          codmax:=l^.vuelo.codigo;
     end;

end;
procedure recaudacion(totalrec:real; var v:vector;l:lista);
var
   cod:integer;
begin
     cod:=l^.vuelo.listado^.datos.tarifa;
     totalrec:=totalrec + v[cod];
end;
function analizar(dni:integer):boolean;
var
   resto:integer;
   impares:integer;
begin
     impares:=0;
     while ((dni <> 0) and (impares =0))do
     begin
          resto:=dni MOD 10;
          if (resto MOD 2 = 0) then
          begin
               dni:=dni DIV 10;
               end
               else
               impares:=1;
          if (impares = 0) then
          begin
               analizar:=true;
               end
               else
               analizar:=false;
     end;
end;
var
   l:lista;
   v:vector;
   codmax:integer;
   max:integer;
   totalrec:real;
   totalpas:integer;
   cantaux:integer;
   capacidad:integer;
   dni:integer;
begin
     capacidad:=0;
     max:=-1;
     while (l <> NiL) do
     begin
          totalpas:=0;
          totalrec:=0;
          cantaux:=0;
          while (l^.vuelo.listado <> NiL) do
          begin
               dni:=l^.vuelo.listado^.datos.dni;
               if (l^.vuelo.listado^.datos.edad < 18) then
                  if (analizar(dni) = true) then
                     cantaux:=cantaux + 1;
               recaudacion(totalrec,v,l);
               totalpas:=totalpas + 1;
               l^.vuelo.listado:=l^.vuelo.listado^.sig;
          end;
          if (totalpas = l^.vuelo.capacidad) then
             capacidad:=capacidad + 1;
          maximo(cantaux,codmax,max,l);
          writeln('La recaudacion del vuelo: ',l^.vuelo.codigo,' ,fue de: ',totalrec,' pesos');
          l:=l^.sig;
     end;
     writeln('la cantidad de vuelos que completaron su capacidad de pasajeros fueron: ',capacidad,' vuelos');
     writeln('el vuelo con mayor cantidad de pasajeros menores de 18 y con DNI con todos digitos pares, fue el vuelo: ',codmax);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
