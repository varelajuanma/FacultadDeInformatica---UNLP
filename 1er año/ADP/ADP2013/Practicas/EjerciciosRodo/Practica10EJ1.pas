Program p10ej1;
type
    lista=^registro;
    registro=record
                   dato:integer;
                   sig:lista;
             end;
procedure CrearLista(var l:lista);
var
   nueva:lista;
   num:integer;
begin
     writeln('ingrese un numero');
     readln(num);
     while(num <> 999) do
     begin
          new(nueva);
          nueva^.dato:=num;
          nueva^.sig:=l;
          l:=nueva;
          writeln('ingrese otro numero');
          readln(num);
     end;
     writeln('lista creada');
end;
procedure longitud(l:lista; var long:integer);
begin
     long:=0;
     while (l <> Nil) do
     begin
          long:=long+1;
          l:=l^.sig;
     end;
end;
procedure analizar(l:lista; var cant:integer);
var
   pares:integer;
   aux:integer;
begin
     cant:=0;
     while (l <> Nil) do
     begin
          aux:=l^.dato;
          while (aux >= 0) do
          begin
               if (aux MOD 2 = 0) then
                  pares:=pares + 1;
               aux:=aux DIV 10;
          end;
          if (pares = 3) then
             cant:=cant + 1;
          l:=l^.sig;
     end;
end;
var
   l:lista;
   cant:integer;
   long:integer;
begin
     l:=Nil;
     CrearLista(l);
     longitud(l,long);
     analizar(l,cant);
     writeln('la longitud de la lista de numeros enteros es de: ',long,' elementos');
     writeln('la cantidad de numeros enteros que contienen 3 numeros pares es: ',cant,' elementos');
     writeln('ingrese ENTER para finalizar');
     readln;
end.
