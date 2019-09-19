program p13ej1;
type
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    dato:integer;
                    der:arbol;
              end;
procedure CrearArbol (var a:arbol);
begin
     a:=nil;
end;
procedure insertar (var a:arbol; num:integer);
begin
     if (a=nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.dato:=num;
          end
          else
          if (num < a^.dato) then
          begin
               insertar(a^.izq,num);
               end
               else
               insertar(a^.der,num);
end;
var
   a:arbol;
   num:integer;
begin
     CrearArbol(a);
     write('Ingrese Numero: ');
     readln(num);
     while (num <> 0) do
     begin
          insertar(a,num);
          write('Ingrese Nuevo Numero: ');
          readln(num);
     end;
end.
