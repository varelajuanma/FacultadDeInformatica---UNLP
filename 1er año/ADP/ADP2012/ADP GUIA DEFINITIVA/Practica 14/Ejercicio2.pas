program Ejercicio2;
TYPE
	cadena   = string[30];
	alumnos  = ^nodo;
	alumno   = record
	      numero  : integer;
	      dni     : integer;
	      apellido: cadena;
	      nombre  : cadena;
	end;
    nodo = record
   	  dato: alumno;
      sig_num: alumnos;
      sig_ape: alumnos;
      sig_dni: alumnos;
    end;
    lista_doble = record
      pri_ape: alumnos;
      pri_num: alumnos;
      pri_dni: alumnos;
    end;
{Proceso que lee la información de un alumno}

procedure leer_alumno (var a: alumno);
begin
  writeln;
  writeln('---- NUEVO ALUMNO ----');
  writeln;
  write('DNI: ');
  readln(a.dni);
  if (a.dni <> 0) then begin
     write('Numero: ');
     readln(a.numero);
     write('Apellido: ');
     readln(a.apellido);
     write('Nombre: ');
     readln(a.nombre);
  end;
end;
{Proceso que inserta un alumno a la lista respetando el orden por apellido}

procedure agregar_x_apellido (var l: lista_doble; nue: alumnos);
var
  ant, act: alumnos;
begin
  act:= l.pri_ape;
  while (act <> nil) and (nue^.dato.apellido>act^.dato.apellido) do begin
    ant:= act;
    act:= act^.sig_ape;
  end;
  if (act = l.pri_ape) then begin {agrega primero}
    nue^.sig_ape:= l.pri_ape;
    l.pri_ape := nue;
  end
  else begin                      {es en el medio o al final}
    ant^.sig_ape := nue;
    nue^.sig_ape := act;
  end;	 
end;

{Proceso que inserta un alumno a la lista respetando el orden por número de alumno}

procedure agregar_x_numero (var l: lista_doble; nue: alumnos);
var
  ant, act: alumnos;
begin
  act:= l.pri_num;
  while (act <> nil) and (nue^.dato.numero > act^.dato.numero) do begin
    ant:= act;
    act:= act^.sig_num;
  end;
  if (act = l.pri_num) then begin {agrega primero}
    nue^.sig_num:= l.pri_num;
    l.pri_num := nue;
  end
  else begin                      {es en el medio o al final}
    ant^.sig_num := nue;
    nue^.sig_num := act;
  end;	 
end;
{Proceso que inserta un alumno a la lista respetando el orden por dni}
procedure agregar_x_dni (var l: lista_doble; nue: alumnos);
var
  ant, act: alumnos;
begin
  act:= l.pri_dni;
  while (act <> nil) and (nue^.dato.dni > act^.dato.dni) do begin
    ant:= act;
    act:= act^.sig_dni;
  end;
  if (act = l.pri_dni) then begin {agrega primero}
    nue^.sig_dni:= l.pri_dni;
    l.pri_dni := nue;
  end
  else begin                      {es en el medio o al final}
    ant^.sig_dni := nue;
    nue^.sig_dni := act;
  end;	 
end;

{Proceso que agrega un alumno a la lista por ambos órdenes}

procedure agregar (var l: lista_doble; a:alumno);

var
  nue: alumnos;
begin
 {Se crea el nodo una vez}
  new(nue);
  nue^.dato    := a;
  nue^.sig_ape := nil;
  nue^.sig_num := nil;
  nue^.sig_dni := nil;
  {Agrego por los dos órdenes}
  agregar_x_apellido(l, nue);
  agregar_x_numero  (l, nue);
  agregar_x_dni  (l, nue);
end;


{Proceso que va leyendo la información de los alumnos y los agrega a la lista}
procedure crearlista (var l: lista_doble);
var
  alu: alumno;
Begin
  {Inicializo la lista}
  l.pri_num:= nil; 
  l.pri_ape:= nil;
  l.pri_dni:= nil;
  leer_alumno(alu);
  while (alu.dni <> 0) do begin
      agregar(l, alu);
      leer_alumno(alu);
  end;
end;

{VARIABLES DEL PROGRAMA PRINCIPAL}
var 	
  l : lista_doble;

Begin   {PROGRAMA PRINCIPAL}
  crearlista(l);
  {while (l.pri_dni <> nil) do begin
    writeln('---------------------------------');
    writeln(l.pri_dni^.dato.numero);
    writeln(l.pri_dni^.dato.dni);
    writeln(l.pri_dni^.dato.apellido);
    writeln(l.pri_dni^.dato.nombre);
    l.pri_dni:= l.pri_dni^.sig_dni;
  end;
  readln();
  readln();} // -> para probar si anda.
end.
