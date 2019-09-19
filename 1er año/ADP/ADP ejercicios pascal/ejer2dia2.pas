Program ejer2dia2;
type
  vector = array [1..10] of integer;

procedure iniciarvector (var v:vector);
  var
    i:integer;
  begin
    for i:= 1 to 10 do
      v[i]:=0;
  end;

procedure cargarvector (var v:vector; var dimL:integer);
  var
    num:integer;
  begin
    write('Ingrese un numero: ');
    readln(num);
    while (dimL < 10) do begin
      dimL:= dimL + 1;
      v[dimL]:= num;
      write('Ingrese un numero: ');
      readln(num);
      end;
  end;

procedure eliminarnumero (var v:vector; numaux:integer; var dimL:integer; var ok:boolean);
  var
    j,i:integer;
  begin
    ok:=false;
    for i:= 1 to 10 do begin
      if (v[i] = numaux) then begin
        for j:= i to (dimL - 1) do
          v[i]:= v[i + 1];
        dimL:= dimL - 1;
        ok:= true;
        end;
      end;
  end;
var
  v:vector;
  numaux,dimL,i:integer;
  ok:boolean;
begin
  dimL:=0;
  iniciarvector(v);
  cargarvector(v,dimL);
  write('Ingrese numero a eliminar: ');
  readln(numaux);
  eliminarnumero(v,numaux,dimL,ok);
  if (ok = true) then begin
    writeln('El numero fue eliminado correctamente');
    end
  else
    writeln('El numero no ha sido encontrado');
  for i:= 1 to 10 do
    writeln ('NUMERO: ',v[i]);
  write('Ingrese ENTER para finalizar');
  readln();
end.
