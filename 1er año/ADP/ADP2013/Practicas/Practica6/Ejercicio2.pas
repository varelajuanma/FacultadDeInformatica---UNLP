Program ejer2;
Type
  cadena30 = string [30];
  plato = record
        nombre:cadena30;
        tipo:cadena30; {frio o caliente}
        ingreprinc:cadena30;
        end;
  representante = record
        apellido:cadena30;
        nombre:cadena30;
        platoapres:plato;
        sexo:char; {"M" si es masculino y "F" si es femenino}
        edad:integer;
        end;

Procedure leerrepresentante (var rep:representante);
  begin
    with rep do begin
      write('Ingrese el apellido del representante: ');
      readln(apellido);
      write('Ingrese el nombre del representante: ');
      readln(nombre);
      write('Ingrese el nombre del plato a presentar: ');
      readln(platoapres.nombre);
      write('Ingrese el tipo del plato a presentar: ');
      readln(platoapres.tipo);
      write('Ingrese el ingrediente principal del plato a presentar: ');
      readln(platoapres.ingreprinc);
      write('Ingrese el sexo del representante: ');
      readln(sexo);
      write('Ingrese la edad del representante: ');
      readln(edad);
      end;
  end;

var
  rep:representante;
  paismax,cantedad,cantpar,cantcal,cantfrio,pais,p,r:integer;
begin
  cantpar:= 0;
  cantedad:= 0;
  paismax:= -1;
  for p:= 1 to 20 do begin
    cantfrio:= 0;
    cantcal:= 0;
    for r:= 1 to 7 do begin
      leerrepresentante(rep);
      if (rep.sexo = 'F') then
        if (rep.platoapres.tipo = 'frio') then
          cantfrio:= cantfrio + 1;
      if (rep.platoapres.tipo = 'caliente') then
        cantcal:= cantcal + 1;
      cantpar:= cantpar + 1;
      cantedad:= cantedad + rep.edad;
      end;
    if (cantfrio > paismax) then begin
      paismax:= cantfrio;
      pais:= p;
      end;
    writeln('El porcentaje de platos calientes es: ',(cantcal * 100) DIV 2);
    end;
  writeln('El pais ',pais,' es el mayor con participantes femeninos con platos frios');
  writeln('La edad promedio de los participantes es: ',cantedad DIV cantpar);
  writeln('Presione ENTER para finalizar');
  readln;
end.
