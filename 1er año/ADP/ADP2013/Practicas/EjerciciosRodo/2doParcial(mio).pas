program parcial2;
type
    cadena=string[45];
    alumno=record
                 nombre:cadena;
                 apellido:cadena;
                 ciudad:cadena;
                 dni:integer;
                 ingreso:integer;
                 legajo:integer;
           end;
    lista=^nodolista;
    nodolista=record
                    alu:alumno;
                    sig:lista;
              end;
    arbol=^nodoarbol;
    nodoarbol=record
                    alu:alumno;
                    izq:arbol;
                    der:arbol;
              end;
procedure agregarAlumno(var a:arbol; dato:alumno);
begin
     if (a = nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.alu:=dato;
          end
          else
          if (dato.legajo < a^.alu.legajo) then
          begin
               agregarAlumno(a^.izq,dato);
               end
               else
               agregarAlumno(a^.der,dato);
end;
procedure incisoA(l:lista);
var
   cant:integer;
   ciudad:cadena;
begin
     while (l <> nil) do
     begin
          ciudad:=l^.alu.ciudad;
          cant:=0;
          while (l^.alu.ciudad = ciudad) do
          begin
               cant:=cant + 1;
               l:=l^.sig;
          end;
          writeln('la cantidad de alumnos de la ciudad ',ciudad,' es de: ',cant);
     end;
end;
procedure incisoB(a:arbol);
begin
     if (a <> nil) then
     begin
          if (a^.alu.legajo > 2803) then
          begin
               if (a^.alu.legajo < 6982) then
               begin
                    writeln(a^.alu.nombre);
                    writeln(a^.alu.apellido);
                    incisoB(a^.izq);
                    end
                    else
                    incisoB(a^.izq);
               end
               else
               incisoB(a^.der);
     end;
end;
var
   a:arbol;
   l:lista;
begin
     a:=nil;
     while (l <> nil) do
     begin
          if (l^.alu.ingreso > 2000) then
             agregarAlumno(a,l^.alu);
          l:=l^.sig;
     end;
     writeln('informar cantidad de alumnos por cada localidad de origen');
     incisoA(l);
     writeln('informar apellido y nombre de aquellos alumnos cuyo legajo este comprendido entre 2803 y 6982 y cuyo año de ingreso sea posterior a 2000');
     incisoB(a);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
