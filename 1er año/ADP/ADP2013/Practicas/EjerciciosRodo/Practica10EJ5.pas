program p10ej5;
type
    cadena=string[20];
    registro=record
                   marca:cadena;
                   modelo:cadena;
                   valor:real;
             end;
    lista=^reg;
    reg=record
              avion:registro;
              sig:lista;
        end;
procedure eliminar (var l:lista; var ok:boolean; dato:registro);
var
   ant:lista;
   act:lista;
begin
     ant:=l;
     act:=l;
     while ((act <> Nil) and (act^.avion.marca <= dato.marca) and (ok=false)) do
     begin
          if ((act^.avion.modelo = dato.modelo) and (act^.avion.valor = dato.valor)) then
          begin
               ok:=true;
               end
               else
               begin
                    ant:=act;
                    act:=act^.sig;
               end;
     end;
     if ((act <> Nil) and (ok=true)) then
     begin
          if (act=l) then
          begin
               l:=act^.sig;
               end
               else
               ant^.sig:=act^.sig;
          dispose(act)
     end;
end;
var
   l:lista;
   dato:registro;
   ok:boolean;
begin
     ok:=false;
     eliminar(l,ok,dato);
     if (ok=true) then
     begin
          writeln('el dato se elimino con exito');
          end
          else
          writeln('el dato no existia');
     writeln('ingrese ENTER para finalizar');
     readln;
end.
