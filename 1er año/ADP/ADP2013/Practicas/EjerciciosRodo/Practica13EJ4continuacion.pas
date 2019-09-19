program p13ej4cont;
type
    cadena=string[30];
    registro=record
                   codigo:integer;
                   nombre:cadena;
                   actual:integer;
                   minimo:integer;
                   precio:real;
             end;
    lista=^nodolista;
    nodolista=record
                    datos:registro;
                    sig:lista;
              end;
    registro2=record
                    venta:integer;
                    cantvend:integer;
              end;
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    cod:integer;
                    dato:registro2;
              end;
    arbol2=^nodoarbol2;
    nodoarbol2=record
                     izq:arbol2;
                     der:arbol2;
                     cod:integer;
                     reponer:integer;
               end;
procedure actualizarstock(var l:lista; cant:integer; cod:integer);
begin
     while (l^.datos.codigo <> cod) do
     begin
          l:=l^.sig;
     end;
     l^.datos.actual:=l^.datos.actual - cant;
end;
procedure incisoA(a:arbol; var l:lista);
begin
     if (a <> nil) then
     begin
          actualizarstock(l,a^.dato.cantvend,a^.cod);
          incisoA(a^.izq,l);
          incisoA(a^.der,l);
     end;
end;
procedure insertar(var a2:arbol2; cod:integer; reponer:integer);
begin
     if (a2 = nil) then
     begin
          new(a2);
          a2^.izq:=nil;
          a2^.der:=nil;
          a2^.cod:=cod;
          a2^.reponer:=reponer;
          end
          else
          if (reponer < a2^.reponer) then
          begin
               insertar(a2^.izq,cod,reponer);
               end
               else
               insertar(a2^.der,cod,reponer);
end;
procedure incisoB(l:lista; var a2:arbol2);
var
   aux:integer;
begin
     while (l <> nil) do
     begin
          aux:=l^.datos.minimo - l^.datos.actual;
          if (aux > 0) then
             insertar(a2,l^.datos.codigo,aux);
          l:=l^.sig;
     end;
end;
procedure incisoC(a2:arbol2);
begin
     if (a2 <> nil) then
     begin
          if (a2^.reponer >= 500) then
          begin
               if (a2^.reponer <= 1000) then
               begin
                    writeln('EL PRODUCTO DE CODIGO: ',a2^.cod,' TIENE UN STOCK ACTUAL MENOR AL MINIMO');
                    incisoC(a2^.izq);
                    incisoC(a2^.der);
                    end
                    else
                    incisoC(a2^.izq);
               end
               else
               incisoC(a2^.der);
     end;
end;
var
   a:arbol;
   a2:arbol2;
   l:lista;
begin
     a2:=nil;
     writeln('ACTUALIZAR STOCK');
     incisoA(a,l);
     writeln('GENERAR ESTRUCTURA NUEVA DE PRODUCTOS CON MENOR STOCK QUE EL MINIMO');
     incisoB(l,a2);
     writeln('INFORMAR CODIGO DE PRODUCTO QUE POSEEN UN MENOR STOCK QUE EL MINIMO');
     incisoC(a2);
     writeln('ingreseENTER para finalizar');
     readln;
end.
