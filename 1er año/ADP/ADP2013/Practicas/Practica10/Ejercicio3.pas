Program ejer3;
type
  palabra = string [60];
  lista = ^nodo;
  nodo = record
       dato:palabra;
       sig:lista;
       end;

function existe (pri:lista; pal:palabra):boolean;
  var
    encontro:boolean;
  begin
    encontro:= false;
    while (pri <> nil) and (encontro = false) do begin
      if (pri^.dato = pal) then
        encontro:= true;
      pri:= pri^.sig;
      end;
    if (encontro = false) then begin
      existe:= false;
      end
    else
      existe:= true;
  end;

var
  pri,ult,nue:lista;
  pal1,pal2:palabra;
begin
  pri:= nil;
  write('Ingrese palabra para la lista: ');
  readln(pal1);
  while (pal1 <> 'fin') do begin
    new(nue);
    nue^.dato:= pal1;
    if (pri = nil) then begin
      pri:= nue;
      end
    else
      ult^.sig:= nue;
      ult:= nue;
      ult^.sig:= nil;
    write('Ingrese palabra para la lista: ');
    readln(pal1);
    end;
  write('Ingrese palabra a buscar: ');
  readln(pal2);
  if (existe(pri,pal2) = true) then begin
    writeln('La palabra a buscar fue encontrada en la lista');
    end
  else
    writeln('La palabra a buscar no se encuentra dentro de la lista');
  writeln('Presione ENTER para finalizar');
  readln;
end.
