                              {EJ.7 - P5}

{7.- Se lee una secuencia de caracteres terminada en ‘*’.
Informar si la secuencia cumple con el patrón: V&Q%W. En caso de no ser así
terminar de procesar e informar en qué subsecuencia se dejó de cumplir el patrón
, donde:

& es el carácter ‘&’ y % es el carácter ‘%’ que seguro existen.

V es una secuencia de palabras, donde todas las palabras comienzan con la
letra ‘o’ seguida de la letra ‘p’.

Q es una secuencia de caracteres donde la palabra más larga tiene sólo
letras que aparecieron en V.

W es una secuencia de caracteres donde todas las palabras de longitud 5,
tienen tres vocales.                                                           }

{-----------------------------------------------------------------------------}

program Ej7P5;
type
  conjletras = set of char;

var
  letrasleidasV: conjletras;
  vocales: conjletras;
  OK: boolean;


                   {- - - - INICIO PROCESO BLANCOS - - - - }
procedure descartarblancos (var car:char);
begin
  while (car = ' ') do
    read (car);
end;
                   {- - - - FIN PROCESO BLANCOS - - - - }

                                                                                //V es una secuencia de palabras, donde todas las
                   {- - - - INICIO PROCESO SEC. V - - - - }                     //palabras comienzan con la letra ‘o’ seguida de la letra ‘p’.
procedure secuenciaV (var OK:boolean; var letrasleidasV:conjletras);
var
  ant: char;
  car: char;
begin
  writeln ('Caracteres de Secuencia V, terminada en &');
  read (car);
  while (car <> '&') and (OK = True) do begin
    ant:= car;
    letrasleidasV:= letrasleidasV + [car];
    read (car);
    if ((ant = 'o') and (car = 'p')) then begin
      while (car <> '&') and (car <> ' ') do begin
        read (car);
        letrasleidasV:= letrasleidasV + [car];
      end;
      descartarblancos (car);
    end
    else
      OK:= False;
  end;
end;
                   {- - - - FIN PROCESO SEC. V - - - - }


                   {- - - - INICIO PROCESO SEC. Q - - - - }                      //Q es una secuencia de caracteres donde la palabra más
                                                                                 //larga tiene sólo letras que aparecieron en V.
procedure secuenciaQ (var OK:boolean; letrasleidasV:conjletras);
var
  long: integer;
  palabramaslarga: integer;
  cumple: boolean;
  okpalabra: boolean;
  car: char;
begin
  palabramaslarga:= -1;
  writeln ('Caracteres de Secuencia Q, terminada en %');
  read (car);
  while (car <> '%') do begin
    long:= 0;
    cumple:= True;
    while ((car <> '%') and (car <> ' ')) do begin
      if not (car in letrasleidasV) then
        cumple:= False;
      long:= long + 1;
      read (car);
    end;
    if (long > palabramaslarga) then begin
      palabramaslarga:= long;
      okpalabra:= cumple;
    end;
    descartarblancos (car);
  end;
  OK:= okpalabra;
end;

                       {- - - - FIN PROCESO SEC. Q - - - - }
                                                                                 // W es una secuencia de caracteres donde todas
                                                                                 // las palabras de longitud 5, tienen tres vocales.
                   {- - - - INICIO PROCESO SEC. W - - - - }
procedure secuenciaW (var OK:boolean; vocales:conjletras);
var
  long: integer;
  cantvocales: integer;
  car: char;

begin
  writeln ('Caracteres de Secuencia W, terminada en *');
  read (car);
  while ((car <> '*') and (OK = True)) do begin
    long:= 0;
    cantvocales:= 0;
    while ((car <> '*') and (car <> ' ')) do begin
      long:= long + 1;
      if (car in vocales) then
        cantvocales:= cantvocales + 1;
      read (car);
    end;
    writeln ('LONG = ', long);             //para debuguear
    writeln ('VOC. = ', cantvocales);      //para debuguear
    readln ();                             //para debuguear
    descartarblancos (car);
    if (long = 5) and (cantvocales <> 3) then
      OK:= False;
  end;
end;

                   {- - - - FIN PROCESO SEC. W - - - - }



begin
  letrasleidasV:= [];
  vocales:= ['a','e','i','o','u','A','E','I','O','U'];
  OK:= True;
  secuenciaV (OK,letrasleidasV);
    if (OK = True) then begin
      secuenciaQ (OK,letrasleidasV);
        if (OK = True) then begin
          secuenciaW (OK,vocales);
            if (OK = True) then begin
              writeln ('PATRON SE CUMPLIO CORRECTAMENTE');
              writeln ('Presione ENTER para finalizar');
            end
            else
              writeln ('Secuencia W no se cumplio');
        end
        else
          writeln ('Secuencia Q no se cumplio');
    end
    else
      writeln ('Secuencia V no se cumplio');
      readln ();
      readln ();
end.





