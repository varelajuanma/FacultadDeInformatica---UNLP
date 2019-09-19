                              {EJ.6 - P6}

{6.- Dado el siguiente segmento de código indicar que valor queda en la
variable res.

programa ejemplo;
Var
  a,b,c,d,x,y: integer;
  function min (num1,num2:integer):integer;
  begin
  (Calcula y devuelve el mínimo entre num1 y num2
  .....
  end;

  function max (num1,num2:integer):integer;
  begin
  (Calcula y devuelve el máximo entre num1 y num2)
  .....
  end;

  function factorial (num1:integer):integer;
  begin
  (Calcula el factorial de num1 como se implementó en el ejercicio 3)
  .....
  end;

begin
  a:= 15;   b:= 4;   c:= 25;   d:= 2;   x:=3;   y:= 4;
  res := min( min (a,b) * factorial(x), max (c,d) );
end.
                                                                               }

El Valor que queda en la variable res : es 24

{-----------------------------------------------------------------------------}



