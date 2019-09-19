Program ejer7;
var
  DNI,totalpasA,totalpasB,cupo:integer;
  car:char;
  valorpas,totalA,totalB:real;
begin
  totalpasA:=0;
  totalpasB:=0;
  totalA:=0;
  totalB:=0;
  cupo:=0;
  write('ingrese DNI del pasajero: ');
  readln(DNI);
  while (DNI <> -1) and (cupo <= 2000) do begin
    write('ingrese categoria de pasaje: ');
    readln(car);
    if (car = 'A') then
      totalpasA:=totalpasA + 1;
    if (car = 'B') then
        totalpasB:=totalpasB + 1;
    write('ingrese valor del pasaje: ');
    readln(valorpas);
    if (car = 'A') then
      totalA:=totalA + valorpas;
    if (car = 'B') then
      totalB:=totalB + valorpas;
    cupo:=cupo + 1;
    write('ingrese DNI del siguiente pasajero: ');
    readln(DNI);
    end;
  if (cupo <> 2000) then begin
    if (totalpasA < totalpasB) then
      writeln('la categoria A tuvo menos pasajeros que la B');
    if(totalpasB < totalpasA) then
      writeln('la categoria B tuvo menos pasajeros que la A');
    end;
  writeln('el monto total de la categoria A es: ',totalA);
  writeln('el monto total de la categoria B es: ',totalB);
  writeln('presione ENTER para finalizar');
  readln ();
end.
