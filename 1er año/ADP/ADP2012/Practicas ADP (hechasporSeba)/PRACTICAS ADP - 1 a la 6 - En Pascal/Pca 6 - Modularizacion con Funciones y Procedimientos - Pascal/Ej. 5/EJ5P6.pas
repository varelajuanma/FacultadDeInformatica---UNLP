                              {EJ.5 - P6}

{5.- Escriba un módulo que reciba un número entero n y calcule:

    n                        n
SUMATORIA? ( i * n )!   -   TT  ( i + i*i)
  i=1                      i =1
                                                                               }

{-----------------------------------------------------------------------------}

program Ej5P6;

              { - - - - INICIO FUNCION FACTORIAL - - - - }
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
              { - - - - FIN FUNCION FACTORIAL - - - - }

              { - - - - INICIO FUNCION SUMATORIA - - - - }
function sumatoria (num:integer):real;
var
  i: integer;
  suma: real;
begin
  suma:= 0;
  for i:= 1 to num do
    suma:= suma + factorial (i*num);
  sumatoria:= suma;
end;
              { - - - - FIN FUNCION SUMATORIA - - - - }

              { - - - - INICIO FUNCION PRODUCTORIA - - - - }
function productoria (num:integer):real;
var
  i: integer;
  prod: real;
begin
  prod:= 1;
  for i:= 1 to num do
    prod:= prod * (i+(i*i));
  productoria:= prod;
end;
              { - - - - FIN FUNCION PRODUCTORIA - - - - }

var {Variables del Programa Principal}
  num: integer;
begin
  writeln ('Ingrese un numero');
  read (num);
  writeln ('RESULTADO : ', sumatoria (num) - productoria (num):10:0);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
