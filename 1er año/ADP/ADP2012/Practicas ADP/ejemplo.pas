Program palabra;
Var
	cant: integer;
	car: char;
Begin
	cant:=0; {Inicializo contador}
	read(car);
	while (car = ' ') do   {Descartar blancos al principio de la secuencia}
		read (car);
	while (car <> '*') do begin
		if (car = 'J') then   {Se encuentra en el primer caracter de la palabra}
			cant:= cant + 1;  {Se cuenta aquella palabra que comienza con 'J'}
		while (car <> '*') and (car <> ' ' )do   {lee hasta que termine la palabra }
			read (car);
		while (car = ' ') do    {Descartar blancos entre palabras/final de secuencia}
			read (car);
	end;
	writeln('La cantidad de palabras que comienzan con la letra J es: ', cant);
	writeln('Presione la tecla “enter” para finalizar...');
	readln;
	readln;
end.

