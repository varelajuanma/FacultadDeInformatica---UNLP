Program ejer4A;
procedure calcularnum (var cantpar,cantimpar: integer; num:integer);
  type
    number = 0 .. 9;
    conjnum = set of number;
  var
    digito: integer;
    pares: conjnum;
  begin
    pares:= [0,2,4,6,8];
    while (num <> 0) do begin
      digito:= num MOD 10;
      if (digito IN pares) then begin
        cantpar:= cantpar + 1;
        end
      else
        cantimpar:= cantimpar + 1;
      num:= num DIV 10;
      end;
  end;

