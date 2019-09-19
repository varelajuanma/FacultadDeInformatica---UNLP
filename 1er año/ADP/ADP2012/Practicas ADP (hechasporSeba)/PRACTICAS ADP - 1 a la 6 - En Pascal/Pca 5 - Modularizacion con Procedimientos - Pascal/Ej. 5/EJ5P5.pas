                              {EJ.5 - P5}

{5.- Se lee una secuencia de números enteros terminada en 999. Determinar si
la secuencia cumple con el patrón

"A" 555 "B", donde: 555 seguro existe.

"A" debe ser una secuencia de al menos 6 números y debe cumplir que la suma de
los dígitos de cada numero es a lo sumo 20.

"B" debe ser una secuencia de X números pares, donde X es la cantidad de
números que aparecieron en "A"                                                }

{-----------------------------------------------------------------------------}

program Ej5P5;

procedure secuenciaA (var cant: integer; var cumple: boolean);
var
  num: integer;
  suma: integer;
begin
  cumple:= True;
  cant:= 0;
  writeln ('Ingrese 1er. numero de Patron A : ');
  read (num);

  while ((num <> 555) and (cumple=True)) do begin
    suma := 0;
    while (num > 0) do begin
      suma:= suma + (num mod 10);
      num:= num div 10;
    end;
    if (suma > 20) then begin
      cumple := False;
      writeln ('Se encontro numero Mayor a 20 = PATRON A: NO CUMPLE');
      readln ();
    end
    else
      cant:= cant + 1;
      writeln ('Ingrese otro numero : ');
      read (num);
    end;

    writeln ('DEBUG para ver cuanto va CONTADOR = ', cant);

    if (cant < 6) and (num = 555) then begin
      cumple:= False;
      writeln ('NO CUMPLE A');
      readln ();
      readln ();
    end;
  end;

procedure secuenciaB (cant: integer; var cumple: boolean; var NUMERO: integer);
var
  cnum: integer;
begin
  cnum:= 0;
  writeln ('Ingrese 1er. numero de Patron B : ');
  read (NUMERO);
  while ((NUMERO <> 999) and (cumple)) do begin
    if ((NUMERO mod 2)=0) then
      cnum:= cnum + 1;
    writeln ('Ingrese otro numero');
    read (NUMERO);
  end;
  writeln ('CUANTO VA CNUM : ', cnum);
  readln ();
  readln ();
  if (cnum <> cant) then begin
    cumple:= False;
    writeln ('PATRON B NO SE CUMPLE,');
  end
  else
    writeln ('PATRON B se Cumplio');
    readln ();
    readln ();
end;


                        {INICIO de PROG. PPAL}
var
cant: integer;
cumple: boolean;
NUMERO: integer;
begin
  secuenciaA (cant,cumple);
  if (cumple = True) then begin
    secuenciaB (cant,cumple,NUMERO);
    if (NUMERO = 999) and (cumple = True) then begin
      writeln ('!!!!!!! Patron Cumplio CORRECTAMENTE !!!!!!!');
      writeln ('Presione ENTER para finalizar');
    end
    else
      writeln ('No se cumple el Patron B');
      readln ();
  end
  else
    writeln ('No se cumple el Patron A');
    readln ();
end.




