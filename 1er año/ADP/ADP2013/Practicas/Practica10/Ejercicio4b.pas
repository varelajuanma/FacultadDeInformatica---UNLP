Program ejer4b;
type
  cadena = string [50];
  sitio = record
        nombre:cadena;
        pais:cadena;
        end;
  lista = ^nodo;
  nodo = record
       dato:sitio;
       sig:lista;
       end;
  lista2 = ^nodo2;
  nodo2 = record
       nombre2:cadena;
       sig:lista2;
       end;

procedure cargarlista (var list:lista);
  var
    nom:cadena;
    pa:cadena;
    aux:lista;
  begin
    write('Ingrese un sitio turistico: ');
    readln(nom);
    while (nom <> 'fin') do begin
      write('Ingrese el pais del sitio turistico: ');
      readln(pa);
      new (aux);
      aux^.dato.nombre:= nom;
      aux^.dato.pais:= pa;
      aux^.sig:= list;
      list:= aux;
      write('Ingrese un sitio turistico: ');
      readln(nom);
       end;
  end;

procedure incisoA (var list:lista; var ocurrencias:integer);
  var
    pais2:cadena;
  begin
    write('Ingrese pais a verificiar: ');
    readln(pais2);
    while (list <> nil) do begin
      if (list^.dato.pais = pais2) then
        ocurrencias:= ocurrencias + 1;
      list:= list^.sig;
      end;
  end;

procedure agregaralfinal (var list:lista; var newsitio,newpais:cadena);
  var
    act,nue,ult:lista;
  begin
    new (nue);
    nue^.dato.nombre:= newsitio;
    nue^.dato.pais:= newpais;
    nue^.sig:= nil;
    if (list <> nil) then begin
      act:= nil;
      while (act <> nil) do begin
        ult:= act;
        act:= act^.sig;
        end;
      ult^.sig:= nue;
      end
    else
      list:= nue;
  end;

procedure incisoC (var list2:lista2; var list:lista; pais2:cadena);
  var
    ant,act,nue:lista2;
  begin
    while (list <> nil) do begin
      if (list^.dato.pais = pais2) then begin
        new (nue);
        nue^.nombre2:= list^.dato.nombre;
        act:= list2;
        ant:= list2;
        while (act <> nil) and (act^.nombre2 < nue^.nombre2) do begin
          ant:= act;
          act:= act^.sig;
          end;
        if (ant = act) then begin
          list2:= nue;
          end
        else
          ant^.sig:= nue;
          nue^.sig:= act;
        end;
      list:= list^.sig;
      end;
  end;

procedure recorrerlista2 (list2:lista2);
  begin
    while (list2 <> nil) do begin
      writeln('------LISTADO------');
      writeln(list2^.nombre2);
      list2:=list2^.sig;
      end;
  end;

var
  list:lista;
  list2:lista2;
  newsitio,newpais,pais2:cadena;
  ocurrencias:integer;
begin
  list:= nil;
  list2:= nil;
  ocurrencias:= 0;
  cargarlista(list);
  incisoA (list,ocurrencias);
  writeln ('La cantidad de ocurrencias del pais a verificar fue de: ',ocurrencias);
  write('Ingrese un nuevo sitio a cargar: ');
  readln(newsitio);
  write('Ingrese su pais: ');
  readln(newpais);
  agregaralfinal(list,newsitio,newpais);
  write('Ingrese pais para armar nueva lista con sus sitios: ');
  readln(pais2);
  incisoC (list2,list,pais2);
  recorrerlista2 (list2);
  writeln('Presione ENTER para finalizar');
  readln;
end.
