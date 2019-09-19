Program ejer1prac7;
type
  participante=record
    nombre:string[20];
    sexo:char; { M para masculino , F para femenino }
    DNI:integer;
    especialidad:string[20];
    edad:integer;
  end;

procedure leerregistro(var part:participante);
  begin
    with part do begin
      writeln('ingrese nombre');
      readln(nombre);
      if (nombre <> 'ZZZ') then begin
        writeln('ingrese sexo');
        readln(sexo);
        writeln('ingrese dni');
        readln(DNI);
        writeln('ingrese especialidad');
        readln(especialidad);
        writeln('ingrese edad');
        readln(edad);
      end;
    end;
  end;

procedure elmasjoven(var part:participante; var masjoven:participante);
  begin
    while (part.edad < masjoven.edad) do
      masjoven:= part;
  end;

procedure comienzacon6(var part:participante; var cant:integer);
  var
    num:integer;
    resto:integer;
  begin
    num:=part.DNI;
    while (num > 0) do begin
      resto:= num mod 10;
      num:= num div 10;
    end;
    if (resto = 6) then
      cant:= cant + 1;
  end;

procedure canto(var part:participante; var total:integer; var mujercanta:integer);
  begin
    if (part.sexo = 'F') then
      total:=total + 1;
    if (part.especialidad = 'canto') then
      mujercanta:=mujercanta + 1;
  end;

procedure informar(var masjoven:participante);
  begin
    writeln('el nombre del participante mas joven es: ',masjoven.nombre);
    writeln('el sexo del participante mas joven es: ',masjoven.sexo);
    writeln('el DNI del participante mas joven es: ',masjoven.DNI);
    writeln('la especialidad del participante mas joven es: ',masjoven.especialidad);
    writeln('la edad del participante mas joven es: ',masjoven.edad);
  end;

var
  part:participante;
  cant:integer;
  masjoven:participante;
  mujercanta:integer;
  total:integer;
begin
  cant:=0;
  writeln('ingrese los datos de un participante');
  leerregistro(part);
  while (part.nombre <> 'ZZZ') do begin
    elmasjoven(part,masjoven);
    comienzacon6(part,cant);
    canto(part,total,mujercanta);
    leerregistro(part);
  end;
 mujercanta:=(mujercanta*100) div total;
 writeln('los datos del participante mas joven son:');
 informar(masjoven);
 writeln('la cantidad de DNI que empiezan con 6 es de: ',cant);
 writeln('el porcentaje de mujeres que estan en canto es: ',mujercanta);
 readln;
 readln;
end.

