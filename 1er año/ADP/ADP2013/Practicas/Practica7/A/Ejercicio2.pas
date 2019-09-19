Program ejer2;
const
  dimF = 1500;
type
  vector = array [1 .. dimF] of integer;
  number = 0 .. 9;
  conjnum = set of number;
procedure inicializarvector (var v:vector);
  var
    i:integer;
  begin
    for i:= 1 to dimF do
      v[i]:= 0;
  end;

procedure cargarvector (var v:vector; var dimL:integer);
  var
    num:integer;
  begin
    dimL:= 1;
    write('Ingrese un numero positivo: ');
    readln(num);
    while (dimL <= dimF) and (num <> 999) do begin
      v[dimL]:= num;
      write('Ingrese un numero positivo: ');
      readln(num);
      dimL:= dimL + 1;
      end;
  end;

procedure multiplode2 (var v:vector; var dimL:integer);
  var
    i,digito:integer;
  begin
    for i:= 1 to dimL do begin
      digito:= v[i] MOD 2;
      if (digito = 0) then
        writeln('El numero ',v[i],' es multiplo de 2');
      end;
  end;

procedure digitosimpares (var v:vector; var dimL:integer);
  var
    i,digito,num:integer;
    impar:conjnum;
    cumple:boolean;
  begin
    cumple:= true;
    impar:= [1,3,5,7,9];
    for i:= 1 to dimL do begin
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
  cargarvector (v,dimL);
  multiplode2 (v,dimL);
  digitosimpares (v,dimL);
  writeln('Presione ENTER para finalizar');
  readln;
end.
