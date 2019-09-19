program p13ej6;
type
    cadena=string[30];
    fecha=record
                dia:integer;
                mes:cadena;
                anio:integer;
          end;
    registro=record
                   apodo:cadena;
                   nombre:cadena;
                   familia:cadena;
                   edad:integer;
                   ingreso:fecha;
             end;
    lista=^nodo;
    nodo=record
               dato:registro;
               sig:lista;
         end;
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    nombre:cadena;
                    cant:integer;
              end;
function buscar(a:arbol; dato:cadena):arbol;
begin
     if (a = nil) then
     begin
          buscar:=nil;
          end
          else
          if (dato = a^.nombre) then
          begin
               buscar:=a;
               end
               else
               if (dato < a^.nombre)then
               begin
                    buscar(a^.izq,dato);
                    end
                    else
                    buscar(a^.der,dato);
end;
procedure insertar(var a:arbol; dato:cadena);
begin
     if (a = nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.nombre:=dato;
          a^.cant:=0;
          end
          else
          if (dato < a^.nombre) then
          begin
               insertar(a^.izq,dato);
               end
               else
               insertar(a^.der,dato);
end;
procedure recorrer(l:lista; var a:arbol);
var
   dato:cadena;
   aux:arbol;
begin
     while (l <> nil) do
     begin
          dato:=l^.dato.familia;
          aux:=buscar(a,dato);
          if (aux = nil) then
          begin
               insertar(a,dato);
               end
               else
               aux^.cant:=aux^.cant + 1;
          l:=l^.sig;
     end;
end;
procedure max(a:arbol; var nommax:cadena; var max:integer);
begin
     if (a <> nil) then
     begin
          if (a^.izq <> nil) then
             max(a,nommax,max);
          if (a^.cant > max) then
          begin
               nommax:=a^.nombre;
               max:=a^.cant;
          end;
          if (a^.der <> nil) then
             max(a,monmax,max);
     end;
end;
var
   l:lista;
   a:arbol;
   nommax:cadena;
   max:integer;
begin
     a:=nil;
     max:=-1;
     recorrer(l,a);
     max(a,nommax,max);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
