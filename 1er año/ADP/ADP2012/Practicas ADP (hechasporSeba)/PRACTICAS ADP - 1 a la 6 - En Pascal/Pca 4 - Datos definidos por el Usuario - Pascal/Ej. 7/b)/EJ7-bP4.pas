{7.- a) Se leen 10 números enteros. Determinar para cada uno de ellos la
suma de sus cifras hasta expresarlas en una sola unidad, e informar.

Ejemplos:

12853 ---> 19 ----> 10 ----> 1

280 ---> 10 ---->  1

3005---> 8

b) Modifique a) para imprimir en letras la cifra resultante.                 }



{-----------------------------------------------------------------------------}

program Ej7bP4;
var
  num: integer;
  sumadigitos: integer;
  i: integer;
  digito: integer;

begin
  for i:= 1 to 10 do begin
    sumadigitos:= 0;
    writeln ('Ingrese un numero, NRO. ORDEN = ', i, ' : ');
    read (num);
    while (num > 0) do begin
      digito:= num mod 10;
      sumadigitos:= sumadigitos + digito;
      num:= num div 10;
    end;
    while (sumadigitos > 9) do begin
      num:= sumadigitos;
      sumadigitos:= 0;
      while (num > 0) do begin
        digito:= num mod 10;
        sumadigitos:= sumadigitos + digito;
        num:= num div 10;
      end;
    end;
    case sumadigitos of
      1: begin writeln ('RESULTADO = UNO') end;
      2: begin writeln ('RESULTADO = DOS') end;
      3: begin writeln ('RESULTADO = TRES') end;
      4: begin writeln ('RESULTADO = CUATRO') end;
      5: begin writeln ('RESULTADO = CINCO') end;
      6: begin writeln ('RESULTADO = SEIS') end;
      7: begin writeln ('RESULTADO = SIETE') end;
      8: begin writeln ('RESULTADO = OCHO') end;
      9: begin writeln ('RESULTADO = NUEVE') end;
    end;
  end;
  writeln ('Se han ingresado 10 numeros');
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
