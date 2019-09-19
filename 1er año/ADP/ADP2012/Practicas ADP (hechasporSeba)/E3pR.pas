program E3pR;
const
  dimF = 10;
type
  nom = string[28];
  lista =array [1..dimF] of nom;
procedure Listado (var v:lista; var dimlog:integer);
  var
    n:nom;
  begin
    dimlog:= 0;
    writeln('Pon los nombres de la lista: ');
    readln(n);
    while (dimlog < dimF) do begin
      dimlog:= dimlog + 1;
      v[dimlog]:= n;
      readln(n);
    end;
    writeln();
  end;
var
  dimlog:integer;
  v:lista;
  encontre:boolean;
  i:integer;
  pos:integer;
begin
  encontre:= false;
  Listado(v, dimlog);
  for i:= 1 to dimlog do begin
    if(v[i] = 'Claudia Perez') and (encontre =false) then begin
      pos:= i;
      encontre:= true;
    end;
    writeln(v[i]);
  end;
  writeln();
  writeln('En la primera posicion que se encuentra el nombre "Claudia Perez" es en: ',pos);
  writeln();
  writeln('Presione ENTER para finalizar... ');
  readln();
  readln();
end.
