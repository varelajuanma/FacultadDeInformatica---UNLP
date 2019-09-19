                              {EJ.3 - P6}

{3. - Escriba un módulo que reciba como parámetro un número entero A y
devuelva verdadero si el número es impar y falso en caso contrario.           }

{-----------------------------------------------------------------------------}

program Ej3P6;

{function ESPAR (num:integer): boolean;
begin
  if ((num mod 2) = 0) then
    ESPAR:= True                                SE PUEDE USAR ASI... !!
  else
    ESPAR:= False;
end;}

                { - - - - INICIO FUNCION ES PAR - - - - }

function ESPAR (num:integer): boolean;
begin                                        {O TAMBIEN ASI..}
  ESPAR:= ((num mod 2) = 0);
end;
                { - - - - FIN FUNCION ES PAR - - - - }



                     { - - PROG. PRINCIPAL - - }
var
  numero: integer;
begin
  writeln ('Ingrese un numero : ');
  read (numero);
  writeln ('El numero, ' ,numero, ' ? es par ? ', ESPAR (numero));
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.
