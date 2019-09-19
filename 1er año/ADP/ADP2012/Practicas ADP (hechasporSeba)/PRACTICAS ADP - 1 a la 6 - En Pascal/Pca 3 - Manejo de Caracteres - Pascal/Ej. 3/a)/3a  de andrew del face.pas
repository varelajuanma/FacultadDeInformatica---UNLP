{                    EJERCICIO 3)a) - Flaco del face                          }



program p3e3a;
var
  contp: integer;
  car: char;
  ancar: char;
begin 
  contp:=0;
  car:= ' ';
  ancar:= ' ';
  while(car <> 'z')do begin
    while(car=' ') do begin
      ancar:=car;
      read(car);
    end;
    if(ancar =' ')then
      contp:=contp+1;
    while(car<>' ')and(car<>'z') do
      read(car);
  end;
writeln ('La cantidad de palabras son: ',contp);
writeln ('Presione ENTER para finalizar');
readln ();
readln ();
end.
