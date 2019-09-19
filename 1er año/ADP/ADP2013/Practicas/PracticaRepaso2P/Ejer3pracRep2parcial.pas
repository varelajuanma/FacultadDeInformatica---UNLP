Program ejer3pracRepaso;
Uses
  tinvitado;
type
  lista = ^nodol;
  nodol = record
        dato:invitado;
        sig:lista;
        end;
  registro = record
        distancia:integer;
        cantfam:integer;
        end;
  arbol = ^nodoa;
  nodoa = record
        dato:registro;
        hijoizq:arbol;
        hijoder:arbol;
        end;

procedure insertar (var a:arbol; dist,cantf:integer);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato.distancia:= dist;
      a^.dato.cantfam:= cantf;
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (dist < a^.dato.distancia) then begin
        insertar (a^.hijoizq,dist,cantf);
        end
      else
        insertar (a^.hijoder,dist,cantf);
  end;

function buscar (a:arbol;dist:integer):arbol;
  begin
    if (a = nil) then begin
      buscar:= nil;
      end
    else
      if (dist = a^.dato.distancia) then begin
        buscar:= a;
        end
      else
        if (dist < a^.dato.distancia) then begin
          buscar:= buscar (a^.hijoizq,dist);
          end
        else
          buscar:= buscar (a^.hijoder,dist);
  end;

procedure incisoA (l:lista; var a:arbol);
  var
    dist,cantf:integer;
    auxf:boolean;
    auxa:arbol;
  begin
    while (l <> nil) do begin
      auxf:= verfamiliar (l^.dato);
      if (auxf = true) then begin
        cantf:= 1;
        dist:= verdistancia (l^.dato);
        end;
      auxa:= buscar(a,dist);
      if (auxa = nil) then begin
        insertar (a,dist,cantf);
        end
      else
        auxa^.dato.cantidad:= auxa^.dato.cantidad + 1;
      l:= l^.sig;
      end;
  end;

procedure incisoB (a:arbol; var canttotal:integer);
  begin
    if (a <> nil) then begin
      if (a^.dato.dist < 150) then begin
        canttotal:= canttotal + a^.dato.cantfam;
        incisoB (a^.hijoizq,canttotal);
        end
      else
        incisoB (a^.hijoizq,canttotal);
      end;
  end;

procedure incisoC (l:lista);
  var
    ape,apemax:string;
    totalape,max:integer;
  begin
    max:= -1;
    while (l <> nil) do begin
      verapellido (l^.dato,ape);
      totalape:= 0;
      while (ape = l^.dato.apellido) do begin
        totalape:= totalape + 1;
        l:= l^.sig;
        end;
      writeln ('APELLIDO: ',ape);
      writeln ('Cantidad total de invitados con apellido ',ape': ',totalape);
      if (totalape > max) then begin
        max:= totalape;
        apemax:= ape;
        end;
      end;
    writeln ('El apellido con mayor cantidad de invitados es: ',apemax);
  end;

var
  l:lista;
  a:arbol;
  dist,cantf,cantototal:integer;
begin
  a:= nil;
  canttotal:= 0;
  writeln ('GENERAR NUEVA ESTRUCTURA');
  incisoA (l,a);
  incisoB (a,canttotal);
  writeln ('La cantidad de invitados que son familiares y se encuentran a menos de 150km es: ',canttotal);
  writeln ('----------------------');
  incisoC (l);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
