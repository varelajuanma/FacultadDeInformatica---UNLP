unit Funciones;

interface
  Function FormatoCuitValido(numero: String): Boolean;
  Function EntidadCuitValido(numero: String): Boolean;
  Function CuitValido(numero: String): Boolean;

implementation
  Function FormatoCuitValido(numero: String): Boolean;
    var
      i:integer;
      cantnum:integer;
      ok:boolean;
    begin
      cantnum:= 0;
      i:= 0;
      if (Length(numero) = 13) then begin
        if (numero[3] = '-') and (numero[12] = '-') then begin
          ok := true;
          Delete(numero,3,1);
          Delete(numero,12,1);
          end
        else
          ok := false;
        if (ok = true) then begin
          while (numero[i] in ['0','1','2','3','4','5','6','7','8','9']) and (i<11) do begin
            cantnum:= cantnum + 1;
            i:= i + 1;
          end;
          if (cantnum = 11) then begin
            ok := true;
            end
          else
            ok := false;
        end;
        FormatoCuitValido:= ok;
      end;
    end;

  Function EntidadCuitValido(numero: String): Boolean;
    var
      FormatoCuitValido:boolean;
      aux:string;
    begin
      if (FormatoCuitValido = true) then begin
        aux:= copy(numero, 1, 2);
        if (aux in ['20','23','24','27','30','33','34']) then begin
          EntidadCuitValido:= true;
          end
        else
          EntidadCuitValido:= false;
      end;
    end;

  Function CuitValido(numero: String): Boolean;
    var
      i,aux,multiplicador,valor1,valor2,valor3:integer;
    begin
      aux:=5432765432;
      if (FormatoCuitValido = true) then begin
        Delete(numero,3,1);
        Delete(numero,12,1);
        for i:=1 to length(numero) do
          multiplicador:= numero[i] * aux[i];
          valor1:= valor1 + multiplicador;
          multiplicador:= 0;
        valor2:= valor1 MOD 11;
        valor3:= 11 - valor2;
        if (valor3 = 11) then
          valor3:= 0;
        if (valor3 = 10) then
          valor3:= 9;
        CuitValido:= true;
        end
      else
        CuitValido:= false;
    end;

end.
