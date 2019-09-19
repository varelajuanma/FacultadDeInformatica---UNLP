Program ejer4;
type
  lista = ^nodo;
  nodo = record
       nombre:string[60];
       pais:string[60];
       sig:lista;
       end;

procedure cargarlista (var list:lista);
  var
    nom:string[60];
    pa:string[60];
    aux:lista;
  begin
    write('Ingrese un sitio turistico: ');
    readln(nom);
    while (nom <> 'fin') do begin
      write('Ingrese el pais del sitio turistico: ');
      readln(pa);
      new (aux);
      aux^.nombre:= nom;
      aux^.pais:= pa;
      aux^.sig:= list;
      list:= aux;
      write('Ingrese un sitio turistico: ');
      readln(nom);
       end;
  end;
procedure incisoA (var list:lista; var ocurrencias:integer);
  var
    pais2:string [60];
  begin
    write('Ingrese pais a verificiar: ');
    readln(pais2);
    while (list <> nil) do begin
      if (list^.pais = pais2) then
        ocurrencias:= ocurrencias + 1;
      list:= list^.sig;
      end;
  end;

var
  list:lista;
  ocurrencias:integer;
begin
  ocurrencias:= 0;
  cargarlista (list);
  incisoA (list,ocurrencias);
  writeln ('La cantidad de ocurrencias del pais a verificar fue de: ',ocurrencias);
  writeln('Presione ENTER para finalizar');
  readln;
end.
