{10.- Se lee una secuencia de números terminada en 999. Informar para cada
número cuáles son los dígitos que se repiten en el mismo.

Ejemplo:

8915181 ? se repiten 1 8

92121   ? se repite 1 2

501      ? no se repite ningún dígito

999

Nota: los dígitos que se repiten en un número deben informarse solo una vez. }

{-----------------------------------------------------------------------------}

program Ej10P4;
type
  number = 0..9;
  numeros = set of number;

var
  //conjnumeros: numeros;
  leidos: numeros;
  repetidos: numeros;
  digito: integer;
  num: integer;
  i: integer;

begin
  //conjnumeros:= [0..9];
  writeln ('Ingrese un numero : ');
  read (num);                         {Leo 1er numero}

  while (num <> 999 ) do begin    {Condicion de FIN - Evaluo si num es <>  999}
    leidos:= [];
    repetidos:= [];

    while (num > 0) do begin          {Mientras sea > 0, descompongo y evaluo}
      digito:= num mod 10;
      if ((digito in leidos) and (not (digito in repetidos))) then
        repetidos:= repetidos + [digito];
      leidos:= leidos + [digito];
      num:= num div 10;
    end;
    for i:= 0 to 9 do begin
      if (i in repetidos) then               {Evaluo los nros repet, e imprimo}
        writeln ('Se repite el numero : ', i);
    end;

    writeln ('Numero nuevo : ');
    read (num);                                  {Leo nuevamente un numero}
  end;
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.





