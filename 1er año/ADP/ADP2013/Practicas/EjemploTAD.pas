TAD tipoCelular;

Interfase
  type exportado celular;
    Procedure crear(var c: celular; tit:string; mod:string; afab:integer; num:integer);
    Procedure modificarTitular(var c: celular; titNuevo:string);
    Procedure modificarModelo(var c: celular; modNuevo:string);
    Procedure modificarAñoFabricacion(var c: celular; aNuevo:integer);
    Procedure modificarNumero(var c: celular; numNuevo:integer);
    Procedure consultarTitular(c: celular; var tit:string);
    Procedure consultarModelo(c: celular; var m:string);
    Function consultarAño(c: celular):integer;
    Function consultarNumero(c: celular): integer;

Implementacion
  celular= record
    titular:string;
    modelo:string;
    año:integer;
    numero:integer;
  end;

  Procedure crear(var c:celular; tit:string; mod:string; afab:integer; num:integer);
    Begin
      c.titular:=tit;
      c.modelo:= mod;
      c.año:= afab;
      c.numero:= num;
    end;

  Procedure modificarTitular(var c:celular; titNuevo:string);
    Begin
      c.titular:= titNuevo;
    End;

  Procedure modificarModelo(var c:celular; modNuevo:string);
    Begin
      c.modelo:= modNuevo;
    End;

  Procedure modificarAño(var c:celular; añoNuevo:integer);
    Begin
      c.año:= añoNuevo;
    End;

  Procedure modificarNumero(var c:celular; numNuevo:integer);
    Begin
      c.numero:= numNuevo;
    End;

  Procedure consultarTitular(c:celular; var tit:string);
    Begin
      tit:= c.titular;
    End;

  Procedure consultarModelo(c:celular; var mod:string);
    Begin
      mod:= c.modelo;
    End;

  Function consultarAño(c:celular): integer;
    Begin
      consultarAño:= c.año;
    End;

  Function consultarNumero(c:celular): integer;
    Begin
      consultarNumero:= c.numero;
    End;

Program uno;
Uses TipoCelular;
Var 
  cel:celular;
  t,m,nommax:string;
  num,año:integer;
Begin
  read(t);
  read(m);
  read(a);
  read(num);
  max:=-1;
  While (m <> “XXX”) do begin
    crear(cel,t,m,año,num);
    if ((2013-consultarAño(cel) > max) then begin
      max:= (2013-consultarAño(cel));
      consultarTítular(cel,tit);
      end;
    read(t);
    read(m);
    read(a);
    read(num);
    end;
  write (tit);
end.


