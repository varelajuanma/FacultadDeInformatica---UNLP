                              {EJ.7 - P6}

{7.- Se lee una secuencia de caracteres terminada en ‘.’.
Indicar si la misma cumple la siguiente forma: A % B % C donde,

A debe ser una secuencia de letras mayúsculas de la A .. G y caracteres
dígitos pares.
% es el carácter % que puede no existir.

B debe ser sólo las letras de A, en minúscula.

C debe ser una secuencia donde están una única vez,  todos los caracteres
dígitos que no aparecieron en A.

Ejemplo: DFG2A4EG % adefg % 13057896  cumple con el patrón.                    }


{-----------------------------------------------------------------------------}
program Ej7P6;
type
  letras = set of char;

         { - - INICIO FUNCION PASAR MAYUSC. A MINUSC - - }
function carminuscula (a:char):char;
var
  aux:char;
begin
  case a of
    'A': begin aux:= 'a' end;
    'B': begin aux:= 'b' end;
    'C': begin aux:= 'c' end;
    'D': begin aux:= 'd' end;
    'E': begin aux:= 'e' end;
    'F': begin aux:= 'f' end;
    'G': begin aux:= 'g' end;
  end;
carminuscula:= aux;
end;
         { - - FIN FUNCION PASAR MAYUSC. A MINUSC - - }

         { - - INICIO PROCESO SECUENCIA A - - }
{A debe ser una secuencia de letras mayúsculas de la A .. G y caracteres
dígitos pares.}
procedure Secuencia_A (var minusculas:letras; var numeros:letras; var cumple:boolean);
var
  car: char;
  resu: char;
  mayusculas: letras;
  numerospares: letras;
begin
  mayusculas:= ['A'..'G'];
  numerospares:= ['0','2','4','6','8'];
  writeln ('Ingrese caracteres - SEC. A');
  read (car);
  while ((car <> '%') and (car <> '.')) do begin
    if (car in numerospares) then
      numeros:= numeros + [car]
    else
      if (car in mayusculas) then begin
        resu:= carminuscula (car); //llamo a funcion y le paso mi caracter//
        minusculas:= minusculas + [resu];
      end
      else
        cumple:= False;
    read (car);
  end;
end;
         { - - FIN PROCESO SECUENCIA A - - }

         { - - INICIO PROCESO SECUENCIA B - - }
{B debe ser sólo las letras de A, en minúscula.}
procedure Secuencia_B (minusculas:letras; var cumple:boolean);
var
  car: char;
begin
  writeln ('Ingrese caracteres - SEC. B');
  read (car);
  while ((car <> '%') and (car <> '.')) do begin
    if (car in minusculas) then
      cumple:= True
      else
        cumple:= False;
    read (car);
  end;
end;
         { - - FIN PROCESO SECUENCIA B - - }

         { - - INICIO PROCESO SECUENCIA C - - }
{C debe ser una secuencia donde están una única vez,  todos los caracteres
dígitos que no aparecieron en A.}
procedure Secuencia_C (numeros: letras; var cumple: boolean);
var
  car: char;
  numdeC: letras;
begin
  numdeC:= [];
  writeln ('Ingrese caracteres - SEC. C');
  read (car);
  while (car <> '.') do begin
    if ((car in numeros) or (car in numdeC)) then
      cumple:= False
      else
        numdeC:= numdeC + [car];
        read (car);
  end;
end;
         { - - FIN PROCESO SECUENCIA C - - }

       {PROGRAMA}
var
  minusculas: letras;
  numeros: letras;
  cumple: boolean;
begin
  minusculas:= [];
  numeros:=[];
  cumple:= True;
  Secuencia_A (minusculas,numeros,cumple);
    if (cumple = True) then begin
      writeln ('Patron A Cumplio, seguimos con el B');
      Secuencia_B (minusculas,cumple);
        if (cumple = True) then begin
          writeln ('Patron B Cumplio, seguimos con el C');
          Secuencia_C (numeros,cumple);
            if (cumple = True) then begin
              writeln ('TODO el PATRON se CUMPLIO');
              writeln ('Presione ENTER para finalizar');
            end
            else
              writeln ('Sec. C : NO CUMPLE');
              readln ();
              readln ();
        end
        else
          writeln ('Sec. B : NO CUMPLE');
          readln ();
          readln ()
    end
    else
      writeln ('Sec. A : NO CUMPLE');
      readln ();
      readln ();
end.

