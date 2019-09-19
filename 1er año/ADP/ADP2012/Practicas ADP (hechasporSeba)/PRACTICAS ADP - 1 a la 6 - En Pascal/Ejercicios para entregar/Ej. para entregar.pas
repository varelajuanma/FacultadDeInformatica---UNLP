                            {ENUNCIADO}

{Se lee una secuencia de caracteres terminada en ‘*’.

Escriba un módulo que determine la cantidad de palabras de longitud cinco
que componen esa secuencia.

Puede haber blancos al principio y al final de la secuencia.

Realice un programa que invoque al módulo e imprima el resultado.            }

{------------------------------------------------------------------------------}

program Entrega;
                             {---- INICIO PROCESO PROCESAR ----}
procedure procesar (var cantpalabras: integer);
var
  cant: integer;
  car: char;

                    {---- INICIO PROCESO BLANCOS ----}

procedure descartarblancos (var car:char);
begin
  while (car = ' ') do
    read (car);
end;
                     {---- FIN PROCESO BLANCOS ----}


begin
  writeln ('Ingrese secuencia de caracteres finalizada en `*`');
  read (car);
  descartarblancos (car);   {descarto blancos al comienzo}
  while (car <> '*') do begin  {condicion gral de fin}
    cant:= 0;
    while (car <> '*') and (car <> ' ') do begin {while que controla una palabra}
      cant:= cant + 1;
      read (car);
    end;
    if (cant = 5) then cantpalabras:= cantpalabras + 1;
    descartarblancos (car);    {descarto blancos al final de una palabra}
  end;
  writeln ('Cantidad de palabras de longitud cinco : ', cantpalabras);
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end;
                             {---- FIN PROCESO PROCESAR ----}


                             {---- INICIO PROG. PRINCIPAL ----}
var
  cantpalabras: integer;
begin
  cantpalabras:= 0;
  procesar (cantpalabras);
end.
                             {---- FIN PROG. PRINCIPAL ----}
