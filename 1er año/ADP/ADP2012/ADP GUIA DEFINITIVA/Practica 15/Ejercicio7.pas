program Ejercicio7;

procedure Dicotomica_Recursiva ( a:elemento; v : Vector; var inf:integer; var sup: integer):Boolean;
  var medio:Indice;
  begin
    medio:= (inf + sup) div 2;
    if (a = v[medio])then ok:=true
    else
      if (inf <= sup) then
        begin
          if (a < v [medio]) then sup:= sup - 1
          else
            inf:=inf + 1;
          Dicotomica_Recursiva (a,v,inf,sup,ok);
        end
      else  ok:=false;
  end;

