                          {EJ.5 - P5, MARTIN}

{5.- Se lee una secuencia de números enteros terminada en 999. Determinar si
la secuencia cumple con el patrón

"A" 555 "B", donde: 555 seguro existe.

"A" debe ser una secuencia de al menos 6 números y debe cumplir que la suma de
los dígitos de cada numero es a lo sumo 20.

"B" debe ser una secuencia de X números pares, donde X es la cantidad de
números que aparecieron en "A"                                                }

{-----------------------------------------------------------------------------}

program p5e5;

procedure secuenciaA(var cant: integer; var cumple: boolean);

var
  //aux: integer;
  num: integer;
  suma: integer;

begin
  cumple := true;
  read(num);
  cant := 0;
  while (num <> 555) do
    begin
      cant := cant + 1;
//      aux := num;
      suma := 0;
      while (num > 0) do
        begin
          suma := suma + (num mod 10);
          num := num div 10;
        end;
//      writeln(suma);
      cumple := cumple and (suma < 20);
      read(num);
    end;
  cumple := cumple and (cant >= 6);
end;

procedure secuenciaB(cant : integer; var cumple : boolean);

var i, num : integer;

begin
  writeln(cant);
  cumple := true;
  for i := 1 to cant do
    begin
      read(num);
//      if (num mod 2) = 0 then
//        writeln('Par');
      cumple := cumple and ((num mod 2) = 0);
    end;
end;

var
  cumple : boolean;
  num, cant : integer;
begin
  secuenciaA(cant, cumple);
  if cumple then begin
    secuenciaB(cant, cumple);
    read(num);
    if (not cumple) then
      writeln('La tenes adentro');
    if (num = 999) and cumple then begin
      writeln('Cumple la secuencia');
      readln;
      readln;
    end
	else begin
      writeln('No Cumple la secuencia');
      readln;
      readln;
    end;
  end
  else begin
    writeln('No Cumple la secuencia');
    readln;
    readln;
  end;
end.
