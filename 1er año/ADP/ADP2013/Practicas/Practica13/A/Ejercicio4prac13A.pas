Program ejer4prac13A;
type
  cadena = string[30];
  alumno = record
         legajo:integer;
         apellido:cadena;
         nombre:cadena;
         dni:integer;
         anioingreso:integer;
         end;
  lista = ^nodo;
  nodo = record
         dato:alumno;
         sig:lista;
         end;
  arbol = ^nodoarbol;
  nodoarbol = record
         dato:alumno;
         hijoizq:arbol;
         hijoder:arbol;
         end;

procedure insertar (var a:arbol; alum:alumno);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato:= alum;
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (alum.legajo < a^.dato.legajo) then begin
        insertar (a^.hijoizq,alum);
        end
      else
        insertar (a^.hijoder,alum);
  end;

procedure incisoA (a:arbol);
  begin
    if (a <> nil) then begin
      if (a^.dato.legajo > 12803) then begin
        writeln(a^.dato.apellido,' ',a^.dato.nombre);
        incisoA(a^.hijoizq);
        incisoA(a^.hijoder);
        end
      else
        incisoA(a^.hijoder);
      end;
  end;

procedure incisoB (a:arbol);
  begin
    if (a <> nil) then begin
      if (a^.dato.legajo > 2803) then begin
        if (a^.dato.legajo < 6982) then begin
          writeln(a^.dato.apellido,' ',a^.dato.nombre);
          incisoB(a^.hijoizq);
          incisoB(a^.hijoder);
          end
        else
          incisoB(a^.hijoizq);
        end
      else
        incisoB(a^.hijoder);
      end;
  end;

var
  a:arbol;
  alum:alumno;
  l:lista;
begin
  a:= nil;
  while (l <> nil) do begin
    if (l^.dato.anioingreso > 2000) then begin
      alum:= l^.dato;
      insertar (a,alum);
      end;
    l:= l^.sig;
    end;
  writeln('ALUMNOS CON LEGAJO MAYOR A 12803');
  incisoA (a);
  writeln('ALUMNOS CON LEGAJO MAYOR A 2803 Y MENOR A 6982');
  incisoB (a);
  writeln('Presione ENTER para finalizar');
  readln;
end.
