program p3e6d;

var
  car: char;
  ancar: char;
  anancar: char;
  cont: integer;
  contcoin: integer;
  contmica: integer;

begin
  contcoin:= 0;
  contmica:= 0;
  car:= ' ';
  ancar:= ' ';
  anancar:= ' ';

  while(car<>'#')do
    cont:=2;

  while(car=' ')do
    read(car);
    ancar:=car;
    read(car);
    if ((ancar = 'm') and (car = 'i'))then begin
      while(car<>' ')and(car<>'#')do begin
        anancar:=ancar;
        ancar:=car;
        read(car);
        cont:=cont+1
      end;
    if(anancar='c')and(ancar='a')then
      contmica:=contmica+1;
    if(cont=6)then
      contcoin:=contcoin+1;
    end
    else
    while(car<>' ')and(car<>'#')do begin
     cont:=cont+1;
     read(car);
    end;
if(cont=6)then contcoin:=contcoin+1;
end;
end;
writeln('la cantidad de palabras con 6 caracteres de longitud son: ',contcoin);
writeln('la cantidad de palabras que comienzan con MI y terminan con CA son: ',contmica);
end.
