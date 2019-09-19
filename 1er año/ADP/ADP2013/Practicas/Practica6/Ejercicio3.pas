Program ejer3;
type
  cadena30 = string[30];
  participante = record
               nombre:cadena30;
               sexo:char;
               DNI:integer;
               especialidad:cadena30; {canto, baile, actuacion}
               edad:integer;
               end;

procedure leerparticipante (var par:participante);
  begin
    with par do begin
      write('Ingrese nombre del participante: ');
      readln(nombre);
      if (nombre <> 'ZZZ') then begin
        write('Ingrese sexo del participante: ');
        readln(sexo);
        write('Ingrese DNI del participante: ');
        readln(DNI);
        write('Ingrese especialidad del participante: ');
        readln(especialidad);
        write('Ingrese edad del participante: ');
        readln(edad);
        end;
      end;
  end;

procedure elmasjoven (var par,masjoven:participante);
  var
    edadmin:integer;
  begin
    edadmin:= 999;
    if (par.edad < edadmin) then
      masjoven:= par;
  end;

procedure DNIcon6seguido3 (var par:participante; var cantdni:integer);
  var
    num,digito:integer;
  begin
    num:= par.DNI;
    while (num <> 0) do begin
      digito:= num MOD 10;
      if (digito = 3) then
        digito:= num MOD 10;
        if (digito = 6) then
          cantdni:= cantdni + 1;
      num:= num DIV 10;
      end;
  end;

procedure especialidadcanto (var par:participante; var cantcanto,total:integer);
  begin
    if (par.sexo = 'F') then
      total:= total + 1;
      if (par.especialidad = 'canto') then
        cantcanto:= cantcanto + 1;
  end;

procedure informar (var masjoven:participante);
  begin
    writeln('el nombre del participante mas joven es: ',masjoven.nombre);
    writeln('el sexo del participante mas joven es: ',masjoven.sexo);
    writeln('el DNI del participante mas joven es: ',masjoven.DNI);
    writeln('la especialidad del participante mas joven es: ',masjoven.especialidad);
    writeln('la edad del participante mas joven es: ',masjoven.edad);
  end;

var
  par,masjoven:participante;
  cantdni,cantcanto,total:integer;
begin
  cantdni:= 0;
  cantcanto:= 0;
  total:= 0;
  leerparticipante (par);
  while (par.nombre <> 'ZZZ') do begin
    elmasjoven(par,masjoven);
    DNIcon6seguido3(par,cantdni);
    especialidadcanto(par,cantcanto,total);
    leerparticipante(par);
    end;
  informar(masjoven);
  writeln('La cantidad de personas con DNI con numero 6 seguido de 3 es: ',cantdni);
  writeln('El porcentaje de mujeres cuya especialidad es canto es: ',(cantcanto * 100) DIV total);
  writeln('Presione ENTER para finalizar');
  readln;
end.
