Program ejer2prac12;
type
  cadena = string [30];
  alumno = record
         apellido:cadena;
         numero:integer;
         dni:integer;
         end;
  lista = ^nodo;
  nodo = record
         dato:alumno;
         sigape:lista;
         signum:lista;
         sigdni:lista;
         end;
  listatriple = record
         priape:lista;
         prinum:lista;
         pridni:lista;
         end;

procedure leerAlumno (var al:alumno);
  begin
    writeln ('----NUEVO ALUMNO----');
    write('Ingrese el numero de DNI: ');
    readln(al.dni);
    if (al.dni <> 0) then begin
      write('Ingrese el apellido: ');
      readln(al.apellido);
      write('Ingrese el numero de alumno: ');
      readln(al.numero);
      end;
  end;

procedure agregarApellido (var lt:listatriple; nue:lista);
  var
    ant,act:lista;
  begin
    act:= lt.priape;
    while (act <> nil) and (nue^.dato.apellido > act^.dato.apellido) do begin
      ant:= act;
      act:= act^.sigape;
      end;
    if (act = lt.priape) then begin   {AGREGA PRIMERO}
      nue^.sigape:= lt.priape;
      lt.priape:= nue;
      end
    else                             {AGREGA EN EL MEDIO O AL FINAL}
      ant^.sigape:= nue;
      nue^.sigape:= act;
  end;

procedure agregarNumero (var lt:listatriple; nue:lista);
  var
    ant,act:lista;
  begin
    act:= lt.prinum;
    while (act <> nil) and (nue^.dato.numero > act^.dato.numero) do begin
      ant:= act;
      act:= act^.signum;
      end;
    if (act = lt.prinum) then begin   {AGREGA PRIMERO}
      nue^.signum:= lt.prinum;
      lt.prinum:= nue;
      end
    else                             {AGREGA EN EL MEDIO O AL FINAL}
      ant^.signum:= nue;
      nue^.signum:= act;
  end;

procedure agregarDNI (var lt:listatriple; nue:lista);
  var
    ant,act:lista;
  begin
    act:= lt.pridni;
    while (act <> nil) and (nue^.dato.dni > act^.dato.dni) do begin
      ant:= act;
      act:= act^.sigdni;
      end;
    if (act = lt.pridni) then begin   {AGREGA PRIMERO}
      nue^.sigdni:= lt.pridni;
      lt.pridni:= nue;
      end
    else                             {AGREGA EN EL MEDIO O AL FINAL}
      ant^.sigdni:= nue;
      nue^.sigdni:= act;
  end;

procedure agregar (var lt:listatriple; al:alumno);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato:= al;
    nue^.sigape:= nil;
    nue^.signum:= nil;
    nue^.sigdni:= nil;
    agregarApellido (lt,nue);
    agregarNumero (lt,nue);
    agregarDNI (lt,nue);
  end;

var
  lt:listatriple;
  al:alumno;
begin
  lt.priape:= nil;
  lt.prinum:= nil;
  lt.pridni:= nil;
  leerAlumno (al);
  while (al.dni <> 0) do begin
    agregar (lt,al);
    leerAlumno (al);
    end;
  writeln('---------------');
  writeln('---------------');
  while (lt.pridni <> nil) do begin
    writeln('------------');
    writeln(lt.pridni^.dato.numero);
    writeln(lt.pridni^.dato.apellido);
    writeln(lt.pridni^.dato.dni);
    lt.pridni:= lt.pridni^.sigdni;
    end;
  writeln('Presione ENTER para finalizar');
  readln;
end.
