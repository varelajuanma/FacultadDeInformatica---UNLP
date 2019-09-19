program Ej2Madoz;
procedure esquina (var tiempo:integer; var flores,papeles:integer);
var
  HayFlorEnLaEsquina: boolean;
  flor: integer;
  papel: integer;
begin
  HayFlorEnLaEsquina:= true;
  flor:= 0;
  papel:= 0;
  while (HayFlorEnLaEsquina) do begin
    tomarFlor;
    flor:= flor+1;
    tiempo:= tiempo + flor*15;
  end;
  flores:= flores+flor;
  while (HayPapelEnLaEsquina) do begin
    tomarPapel;
    papel:= papel+1;
    tiempo:= tiempo+papel*10;
  end;
  papeles:= papeles+papel;
var
  tiempo: integer;
  totalf: integer;
  totalp: integer;
begin
  tiempo:= 0;
  totalf:= 0;
  papelp:= 0;
  while (tiempo < 3600) Do begin
    esquina (tiempo,totalf,totalp);
    mover;
    tiempo:= tiempo+30;
  end;
  write(tiempo);
  write(totalp);
  write(totalf);
end;


