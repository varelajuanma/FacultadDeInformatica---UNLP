program p13ej2;
type
    cadena=string[30];
    arbol=^nodoarbol;
    nodoarbol=record
                    nombre:cadena;
                    izq:arbol;
                    der:arbol;
              end;
procedure CrearArbol (var a:arbol);
begin
     a:=nil;
end;
procedure insertar (var a:arbol; dato:cadena);
begin
     if (a=nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.nombre:=dato;
          end
          else
          if (dato < a^.nombre) then
          begin
               insertar(a^.izq,dato);
               end
               else
               insertar(a^.der,dato);
end;
function buscar (a:arbol; dato:cadena):boolean;
begin
     if (a = nil) then
     begin
          buscar:=false;
          end
          else
          if (a^.nombre = dato) then
          begin
               buscar:=true;
               end
               else
               if (dato < a^.nombre) then
               begin
                    buscar(a^.izq,dato);
                    end
                    else
                    buscar(a^.der,dato);
end;
procedure incisoB(a:arbol);
begin
     if (a <> nil) then
     begin
          if (a^.izq <> nil) then
             incisoB(a^.izq);
          writeln(a^.nombre);
          if (a^.der <> nil) then
             incisoB(a^.der);
     end;
end;
procedure incisoC(a:arbol);
begin
     if (a <> nil) then
     begin
          if (a^.der <> nil) then
             incisoB(a^.der);
          writeln(a^.nombre);
          if (a^.izq <> nil) then
             incisoB(a^.izq);
     end;
end;
var
   a:arbol;
   dato:cadena;
begin
     CrearArbol(a);
     write('.Ingrese Nuevo Nombre: ');
     readln(dato);
     while (dato <> 'zzz') do
     begin
          insertar(a,dato);
          write('Ingrese Nuevo Nombre: ');
          readln(dato);
     end;
     write('Ingrese Nombre a Buscar: ');
     readln(dato);
     writeln('El Nombre "',dato,'" Se Encuentra En La Estructura?: ',buscar(a,dato));
     incisoB(a);
     writeln('---------------------');
     incisoC(a);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
