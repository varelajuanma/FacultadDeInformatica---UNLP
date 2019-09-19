Program ejer12;
function inverso(num:integer):integer;
  var
    dig,res:integer;
  begin
    res:= 0;
    while (num <> 0) do begin
      dig:= num MOD 10;
      res:= (res*10) + dig;
      num:= num DIV 10;
      end;
    inverso:= res;
  end;
var
  num:integer;
begin
  write('Ingrese un numero entero: ');
  readln(num);
  writeln('El numero ',num,' invertido es: ',inverso(num));
  writeln('Ingrese ENTER para finalizar');
  readln();
end.
