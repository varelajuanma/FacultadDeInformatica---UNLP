{                               EJ. 3)d)                                      }



program Ej3dP3;
var
  car: char;
  primera: char;
  ultima: char;
  palconPN: integer;

begin
  palconPN:= 0;

  writeln ('Ingrese secuencia de caracteres');
  read (car);
  while (car = ' ') do
    read (car);

  repeat
    if (car = 'P') then begin
      primera:= 'P';
      read (car);
      while (car <> ' ') and (car <> 'z') do begin
        ultima:= car;
        read (car);
      end;
      while (car = ' ') do
        read (car);
      if (primera = 'P') and (ultima = 'N') then
        palconPN:= palconPN + 1;
    end
    else
      while (car <> ' ') and (car <> 'z') do
        read (car);
      while (car = ' ') do
        read (car);
  until (car = 'z');
  writeln ('La cantidad de palabras que comienzan con "P" y terminan con "N" son : ', palconPN );
  writeln ('Presione ENTER para finalizar');
  readln ();
  readln ();
end.


