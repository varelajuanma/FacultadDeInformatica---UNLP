Program ejer3;
const
  dimF = 5;
type
  nombre = string [30];
  vector = array [1 .. dimF] of nombre;
procedure cargarvector (var v:vector; dimL:integer; var pos:integer; var encontro:boolean);
  var
    persona:nombre;
  begin
    encontro:= false;
    dimL:= 1;
    while (dimL <= dimF) and (encontro = false) do begin
      write('Ingrese el nombre de la persona: ');
      readln(persona);
      v[dimL]:= persona;
      if (persona = 'Claudia Perez') and (encontro = false) then begin
        pos:= dimL;
        encontro:= true;
        end;
      dimL:= dimL + 1;
      end;
  end;

procedure informar (var pos:integer; var encontro:boolean);
  begin
    if (encontro = true) then begin
      writeln('Claudia Perez aparece en la posicion ',pos);
      end
    else
      writeln('No se encontro el nombre Claudia Perez en ninguna posicion');
  end;
var
  v:vector;
  pos:integer;
  encontro:boolean;
  dimL:integer;
begin
  cargarvector(v,dimL,pos,encontro);
  informar(pos,encontro);
  writeln('Presione ENTER para finalizar');
  readln;
end.
