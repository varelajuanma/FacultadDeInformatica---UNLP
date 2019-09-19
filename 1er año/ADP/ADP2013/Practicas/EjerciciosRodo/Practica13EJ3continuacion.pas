program p13ej3cont;
type
    registro=record
                   cantidad:integer;
                   codigo:integer;
                   cliente:integer;
             end;
    lista=^nodolista;
    nodolista=record
                    dato:registro;
                    sig:lista;
              end;
    lista2=^nodolista2;
    nodolista2=record
                     cliente:integer;
                     sig:lista2;
               end;
    registro2=record
                    cant:integer;
                    lcliente:lista2;
              end;
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    dato:registro2;
                    cod:integer;
              end;
function buscar(a:arbol; dato:integer):arbol;
begin
     if (a=nil) then
     begin
          buscar:=nil;
          end
          else
          if(dato = a^.cod) then
          begin
               buscar:=a;
               end
               else
               if (dato < a^.cod) then
               begin
                    buscar:=buscar(a^.izq,dato);
                    end
                    else
                    buscar:=buscar(a^.der,dato);
end;
procedure insertar (var a:arbol; nuevo:lista2; dato:registro);
begin
     if (a = nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.cod:=dato.codigo;
          while (a^.dato.lcliente <> nil) do
          begin
               a^.dato.lcliente:= a^.dato.lcliente^.sig;
          end;
          a^.dato.lcliente:=nuevo;
          end
          else
          if (dato.codigo < a^.cod)then
          begin
               insertar(a^.izq,nuevo,dato);
               end
               else
               insertar(a^.der,nuevo,dato);
end;
procedure cargar (var a:arbol; dato:registro);
var
   nuevo:lista2;
   ok:boolean;
   aux:arbol;
begin
     new(nuevo);
     nuevo^.cliente:=dato.cliente;
     nuevo^.sig:=nil;
     aux:=buscar(a,dato.codigo);
     if (aux = nil) then
     begin
          insertar(a,nuevo,dato);
          end
          else
          aux^.dato.cant:=dato.cantidad;
          while (aux^.dato.lcliente <> nil) do
          begin
               if (aux^.dato.lcliente^.cliente = nuevo^.cliente) then
                  ok:=true;
               aux^.dato.lcliente:=aux^.dato.lcliente^.sig;
          end;
          if (ok <> true) then
             aux^.dato.lcliente:=nuevo;
end;
procedure informar(aux:lista2);
begin
     while (aux <> nil) do
     begin
          writeln('cliente: ',aux^.cliente);
          aux:=aux^.sig;
     end;
end;
procedure incisoB(a:arbol);
begin
     if (a <> nil) then
     begin
          if (a^.cod >= 4) then
          begin
               if (a^.cod <= 11) then
               begin
                    writeln('LISTA DE CLIENTES QUE COMPRARON EL PRODUCTO: ',a^.cod);
                    informar(a^.dato.lcliente);
                    incisoB(a^.izq);
                    incisoB(a^.der);
                    end
                    else
                    incisoB(a^.izq);
               end
               else
               incisoB(a^.der);
     end;
end;
procedure incisoC(a:arbol);
begin
     if (a <> nil) then
     begin
          incisoC(a^.izq);
          if (a^.dato.cant >= 100) and (a^.dato.cant <= 200) then
             writeln('ESTE PRODUCTO SE TUVO UNA VENTA MAYOR A 100 Y MENOR A 200 UNIDADES: ',a^.cod);
          incisoC(a^.der);
     end;
end;
procedure recorrer(list:lista2; var aux:integer);
begin
     aux:=0;
     while (list <> nil) do
     begin
          aux:=aux + 1;
          list:=list^.sig;
     end;
end;
procedure incisoD(a:arbol; var max1,max2,cant1,cant2:integer);
var
   aux:integer;
begin
     if (a <> nil) then
     begin
          if (a^.cod <= 72) then
          begin
               recorrer(a^.dato.lcliente,aux);
               if (aux > cant1) then
               begin
                    cant2:=cant1;
                    max2:=max1;
                    cant1:=aux;
                    max1:=a^.cod;
                    end
                    else
                    if (aux > cant2) then
                    begin
                         cant2:=aux;
                         max2:=a^.cod;
                    end;
               incisoD(a^.izq,max1,max2,cant1,cant2);
               incisoD(a^.der,max1,max2,cant1,cant2);
               end
               else
               incisoD(a^.izq,max1,max2,cant1,cant2);
     end;
end;
var
   a:arbol;
   l:lista;
   dato:registro;
   cant1:integer;
   cant2:integer;
   max1:integer;
   max2:integer;
begin
     a:=nil;
     cant1:=0;
     cant2:=0;
     writeln('CARGAR DATOS DE VENTAS');
     while (l <> nil) do
     begin
          dato:=l^.dato;
          cargar(a,dato);
          l:=l^.sig;
     end;
     writeln('INFORMAR CODIGOS DE CLIENTES QUE REALIZARON COMPRAS PARA LOS CODIGOS QUE ESTAN ENTRE 4 Y 11');
     incisoB(a);
     writeln('INFORMAR CODIGO DE PASTA QUE TUVIERON UNA CANTIDAD VENDIDA MAYOR A 100 Y MENOR A 200');
     incisoC(a);
     incisoD(a,max1,max2,cant1,cant2);
     writeln('LA PASTA QUE MAS SE VENDIO CON CODIGO MENOR A 72 ES: ',max1,' CON UN TOTAL DE: ',cant1,' unidades');
     writeln('LA SEGUNDA PASTA QUE MAS SE VENDIO CON CODIGO MENOR A 72 ES: ',max2,' CON UN TOTAL DE: ',cant2,' unidades');
     writeln('ingrese ENTER para finalizar');
     readln;
end.
