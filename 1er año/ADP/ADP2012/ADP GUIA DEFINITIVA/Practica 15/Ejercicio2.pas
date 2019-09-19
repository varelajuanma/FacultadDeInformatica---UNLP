program Ejercicio2;

function cant(l:lista):integer;
begin
  if (l <> nil) then cant:= cant(l^.sig) + 1
  else cant:=0;
end;




