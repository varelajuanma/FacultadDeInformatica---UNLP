program p13ej2cont;
type
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    dato:integer;
              end;
procedure insertar(var a:arbol; num:integer);
begin
     if (a = nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.dato:=num;
          end
          else
          if (num < a^.dato) then
          begin
               insertar(a^.der,num);
               end
               else
               insertar(a^.izq,num);
end;
procedure recorrer(a2:arbol;var a:arbol);
var
   num:integer;
begin
     if (a2 <> nil) then
     begin
          recorrer(a2^.izq,a);
          if (a2^.dato MOD 2 <> 0) then
          begin
               num:=a2^.dato;
               insertar(a,num);
          end;
          recorrer(a2^.der,a);
     end;
end;
var
   a:arbol;
   a2:arbol;
begin
     a:=nil;
     recorrer(a2,a);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
