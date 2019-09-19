Program ejer9prac10;
type
  cadena = string [50];
  pasajero = record
           DNI:integer;
           apellido:cadena;
           nombre:cadena;
           edad:integer;
           checkin:boolean;
           end;
  listap = ^nodo1;
  nodo1 = record
           datos:pasajero;
           sig:listap;
           end;
  fecha = record
           dia:1 .. 31;
           mes:1 .. 12;
           ano:1990 .. 2013;
           end;
  hora = record
           min:integer;
           hor:integer;
           end;
  vuelo = record
           codigo:integer;
           fechasalida:fecha;
           horasalida:hora;
           capacidad:integer;
           pasajeros:listap;
           end;
  listav = ^nodo2;
  nodo2 = record
           datos:vuelo;
           sig:listav;
           end;

procedure incisoA (lisv:listav; var lleno:integer; sumapas:integer);
  begin
    if (lisv^.datos.capacidad = sumapas) then
      lleno:= lleno + 1;
  end;

procedure incisoB (lisv:listav; var codmax:integer; cont18,max:integer);
  begin
    if (cont18 > max) then begin
      max:= cont18;
      codmax:= lisv^.datos.codigo;
      end;
  end;

var
  lisv:listav;
  lisp:listap;
  lleno,sumapas,codmax,cont18,max:integer;
begin
  lleno:= 0;
  max:= -1;
  while (lisv <> nil) do begin
    sumapas:= 0;
    cont18:= 0;
    lisp:= lisv^.datos.pasajeros;
    while (lisp <> nil) do begin
      sumapas:= sumapas + 1;
      if (lisp^.datos.edad < 18) then
        cont18:= cont18 + 1;
      lisp:= lisp^.sig;
      end;
    incisoA (lisv,lleno,sumapas);
    incisoB (lisv,codmax,cont18,max);
    end;
  writeln('Presione ENTER para finalizar');
  readln;
end.
