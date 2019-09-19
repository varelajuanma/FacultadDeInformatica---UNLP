                            {EJ.4 - P5}

{4.- Escriba un módulo que lea números hasta un valor negativo y calcule: 
a) Cantidad de números leídos menores que 25. 
b) Promedio de los números leídos mayores que 55. 
c) Suma de los números leídos mayores que 25 y menores que 55.                }

{-----------------------------------------------------------------------------}
program Ej4P5;

                         {---- INICIO DE PROCESO ----}
procedure procesar;
var
  num: integer;
  menores25: integer;  {a}
  prommay55: real;     {b}
  sumamay55: integer;  {b}
  cantmay55: integer;  {b}
  may25men55: integer; {c}

begin
{a} menores25:= 0;
{b} prommay55:= 0;
{b} sumamay55:= 0;
{b} cantmay55:= 0;
{c} may25men55:= 0;

  writeln ('Ingrese un numero : ');
  read (num);
  while (num >= 0) do begin
    if ((num >= 0) and (num < 25)) then
      menores25:= menores25 + 1;
    if (num > 55) then begin
      sumamay55:= sumamay55 + num;
      cantmay55:= cantmay55 + 1;
    end;
    if ((num > 25) and (num < 55)) then
      may25men55:= may25men55 + num;
    writeln ('Lea otro numero : ');
    read (num);
  end;
  prommay55:= (sumamay55/cantmay55);
  writeln ('La cantidad de numeros leidos menores que 25, es : ',menores25);
  writeln ('El promedio de los numeros leidos mayores que 55, es : ',prommay55:2:1);
  writeln ('La suma de los numeros leidos mayores que 25 y menores que 55, es : ',may25men55);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end;
                         {---- FIN DE PROCESO ----}
begin
  procesar;
end.



