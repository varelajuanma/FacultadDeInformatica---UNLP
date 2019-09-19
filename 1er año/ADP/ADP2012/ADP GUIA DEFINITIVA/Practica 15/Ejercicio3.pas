Program Ejercicio3;

procedure agregar(l:lista; nuevo:lista);
begin
  if (l^.sig <> nil) then agregar:= agregar(l^.sig,nuevo)
  else begin
    nuevo^.sig:=nil;
    l^.sig:=nuevo;
  end;
end;

