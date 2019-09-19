program p8e8;

TYPE

sub = 0..6; {declaro subrango con las listas, más el 0 para blancos}

alumnos = record 
	num: integer;
	DNI: LongInt; {es LongInt porque integer solo abarca hasta 32000, el DNI es más alto}
	ape: string [50];
	nom: string [50];
	end;
	
votos = record {padron de votos, contiene el DNI ordenado y los votos, ver cargarPadron}
	DNI: LongInt;
	voto: boolean;
	end;
	
padron = array [1..1500] of votos; 
listas = array [1..6] of integer; {arreglo donde guardo la cantidad total de votos por lista}

procedure cargarPadron (var p: padron); {se dispone}
Begin
{asumo que se carga el DNI de los alumnos ordenado de menor a mayor y el voto en falso, si ya votó}
End;

procedure inicializarListas (var l: listas);
Var
	i: integer;
Begin
	for i:=1 to 6 do 
		l[i]:=0; {como voy a sumar, inicializo todos los campos en 0}
End;

procedure buscarPersona (var p: padron; DNI: LongInt; var ok: boolean);
Var
	i: integer;
Begin
	i:=1;
	while ((DNI < p[i].DNI) and (i<=1500)) do {mientras no encuentre la persona y no se termine el arreglo}
		i:=i+1; {me muevo en el arreglo}
	if (DNI = p[i].DNI) then {si encontré la persona}
		ok:= p[i].voto {devuelve si el alumno puede o no votar}
	else
		ok:=false; {no existe la persona}
End;


procedure votacion (var p: padron; var l: listas; var blancos: integer; var cantTotal: integer);
var
	DNI: LongInt; 
	ok: boolean;
	n: sub; {es de tipo subrango, para evitar números que no corresponden a la votación}
Begin
	writeln ('Ingrese DNI');
	readln (DNI);
	while (DNI <> 0) do begin {corte de control}
		buscarPersona (p, DNI, ok); {me devuelve si la persona es apta para votar en ok}
		if (ok) then begin
			cantTotal:= cantTotal+1; {guardo la cantidad total para el porcentaje de blancos, inicializada en PP}
			writeln ('Ingrese número de lista a votar (1 a 6), 0 si es blanco');
			readln (n); 
			if (n = 0) then 
				blancos:= blancos+1 {sumo la cantidad de blancos, inicializado en PP}
			else
				l[n]:= l[n]+1; {sumo un voto a la lista}
			end
		else {del if (ok)}
			writeln ('la persona no se encuentra en el padrón o ya voto');
		writeln ('Ingrese DNI');
		readln (DNI);	{vuelvo a preguntar por DNI, para continuar con el while}
	end;
	writeln ('DNI 0 encontrado, fin de la votación');
End;

procedure listaGanadora (var l: listas);
Var
	i: integer;
	max:integer;
	ganaLF: integer;
Begin
	max:=-1; {como mínimo es 0, así que -1 alcanza}
	for i:=1 to 6 do begin
		if (l[i]> max) then begin {si lo que tengo adentro de la lista es mayor al maximo}
			max:= l[i]; {actualizo el máximo}
			ganaLF:= i; {guardo la lista ganadora actual}
		end;
	end;
	writeln ('la lista ganadora es: ' , ganaLF);
End;

procedure porcentajeBlancos (b: integer; c: integer);
Var
	resul: real; {debe ser real porque vamos a guardar el resultado de una división}
Begin
	resul:= b*100/c; 
	writeln ('Los votos en blanco obtuvieron el ', resul, '%');
End;
	
VAR
	p: padron;	
	l: listas;
	cantTotal: integer;
	blancos: integer;
	
BEGIN
	cantTotal:=0;
	blancos:=0;
	cargarPadron(p); {se dispone, ver aclaración}	
	inicializarListas(l);
	votacion(p, l, blancos, cantTotal);
	listaGanadora (l);
	porcentajeBlancos(blancos, cantTotal);
END.

