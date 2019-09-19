{Se lee una secuencia de 10 números enteros.
Escribí un programa que informe la cantidad de dígitos mayores, menores e iguales a 4 del total de números,
y para cada número la suma de todos sus dígitos.
Además que informe el número con mayor cantidad de dígitos.}

Program Ejer3;
Var
   num, mayor4, menor4, igual4, sumadig, cantdig, auxdig:integer;
   dig, i, numero, nummax:integer;
begin
   mayor4:= 0;
   menor4:= 0;
   igual4:= 0;
   auxdig:= 0;
   for i:=1 to 4 do begin
       sumadig:= 0;
       cantdig:= 0;
       write ('Ingrese un numero: ');
       readln (num);
       numero:= num;
       while (num <> 0) do begin
             dig:= num MOD 10;
             if (dig < 4) then
                menor4:= menor4 + 1;
             if (dig > 4) then
                mayor4:= mayor4 + 1;
             if (dig = 4) then
                igual4:= igual4 + 1;
             sumadig:= sumadig + dig;
             cantdig:= cantdig + 1;
             num:= num DIV 10;
             end;
       writeln ('La cantidad de digitos que tiene el numero es: ',cantdig);
       if (cantdig > auxdig) then
          nummax:= numero;
       writeln ('La suma de todos sus digitos del numero ',numero,' es: ',sumadig);
       end;
   writeln ('La cantidad de digitos mayores a 4 son: ',mayor4);
   writeln ('La cantidad de digitos menores a 4 son: ',menor4);
   writeln ('La cantidad de digitos iguales a 4 son: ',igual4);
   writeln ('El numero con mas digitos es el: ',nummax);
   writeln ('Presiona ENTER para finalizar');
   readln ();
end.
