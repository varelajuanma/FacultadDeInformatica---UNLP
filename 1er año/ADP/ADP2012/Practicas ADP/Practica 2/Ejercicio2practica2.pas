Program ejer2prac2;
var
  precip:real;
  precipmax:real;
  precipmin:real;
  m:integer;
  d:integer;
  diamax:integer;
  diamin:integer;
  mesmax:real;
  mesmin:real;
  promedio:real;
  precipxmes:real;
  nummesmax:integer;
  nummesmin:integer;
begin
  mesmax:=-1;
  mesmin:=999;
  for m:=1 to 12 do begin
    precipxmes:=0;
    promedio:=0;
    precipmax:=-1;
    precipmin:=999;
    for d:=1 to 30 do begin
      writeln('ingrese precipitacion del ',d ,' dia, del mes ',m);
      readln(precip);
      precipxmes:=precipxmes + 1;
      if (precip > precipmax) then begin
        precipmax:=precip;
        diamax:=d;
      end;
      if (precip < precipmin) then begin
        precipmin:=precip;
        diamin:=d;
      end;
    end;
    promedio:=precipxmes / 30;
    if (promedio > mesmax) then begin
      mesmax:=promedio;
      nummesmax:=m;
    end;
    if (promedio < mesmin) then begin
      mesmin:=promedio;
      nummesmin:=m;
    end;
  end;
  writeln('la precipitacion maxima fue de ',precipmax, 'el dia ',diamax,' del mes ',m);
  writeln('la precipitacion minima fue de ',precipmin, 'el dia ',diamin,' del mes ',m);
  writeln('la precipitacion promedio mayor fue en el mes ',nummesmax);
  writeln('la precipitacion promedio menor fue en el mes ',nummesmin);
  readln;
  readln;
end.
