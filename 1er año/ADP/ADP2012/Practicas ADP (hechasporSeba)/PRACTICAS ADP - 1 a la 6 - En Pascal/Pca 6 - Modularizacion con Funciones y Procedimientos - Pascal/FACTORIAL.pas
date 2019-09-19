                         {CALCULA FACTORIAL}

{-----------------------------------------------------------------------------}

program calculo_factorial;

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

var
  numero: integer;
begin
   writeln ('Ingrese un numero : ');
   readln (numero);
   writeln ('El factorial de ', numero, ' es : ' , factorial (numero):2:0);
   writeln ('Presione ENTER para finalizar');
   readln ();
end.


