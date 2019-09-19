program ej6;
type
  rhora = record
    hora : integer;
    min : integer;
    seg : integer;
  end;
  auto = record
    patente : string;
    hpaso : rhora;
    cant : integer;
  end;

Procedure leer(var a: auto);
begin
  writeln('Patente: ');
  readln(a.patente);
  if(a.patente <> 'ZZZ000')then begin
    writeln('Hora: ');
    readln(a.hpaso.hora);
    writeln('Minutos: ');
    readln(a.hpaso.min);
    writeln('Segundos: ');
    readln(a.hpaso.seg);
    writeln('Cantidad de pasajeros: ');
    readln(a.cant);
  end;
end;

Function promedio(cantPers, cantPaso: integer): real;
begin
  promedio := cantPers / cantPaso;
end;

Procedure monto(var suma: real; a: auto);
begin
   suma:= suma+ ((a.cant-1)*2.50)+5;
end;

Procedure primero(a:auto; var min:integer; var minPat: string);
var
  seg: integer;
begin
  seg:=(a.hpaso.hora*3600)+(a.hpaso.min*60)+a.hpaso.seg;
  if(seg < min) then begin
    min:=seg;
    minPat:=a.patente;
  end;
end;

var
  a: auto;
  min,cantPers,cantPaso: integer;
  pact, minPat: string;
  suma: real;
begin
  min:=MAXINT; suma:=0;
  leer(a);
  while(a.patente <> 'ZZZ000') do begin
    pact:= a.patente;
    cantPaso:=0;
    cantPers:=0;
    while(pact = a.patente) do begin
      cantPaso := cantPaso +1;
      cantPers := cantPers + a.cant;
      monto(suma,a);
      primero(a,min,minPat);
      leer(a);
    end;
    writeln('La patente ',pact,' paso ',cantPaso,' veces.');
    writeln('Promedio de ',pact,' de pasajeros es',promedio(cantPers,cantPaso):6:2);
  end;
  writeln('Monto total: ',suma:6:2);
  writeln('Patente que paso primero: ',minPat);
  readln;readln;
end.
