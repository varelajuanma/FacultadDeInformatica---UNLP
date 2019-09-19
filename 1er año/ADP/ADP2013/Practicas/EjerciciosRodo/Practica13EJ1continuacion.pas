program p13ej1continuacion;
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
          if(num < a^.dato) then
          begin
               insertar(a^.izq,num);
               end
               else
               insertar(a^.der,num);
end;
procedure incisoA(a:arbol);
begin
     if (a <> nil) then
     begin
          incisoA(a^.der);
          writeln(a^.dato);
          incisoA(a^.izq);
     end;
end;
procedure incisoB(a:arbol);
begin
     if (a <> nil) then
     begin
          incisoB(a^.izq);
          if (a^.dato MOD 2 = 0) then
             writeln(a^.dato);
          incisoB(a^.der);
    end;
end;
procedure incisoC(a:arbol; var cant:integer);
begin
     if (a <> nil) then
     begin
          incisoC(a^.izq,cant);
          cant:=cant + 1;
          incisoC(a^.der,cant);
     end;
end;
var
   a:arbol;
   cant:integer;
   num:integer;
begin
     cant:=0;
     a:=nil;
     write('ingrese un nuevo numero: ');
     readln(num);
     while (num <> 0) do
     begin
          insertar(a,num);
          write('ingrese un nuevo numero: ');
          readln(num);
     end;
     writeln('IMPRIMIR LOS NUMEROS EN FORMA DECRECIENTE');
     incisoA(a);
     writeln('IMPRIMIR LOS NUMEROS PARES EN FORMA CRECIENTE');
     incisoB(a);
     incisoC(a,cant);
     writeln('LA CANTIDAD DE NUMEROS ES: ',cant);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
