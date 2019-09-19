                              {EJ.4 - P6}

{4.- Utilizando la función factorial (la cual debe desarrollar),
escriba una función que calcule el número combinatorio (m,n):

                                             m!                      
                           (m,n) =  ____________________
                                        (m-n)! * n!
                                                                               }

{-----------------------------------------------------------------------------}

program Ej4P6;

function factorial (num:integer):real;
var
  i: integer;
  resu: real;
begin
  resu:= 1;
  for i:= 1 to num do
    resu:= resu * i;
  factorial:= resu;
end;


function combinatoria (num1_m:integer; num2_n:integer):real;

begin
  combinatoria:= (factorial (num1_m)) / ( factorial (num1_m - num2_n) * factorial (num2_n) );
end;


var
  num1_m: integer;
  num2_n: integer;

begin
  writeln ('Ingrese numero m : ');
  read (num1_m);
  writeln ('Ingrese numero n : ');
  read (num2_n);
  writeln ('RESULTADO ES : ' ,combinatoria (num1_m,num2_n):2:2);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
