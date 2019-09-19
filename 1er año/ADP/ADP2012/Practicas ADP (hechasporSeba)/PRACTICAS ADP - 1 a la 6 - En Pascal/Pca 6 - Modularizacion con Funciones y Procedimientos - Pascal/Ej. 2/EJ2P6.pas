                              {EJ.2 - P6}

{2.- Escriba un módulo que reciba 2 números enteros i y n, y calcule la
potencia n-ésima de i                                                          }

{-----------------------------------------------------------------------------}

program Ej2P6;
var
  i_bas: integer;
  n_exp: integer;


function potencia (i_base:integer; n_exponente:integer): integer; // i elevado a la n //
var
  i: integer;     {contador}
  pot: integer;   {variable potencia}
begin
  pot:= 1;    {iniciado en 1, xq el 1 es el elem. neutral para la *}
  if (n_exponente > 0) then begin
    for i:= 1 to n_exponente do
      pot:= pot * i_base;
  end;
  potencia:= pot;
end;

begin
  writeln ('Ingrese numero = BASE');
  readln (i_bas);
  writeln ('Ingrese numero = EXPONENTE');
  readln (n_exp);
  writeln (i_bas, ' elevado al ', n_exp, ' es : ', potencia (i_bas,n_exp));
  writeln ('Presione ENTER para finalizar');
  readln ();
end.
