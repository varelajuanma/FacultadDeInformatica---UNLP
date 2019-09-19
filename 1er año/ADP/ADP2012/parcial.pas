program ejer5;
type

  j = record
   nombre:string;
   numero:string;
   cantGoles:integer;
  end;

  ju = array[1..11] of j;

  e = record
   nombre:string;
   puntosAcumulados:integer;
   puntosFairPlay:integer;
   cantGolesFavor:integer;
   cantGolesContra:integer;
   jugadores:ju;
  end;

  eq = array[1..50] of e;

procedure leer_datos(var datos:eq);
 var
  indice:integer;
  indice2:integer;
 begin
  indice:=1;
  while(indice < 50) do begin

   writeln('Ingrese nombre equipo');
   readln(datos[indice].nombre);
   writeln('Ingrese puntos acumulados');
   readln(datos[indice].puntosAcumulados);
   writeln('Ingrese puntos por fait play');
   readln(datos[indice].puntosFairPlay);
   writeln('Ingrese cantidad goles a favor');
   readln(datos[indice].cantGolesFavor);
   writeln('Ingrese cantidad goles en contra');
   readln(datos[indice].cantGolesContra);

  indice2:=1;
  while(indice2 < 11) do begin
   writeln('ingrese nombre del jugador');
   readln(datos[indice].jugadores[indice2].nombre);
   writeln('ingrese numero del jugador');
   readln(datos[indice].jugadores[indice2].numero);
   writeln('ingrese cantidad de goles del jugador');
   readln(datos[indice].jugadores[indice2].cantGoles);

   indice2:=indice2+1;
  end;
  indice:=indice+1;
 end;
end;

var
 info:eq;
begin
 leer_datos(info);
end.
