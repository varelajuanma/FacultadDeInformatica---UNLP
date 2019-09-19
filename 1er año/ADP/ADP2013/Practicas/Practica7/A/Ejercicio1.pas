Program ejer1;
type
  vector = array [1 .. 1500] of integer;
  number = 0 .. 9;
  conjnum = set of number;
procedure inicializarvector (var v:vector);
  var
    i:integer;
  begin
    for i:= 1 to 1500 do
      v[i]:= 0;
  end;

procedure cargarvector (var v:vector);
  var
    num,i:integer;
  begin
    for i:= 1 to 1500 do begin
      write('Ingrese un numero positivo: ');
      readln(num);
      v[i]:= num;
      end;
  end;

procedure multiplode2 (var v:vector);
  var
    i,digito:integer;
  begin
    for i:= 1 to 1500 do begin
      digito:= v[i] MOD 2;
      if (digito = 0) then
        writeln('El numero ',v[i],' es multiplo de 2');
      end;
  end;

procedure digitosimpares (var v:vector);
  var
    i,digito,num:integer;
    impar:conjnum;
    cumple:boolean;
  begin
    cumple:= true;
    impar:= [1,3,5,7,9];
    for i:= 1 to 1500 do begin
      num:= v[i];
      while (num <> 0) do begin
        digito:= num MOD 10;
        if (digito IN impar) then begin
          num:= num DIV 10;
          end
        else
          cumple:= false;
          num:= 0;
        end;
      if (cumple = true) then
        writeln('El numero ',v[i],' tiene todos los digitos impares');
      end;
  end;
var
  v:vector;
  dimL:integer;
begin
  inicializarvector (v);
  cargarvector (v);
  multiplode2 (v);
  digitosimpares (v);
  writeln('Presione ENTER para finalizar');
  readln;
end.Program ejer;
begin

end.
