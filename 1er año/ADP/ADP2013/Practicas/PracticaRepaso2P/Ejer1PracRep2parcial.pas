Program ejer1pracRepaso;
type
  cadena = string [30];
  fecha = record
        dia:integer;
        mes:integer;
        anio:integer;
        end;
  pendrive = record
        nroarchivo:integer;
        fechacreacion:fecha;
        fechaactualizacion:fecha;
        extension:cadena;
        tamanio:integer;
        end;
  lista = ^nodol;
  nodol = record
        dato:pendrive;
        sig:lista;
        end;
  registro = record
        tamanio:integer;
        archivos:lista;
        end;
  arbol = ^nodoa;
  nodoa = record
        dato:registro;
        hijoizq:arbol;
        hijoder:arbol;
        end;

procedure agregarnodo (var l2:lista; pend:pendrive);
  var
    nue:lista;
  begin
    new (nue);
    nue^.dato:= pend;
    nue^.sig:= l2;
    l2:= nue;
  end;

procedure insertar (var a:arbol; pend:pendrive);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato.tamanio:= pend.tamanio;
      agregarnodo (a^.dato.archivos,pend);
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (pend.tamanio = a^.dato.tamanio) then begin
        agregarnodo (a^.dato.archivos,pend);
        end
      else
        if (pend.tamanio < a^.dato.tamanio) then begin
          insertar (a^.hijoizq,pend);
          end
        else
          insertar (a^.hijoder,pend);
  end;

function buscar (a:arbol;aux:integer):arbol;
  begin
    if (a = nil) then begin
      buscar:= nil;
      end
    else
      if (aux = a^.dato.tamanio) then begin
        buscar:= a;
        end
      else
        if (aux < a^.dato.tamanio) then begin
          buscar:= buscar (a^.hijoizq,aux);
          end
        else
          buscar:= buscar (a^.hijoder,aux);
  end;

procedure eliminararchivo (var l2:lista; nro:integer);
  var
    ant,act:lista;
  begin
    act:= l2;
    ant:= l2;
    while (act <> nil) and (act^.dato.nroarchivo <> nro) do begin
      ant:= act;
      act:= act^.sig;
      end;
    if (act <> nil) then begin
      if (act = l2) then begin
        l2:= act^.sig;
        end
      else
        ant^.sig:= act^.sig;
      dispose (act);
      end;
  end;

procedure incisoB (var a:arbol; aux,nro:integer);
  var
    auxarbol:arbol;
  begin
    auxarbol:= buscar (a,aux);
    if (auxarbol <> nil) then begin
      eliminararchivo(auxarbol^.dato.archivos,nro);
      end
    else
      writeln('No existe ningun archivo de tamanio ',aux);
  end;

procedure incisoC (a:arbol; var cant:integer);
  begin
    if (a <> nil) then
      if (a^.dato.tamanio > 1024) then
        if (a^.dato.tamanio < 102400) then begin
          while (a^.dato.archivos <> nil) do begin
            cant:= cant + 1;
            a^.dato.archivos:= a^.dato.archivos^.sig;
            end;
          incisoC (a^.hijoizq,cant);
          incisoC (a^.hijoder,cant);
          end
        else
          incisoC (a^.hijoder,cant);
  end;

procedure incisoD (a:arbol; var cantext:integer);
  begin
    if (a <> nil) then begin
      while (a^.dato.archivos <> nil) do begin
        if (a^.dato.archivos^.dato.extension = 'txt') or (a^.dato.archivos^.dato.extension = 'pdf') then
          cantext:= cantext + 1;
        a^.dato.archivos:= a^.dato.archivos^.sig;
        end;
      incisoD (a^.hijoizq,cantext);
      incisoD (a^.hijoder,cantext);
      end;
  end;

var
  a:arbol;
  l:lista;
  aux,nro,cant,cantext:integer;
begin
  a:= nil;
  cant:= 0;
  cantext:= 0;
  while (l <> nil) do begin
    insertar (a,l^.dato);
    l:= l^.sig
    end;
  writeln ('Ingrese tamanio y numero de archivo que desea eliminar');
  write ('Tamanio: ');
  readln (aux);
  write('Numero de archivo: ');
  readln (nro);
  incisoB (a,aux,nro);
  incisoC (a,cant);
  writeln ('La cantidad de archivos cuyo tamanio es mayor que 1024KB y menor a 102400KB es: ',cant);
  incisoD (a,cantext);
  writeln ('La cantidad de archivos que poseen extension "txt" o "pdf" es: ',cantext);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
