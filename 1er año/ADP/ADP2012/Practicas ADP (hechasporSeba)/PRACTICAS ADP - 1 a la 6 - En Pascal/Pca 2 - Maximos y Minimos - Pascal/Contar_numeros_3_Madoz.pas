program Ej2Teoria;
var
  num: integer;
  cant3: integer;
  resto: integer;

begin

  write ('Ingrese por favor un numero : ');
  read (num);
  while (num <> -1) do begin
    cant3:= 0;
    resto:= 0;
    while (num <> 0) do begin
      resto:= num mod 10;
      num:= num div 10;
      if (resto=3) then
        cant3:= cant3 +1;
    end;
    writeln (' ' ,cant3, '  digito/s del numero ingresado contiene/n el numero 3');
    write ('Ingrese por favor nuevamente un numero : ');
    readln (num);
  end;
end.
