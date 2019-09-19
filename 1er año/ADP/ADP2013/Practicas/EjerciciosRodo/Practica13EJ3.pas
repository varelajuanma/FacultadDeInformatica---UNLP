program p13ej3;
type
    cadena=string[30];
    empleado=record
                   nombre:cadena;
                   numero:integer;
                   dni:integer;
             end;
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    dato:empleado;
              end;
procedure leer (var dato:empleado);
begin
     with dato do
     begin
          write('ingrese numero: ');
          readln(numero);
          if (numero <> 0) then
          begin
               write('ingrese nombre: ');
               readln(nombre);
               write('ingrese DNI: ');
               readln(dni);
          end;
     end;
end;
procedure insertar(var a:arbol; dato:empleado);
begin
     if (a = nil)then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.dato:=dato;
          end
          else
          if (dato.numero < a^.dato.numero) then
          begin
               insertar(a^.izq,dato);
               end
               else
               insertar(a^.der,dato);
end;
procedure incisoA(a:arbol);
begin
     if (a <> nil)then
     begin
          if (a^.dato.dni MOD 2 = 0) then
             writeln('el DNI de ',a^.dato.nombre,' es par');
          incisoA(a^.izq);
          incisoA(a^.der);
     end;
end;
procedure incisoB(a:arbol; var cant:integer);
begin
     if (a <> nil) then
     begin
          incisoB(a^.izq,cant);
          incisoB(a^.der,cant);
          cant:=cant + 1;
     end;
end;
var
   dato:empleado;
   a:arbol;
   cant:integer;
begin
     a:=nil;
     cant:=0;
     writeln('GENERAR ARBOL');
     writeln('----NUEVO EMPLEADO----');
     leer(dato);
     while (dato.numero <> 0) do
     begin
          insertar(a,dato);
          writeln('----NUEVO EMPLEADO----');
          leer(dato);
     end;
     writeln('VERIFICAR CUALES DE LOS EMPLEADOS TIENEN DNI PAR');
     incisoA(a);
     writeln('INFORMAR LA CANTIDAD DE EMPLEADOS REGISTRADOS');
     incisoB(a,cant);
     writeln('la cantidad de empleados registrados es: ',cant);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
