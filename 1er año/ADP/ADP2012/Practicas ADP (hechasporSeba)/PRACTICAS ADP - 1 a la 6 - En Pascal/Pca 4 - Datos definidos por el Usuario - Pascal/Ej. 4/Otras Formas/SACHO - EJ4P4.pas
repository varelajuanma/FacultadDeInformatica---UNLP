program ej4;

var
  stop: boolean;
  i: boolean;
  num: integer;
  suma: integer;
  digito: integer;

begin
  stop:=True;
  read(num);
  while stop=True do begin
    suma:=0;
    i:=False;
    while (num<>0) do begin
      digito:=num mod 10;
      if ((digito mod 2)=1) then begin
        suma:=suma+digito;
        i:=True;
      end;
      num:=num div 10;
    end;
    if ((suma mod 3)=0) and i then begin
      stop:=False;
      writeln('SE ENCONTRO UN NUMERO');
    end
    else
      writeln('Ingrese otro numero');
      read(num);
  end;
  writeln ('Presione ENTER para finalizar');
  readln();
  readln();
end.

