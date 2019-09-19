TAD tipoCelular;

Interfase
  type exportado celular;
    Procedure crear(var c: celular; tit:string; mod:string; afab:integer; num:integer);
    Procedure modificarTitular(var c: celular; titNuevo:string);
    Procedure modificarModelo(var c: celular; modNuevo:string);
    Procedure modificarA�oFabricacion(var c: celular; aNuevo:integer);
    Procedure modificarNumero(var c: celular; numNuevo:integer);
    Procedure consultarTitular(c: celular; var tit:string);
    Procedure consultarModelo(c: celular; var m:string);
    Function consultarA�o(c: celular):integer;
    Function consultarNumero(c: celular): integer;

Implementacion
  celular= record
    titular:string;
    modelo:string;
    a�o:integer;
    numero:integer;
  end;

  Procedure crear(var c:celular; tit:string; mod:string; afab:integer; num:integer);
    Begin
      c.titular:=tit;
      c.modelo:= mod;
      c.a�o:= afab;
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

  Procedure modificarA�o(var c:celular; a�oNuevo:integer);
    Begin
      c.a�o:= a�oNuevo;
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

  Function consultarA�o(c:celular): integer;
    Begin
      consultarA�o:= c.a�o;
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
  num,a�o:integer;
Begin
  read(t);
  read(m);
  read(a);
  read(num);
  max:=-1;
  While (m <> �XXX�) do begin
    crear(cel,t,m,a�o,num);
    if ((2013-consultarA�o(cel) > max) then begin
      max:= (2013-consultarA�o(cel));
      consultarT�tular(cel,tit);
      end;
    read(t);
    read(m);
    read(a);
    read(num);
    end;
  write (tit);
end.


