                              {EJ.6 - P5}

{6.- Se lee una secuencia de caracteres terminada en ‘$’. Determinar si la
secuencia cumple con el patrón A@B@C, donde:
@ es el carácter ‘@’ que seguro existe. 

A debe ser una secuencia de al menos cinco palabras, y cada una debe tener
una longitud de cuatro caracteres como mínimo.

B debe ser una secuencia de blancos cuya longitud es el promedio de las
longitudes de las palabras de la secuencia A.

C debe ser una secuencia de al menos tres palabras que no contengan la letra
‘e’, separadas por exactamente dos blancos                                   }

{-----------------------------------------------------------------------------}

program Ej6P5;
                { - - - MODULO A - - - }
procedure secuenciaA (var promedio:real; var OK: boolean);
var
  cant: integer;
  cantpalabras: integer;
  longitudes: integer;
  car: char;
begin
  OK:= True;
  longitudes:= 0;
  cantpalabras:= 0;
  writeln ('SEC A, ingrese secuencia de caracteres');
  read (car);
  while (car = ' ') do                                    // blancos //
    read (car);
  while (car <> '@') do begin
    cant:= 0;
    while ((car <> '@') and (car <> ' ')) do begin
      cant:= cant + 1;
      read (car)
    end;
    if (cant >= 4) then begin
      cantpalabras:= cantpalabras + 1;
      longitudes:= (longitudes + cant);
    end;
    while (car = ' ') do                                  // blancos //
      read (car);
  end; // del while <> @ //
  if (cantpalabras < 5) then OK:= False;
  promedio:= (longitudes/cantpalabras);
  writeln ('Longitudes : ', longitudes);
  writeln ('Palabras : ', cantpalabras);
  writeln ('Promedio : ', promedio:2:2);
end;
                { - - - FIN MODULO A - - - }

                { - - - MODULO B - - - }
procedure secuenciaB (promedio: real; var OK: boolean);
var
  cantblancos: integer;
  car: char;
begin
  cantblancos:= 0;
  writeln ('SEC B, ingrese secuencia de caracteres');
  read (car);
  while ((car <> '@') and (OK)) do begin
    if (car = ' ') then
      cantblancos:= cantblancos + 1
    else
      OK:= False;
    read (car);
  end;
  if (cantblancos = promedio) then
    OK:=True
  else
    OK:=False;
end;
                { - - - FIN MODULO B - - - }

                { - - - MODULO C - - - }
procedure secuenciaC (var palabrasdeC: integer);
var
  car: char;
  tieneE: boolean;
  cantblancos: integer;
begin
  writeln ('SEC C, ingrese secuencia de caracteres');
  read (car);
  while (car <> '$') do begin
    cantblancos:= 0;
    tieneE:= False;

    while (car = ' ') do
      read (car);

    while ((car <> '$') and (car <> ' ') and (tieneE = False)) do begin
      if (car = 'e') then begin
        tieneE:= True;
        read (car);
      end
      else
        read (car);
    end;

    while (car = ' ') do begin
      cantblancos:= cantblancos + 1;
      read (car);
    end;
    if ((tieneE = False) and (cantblancos = 2)) then
      palabrasdeC:= palabrasdeC + 1;
  end; // del while <> $ //
end;
                { - - - FIN MODULO C - - - }


                { - - - INICIO PROG. PPAL - - - }

var     //variables globales del P.P. //
  promedio: real;
  OK: boolean;
  palabrasdeC: integer;

begin
  promedio:= 0;
  palabrasdeC:= 0;

  //llamo a MODULO A //
  secuenciaA (promedio,OK);
  if (OK = True) then begin
    writeln ('Patron A, Cumplio..!!');
    readln ();
    //SI el A = True; llamo al MODULO B //
    secuenciaB (promedio,OK);
      if (OK = True) then begin
        writeln ('Patron B, Cumplio..!!');
        //SI el B = True; llamo al MODULO C //
        secuenciaC (palabrasdeC);
          if (palabrasdeC >= 3) then begin
            writeln ('Patron C, Cumplio..!!');
            writeln ('EJERCICIO.. BIEN HECHO, PATRONES FUNCIONARON ');
            writeln ('Presione ENTER para finalizar');
          end
          else
            writeln ('Patron C = NO CUMPLE');
            readln ();
      end
      else
        writeln ('Patron B = NO CUMPLE');
        readln ();
  end
  else
    writeln ('Patron A = NO CUMPLE');
    readln ();
end. // end del programa principal //


                { - - - FIN PROG. PPAL - - - }
