Program ejer7;
type
  cadena30 = string [30];
  rango = 1 .. 10;
  investigacion = record
                titulo:cadena30;
                autor:cadena30;
                DNI:integer;
                codigoarea:rango;
                end;
  vectorcodigo = array [rango] of integer;
  vectornumeros = array [rango] of integer;

procedure inicializarvector (var v1:vectorcodigo; var v2:vectornumeros);
  var
    i:integer;
  begin
    for i:= 1 to 10 do begin
      v1[i]:= 0;
      v2[i]:= 0;
      end;
  end;

procedure leerinvestigacion (var inv:investigacion);
  begin
    with inv do begin
      write('Ingrese el titulo de la investigacion: ');
      readln(titulo);
      write('Ingrese el autor de la investigacion: ');
      readln(autor);
      write('Ingrese DNI del autor: ');
      readln(DNI);
      if (autor <> 'Marcelo Martinez') or (DNI <> 22469751) then begin
        write('Ingrese el codigo de area de investigacion: ');
        readln(codigoarea);
        end;
      end;
  end;

procedure incisoA (var inv:investigacion; var v2:vectornumeros);
  var
    num,digito,i:integer;
  begin
    num:= inv.DNI;
    while (num <> 0) do begin
      digito:= num MOD 10;
      v2[digito]:= v2[digito] + 1;
      num:= num DIV 10;
      end;
    for i:= 1 to 10 do
      writeln('El digito ',i,' aparece ',v2[i],' veces en el DNI');
  end;

procedure cargarvector (var inv:investigacion; var v1:vectorcodigo);
  var
    codigo:integer;
  begin
    codigo:= inv.codigoarea;
    v1[codigo]:= v1[codigo] + 1;
  end;

procedure incisoB (var v1:vectorcodigo);
  var
    min1,min2,i,codigo1,codigo2:integer;
  begin
    min1:= 999;
    min2:= 999;
    for i:= 1 to 10 do begin
      if (v1[i] < min1) then begin
        min1:= v1[i];
        codigo1:= i;
        min2:= min1;
        codigo2:= codigo1;
        end
      else
        if (v1[i] < min2) then begin
          min2:= v1[i];
          codigo2:= i;
          end;
      end;
    writeln('La primer area que tuvo menos trabajos es la del codigo ',codigo1,' con ',min1,' trabajos');
    writeln('La segunda area que tuvo menos trabajos es la del codigo ',codigo2,' con ',min2,' trabajos');
  end;

var
  v1:vectorcodigo;
  v2:vectornumeros;
  inv:investigacion;
begin
  inicializarvector (v1,v2);
  writeln('INGRESE INVESTIGACION');
  leerinvestigacion (inv);
  while (inv.autor <> 'Marcelo Martinez') or (inv.DNI <> 22469751) do begin
    incisoA (inv,v2);
    cargarvector (inv,v1);
    leerinvestigacion (inv);
    end;
  incisoB (v1);
  writeln('Presione ENTER para finalizar');
  readln;
end.

