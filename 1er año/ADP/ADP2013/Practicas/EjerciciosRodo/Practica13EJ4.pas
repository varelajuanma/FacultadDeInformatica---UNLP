program p13ej4;
type
    cadena=string[30];
    alumno=record
                   nombre:cadena;
                   legajo:integer;
                   dni:integer;
                   ingreso:integer;
             end;
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    dato:alumno;
              end;
    lista=^nodo;
    nodo=record
               dato:alumno;
               sig:lista;
         end;

procedure insertar(var a:arbol; aux:alumno);
begin
     if (a = nil)then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.dato:=aux;
          end
          else
          if (aux.legajo < a^.dato.legajo) then
          begin
               insertar(a^.izq,aux);
               end
               else
               insertar(a^.der,aux);
end;
procedure incisoA(a:arbol);
begin
     if (a <> nil) then
     begin
          if (a^.dato.legajo > 12803)then
          begin
               writeln('El alumno ',a^.dato.nombre,' tiene legajo mayor a 12803');
               incisoA(a^.izq);
               incisoA(a^.der);
               end
               else
               incisoA(a^.der);
     end;
end;
procedure incisoB(a:arbol);
begin
     if (a <> nil) then
     begin
          if (a^.dato.legajo >= 12803) then
          begin
               if (a^.dato.legajo <= 6982) then
               begin
                    writeln('El alumno ',a^.dato.nombre,' tiene un numero de legajo mayor que 12803 y menor que 6982');
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
var
   aux:alumno;
   a:arbol;
   l:lista;
begin

     a:=nil;
     while (l <> nil) do
     begin
          if (l^.dato.ingreso > 2000) then
          begin
               aux:=l^.dato;
               insertar(a,aux);
          end;
          l:=l^.sig;
     end;
     incisoA(a);
     incisoB(a);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
