program ej2;

var
  max: real;
  min: real;
  precipxmes: real;
  promediomes: real;
  maxmes: real;
  minmes: real;
  precip: real;
  i: integer;
  j: integer;
  diamin:integer;
  diamax:integer;
  nummesmax:integer;
  nummesmin:integer;
begin
  maxmes:= -1;
  minmes:= 9999;
  for i:= 1 to 12 do begin
    precipxmes:= 0;
    promediomes:= 0;
    max:= -1;
    min:= 9999;
    for j:= 1 to 30 do begin
      write('Ingrese la precipitacion del dia : ', j, ' del mes ', i,' : '  );
      read(precip);
      precipxmes:= precipxmes+precip;
      if (precip > max) then begin
        max:= precip;
	      diamax:= j;
	    end;
	    if (precip < min) then begin
        min:= precip;
	      diamin:= j;
	    end;
    end;
    writeln('La precipitacion maxima es: ',max:2:2, ' y el dia fue: ',diamax);
    writeln('La precipitacion minima es: ',min:2:2, ' y el dia fue: ',diamin);
    writeln();
    promediomes:= precipxmes / 30;
    if(promediomes > maxmes)then begin
      maxmes:= promediomes;
	    nummesmax:= i;
    end;
    if(promediomes < minmes)then begin
      minmes:= promediomes;
	    nummesmin:= i;
    end;
  end;
 writeln('el mes con mas precipitacion es: ',nummesmax);
 writeln('el mes con menos precipitacion es: ',nummesmin);
 Write('Pulse ENTER para finalizar');
 readln();
 readln();
end.
