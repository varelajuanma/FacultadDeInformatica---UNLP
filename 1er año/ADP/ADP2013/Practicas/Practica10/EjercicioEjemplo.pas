Program ejercicio2TP10;
type
  puntero=^nodo;
  nodo=record
    numero:integer;
    psig:puntero;
    end;
{PROCESO AGREGAR}
{Agrega un nuevo nodo al comienzo de la lista}
procedure agregar(var numeros:puntero; num:integer);
  var
    p:puntero;
  begin
    new(p);
    p^.numero:=num;
    p^.psig:=numeros;
    numeros:=p;
  end;
{PROCESO CARGARL}
{Carga la lista hasta leer el numero 999}
procedure cargarL(var numeros:puntero; var vacio:boolean);
  var
    num:integer;
  begin
    writeln('Ingrese Numero');
    readln(num);
    if (num = 999) then begin
      vacio:=True;
      end
    else
      while (num <> 999) do begin
        agregar(numeros,num);
        writeln('Ingrese Numero');
        readln(num);
        end;
  end;
{FUNCION IMPAR}
{Si el ultimo digito del numero pasado por parametro es impar, devuelve True}
function impar(num:integer):boolean;
  begin
    num:=num mod 10;
    if (num mod 2 <> 0) then begin
      impar:=True;
      end;
  end;
{Proceso Generar}
{Genera la lista de numeros pares, y saca el promedio}
procedure Generar(var numeros:puntero; var vacio:boolean);
  var
    aux:puntero; {puntero auxiliar}
    pares:puntero; {lista de numeros impares}
    contador:integer; {cantidad de numeros con el ultimo digito impar}
    porcentaje:real; {porcentaje entre numeros 10 y 50}
    total:integer; {cantidad total de numeros en la lista}
    num:integer;
  begin
    if (vacio <> True) then begin
      new(pares);
      aux:=numeros;
      total:=0;
      porcentaje:=0;
      while (aux <> nil) do begin
        total:= total + 1;
        num:=aux^.numero;
        if(num mod 2 = 0) then begin { si es par, la agrega a la lista nueva}
          agregar(pares,num);
          end;
        if (impar(num) = True) then begin {si el ultimo digito es impar lo cuenta}
          contador:=contador + 1;
          end;
        if (num > 9) and (num < 51) then begin {Si numero esta entre 10 y 50, lo cuenta}
          porcentaje:=porcentaje + 1;
          end;
        end;
        porcentaje:= porcentaje / total;
        writeln('La cantidad de numeros que terminan con un digito impar son: ',contador);
        writeln('El porcentaje de numeros entre 10 y 50 son: ',porcentaje);
        end
    else
      writeln('La lista esta vacia');
  end;
{VARIABLES GLOBALES}
var
  numeros:puntero;
  vacio:boolean;
{PRINCIAL}
begin
  new(numeros);
  cargarL(numeros,vacio);
  generar(numeros,vacio);
end.
