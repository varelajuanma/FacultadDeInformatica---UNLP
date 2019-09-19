program embarazadas;
var
i: integer;
j: integer;
peso: real;
sumapeso: real;
max: real;
min: real;
emb: integer;

begin
writeln();
Writeln ('-------------Primer Programa del Sebis------------'); writeln();
min:= 1000;
for i:= 1 to 5 do begin               {REPETIR 5}
  sumapeso:= 0;
  max:= -1;
  for j:= 1 to 9 do begin             {REPETIR 9}
    write ('ingrese el peso correspondiente al mes  ', j, ' de la Embarazada ', i, ' : ');
    read (peso);
    sumapeso:= sumapeso + peso;
    if (peso > max) then
      max:= peso;
  end;
  writeln ('el peso maximo de la embarazada  ',i,'  es: ',max:2:2, ' kilos'); readln();
  readln ();
  if (sumapeso < min) then
    begin
      min:= sumapeso;
      emb:= i;
    end
end;
writeln ('la embarazada que menos peso es :  ', emb, '  con :   ', min:2:2, '  kilos en total');
writeln ('Presione ENTER para Finalizar');
readln ();
{case i of
  1: write ('juana');
  2: write ('olivia');
  3: write ('sofia');      ///Ver tema de los Case.-
  4: write ('lucia');
  5: write ('lara');}
end.



