Program ejer5;
var
  m,d,dmin,dmax,mmin,mmax:integer;
  precip,diamax,diamin,mesmax,mesmin,total:integer;
begin
  diamax:=-1;
  diamin:=999;
  mesmax:=-1;
  mesmin:=999;
  for m:=1 to 12 do begin
    total:=0;
    for d:=1 to 30 do begin
      write('ingrese precipitacion del dia ',d,':');
      read(precip);
      if (precip > diamax) then begin
        diamax:=precip;
        dmax:=d;
        end;
      if (precip < diamin) then begin
        diamin:=precip;
        dmin:=d;
        end;
      total:=total + precip;
      end;
    writeln('la precipitacion maxima del mes fue de ',diamax,' el dia ',dmax);
    writeln('la precipitacion minima del mes fue de ',diamin,' el dia ',dmin);
    if (total > mesmax) then begin
      mesmax:=total;
      mmax:=m;
      end;
    if (total < mesmin) then begin
      mesmin:=total;
      mmin:=m
      end;
    end;
  writeln('la precipitacion maxima promedio fue de ',mesmax,' el mes ',mmax);
  writeln('la precipitacion minima promedio fue de ',mesmin,' el mes ',mmin);
  readln;
  readln;
end.
