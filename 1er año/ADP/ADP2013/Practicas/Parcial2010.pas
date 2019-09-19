Program parcial2010;
type
  vehiculo = record
           patente:string;
           aniofab:integer;
           dniprop:integer;
           monto:real;
           end;
  lista = ^nodol;
  nodol = record
        dato:vehiculo;
        sig:lista;
        end;
  registro = record
           anio:integer;
           montotot:real;
           end;
  arbol = ^nodoa;
  nodoa = record
        dato:registro;
        hijoizq:arbol;
        hijoder:arbol;
        end;

procedure insertar (var a:arbol; anio:integer; mont:real);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato.anio:=anio;
      a^.dato.montotot:= mont;
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (anio = a^.dato.anio) then begin
        a^.dato.montotot:= a^.dato.montotot + mont;
        end
      else
        if (anio < a^.dato.anio) then begin
          insertar (a^.hijoizq,anio,mont);
          end
        else
          insertar (a^.hijoder,anio,mont);
  end;

procedure incisoA (l:lista; var a:arbol);
  var
    auxanio:integer;
    auxmon:real;
  begin
    while (l <> nil) do begin
      auxanio:= l^.dato.aniofab;
      auxmon:= l^.dato.monto;
      insertar (a,auxanio,auxmon);
      l:= l^.sig;
      end;
  end;

procedure incisoB (a:arbol; var min:real; var aniomin:integer);
  begin
    if (a <> nil) then begin
      if (a^.dato.anio >= 1995) then begin
        if (a^.dato.anio <= 2010) then begin
          if (a^.dato.montotot < min) then begin
            min:= a^.dato.montotot;
            aniomin:= a^.dato.anio;
            end;
          incisoB (a^.hijoizq,min,aniomin);
          incisoB (a^.hijoder,min,aniomin);
          end
        else
          incisoB (a^.hijoizq,min,aniomin);
        end
      else
        incisoB (a^.hijoder,min,aniomin);
      end;
  end;

var
  l:lista;
  a:arbol;
  min:real;
  aniomin:integer;
begin
  a:= nil;
  min:= 999;
  writeln ('-------GENERAR ARBOL------');
  incisoA (l,a);
  incisoB (a,min,aniomin);
  writeln ('El monto minimo fue de ',min,' en el anio ',aniomin);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
