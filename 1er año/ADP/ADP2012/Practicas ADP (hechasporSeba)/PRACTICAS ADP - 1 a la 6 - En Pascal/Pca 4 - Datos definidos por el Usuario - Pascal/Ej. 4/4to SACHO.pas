program ej4;
var
  stop,i:boolean;
  num,suma,digito:integer;
Begin
  stop:=True;
  read(num);
  while stop do
    begin
      suma:=0;
      i:=False;
      while (num<>0) do
        begin
          digito:=num mod 10;
          if ((digito mod 2)=1) then
            begin
             suma:=suma+digito;
             i:=True;
            end;
          num:=num div 10;
        end;
      if ((suma mod 3)=0) and i then
        begin
          stop:=False;
          writeln('Se encontro un numero');
        end
      else
        writeln('Ingrese otro numero');
        read(num);
    end;
  readln();
  readln();
end.

