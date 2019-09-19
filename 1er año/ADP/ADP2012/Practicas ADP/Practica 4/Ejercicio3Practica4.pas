Program ejer3prac4;
Type
  conjunto=set of char;
Var
  car:char;
  L1:char;
  L2:char;
  repetidos:integer;
  leidos:conjunto;
begin
  repetidos:=0;
  writeln('escriba un caracter para L1');
  readln(L1);
  writeln('escriba un caracter para L2');
  readln(L2);
  writeln('escriba una sucesion de caracteres');
  readln(car);
  leidos:=[ ];
  while (car<>'.') do begin
    if (car = L1) then begin
      readln(car);
      while (car<>L2) and (car<>'.') do begin
        if (car in leidos) then
          repetidos:= repetidos + 1;
        else
          leidos:= leidos + L1;
          readln(car);
      end
    end;
    else
      readln(car);
  end;
  writeln('se repiten ',repetidos, 'caracteres entre L1 y L2');
  readln;
  readln;
end.
