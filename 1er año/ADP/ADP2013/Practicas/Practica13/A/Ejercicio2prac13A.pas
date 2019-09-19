Program ejer2prac13A;
type
  nombre = string;
  arbol = ^nodo;
  nodo = record
       dato:nombre;
       hijoizq:arbol;
       hijoder:arbol;
       end;

procedure insertar (var a:arbol; nombre:string);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato:= nombre;
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (nombre < a^.dato) then begin
        insertar (a^.hijoizq,nombre);
        end
      else
        insertar (a^.hijoder,nombre);
  end;

function buscar (var a:arbol; aux:string):boolean;
  begin
    if (a = nil) then begin
      buscar:=false;
      end
    else
      if (aux = a^.dato) then begin
        buscar:=true;
        end
      else
        if (aux < a^.dato) then begin
          buscar:=buscar (a^.hijoizq,aux);
          end
        else
          buscar:=buscar (a^.hijoder,aux);
  end;

procedure imprimir1(a:arbol);
  begin
    if (a <> nil) then begin
      if (a^.hijoizq <> nil) then
        imprimir1 (a^.hijoizq);
      writeln (a^.dato);
      if (a^.hijoder <> nil) then
        imprimir1 (a^.hijoder);
      end;
  end;

procedure imprimir2(a:arbol);
  begin
    if (a <> nil) then begin
      if (a^.hijoder <> nil) then
        imprimir2 (a^.hijoder);
      writeln (a^.dato);
      if (a^.hijoizq <> nil) then
        imprimir2 (a^.hijoizq);
      end;
  end;

var
  a:arbol;
  nom,aux:string;
begin
  a:= nil;
  write ('Ingrese un nombre a insertar: ');
  readln (nom);
  while (nom <> 'zzz') do begin
    insertar (a,nom);
    write('Ingrese un nombre a insertar: ');
    readln (nom);
    end;
  writeln ('----------------------');
  write('Ingrese un nombre a buscar en el arbol: ');
  readln (aux);
  if (buscar(a,aux) = true) then begin
    writeln ('El nombre ',aux,' se encuentra en el arbol');
    end
  else
    writeln ('El nombre ',aux,' NO se encuentra en el arbol');
  writeln ('-----------------------');
  imprimir1 (a);
  writeln ('-----------------------');
  imprimir2 (a);
  writeln ('-----------------------');
  write('Presione ENTER para finalizar');
  readln;
end.
