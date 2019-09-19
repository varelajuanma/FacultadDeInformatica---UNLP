TAD ListaDeEnteros;

Interfase
  type exportado Tlista;
    procedure crear(var l: Tlista);
    procedure agregar (var l: Tlista; num:integer);
    procedure borrar (var l: Tlista; num:integer);
    procedure iniciar (var l:Tlista);
    procedure avanzar (var l:Tlista);
    function fin (l:Tlista):boolean;
    function vacia(l:Tlista):boolean; //para ver si esta vacia la lista
    procedure elemento( l:Tlista; var elem:integer);
    procedure asignar (var l1:Tlista; l2:Tlista);

Implementacion
  type
    lista = ^nodo;
    nodo = record
      dato:integer;
      sig:lista;
    end;
    Tlista = record
      pri:lista;
      ini:lista;
    end;

    procedure crear (var l:Tlista);
      begin
        l.pri:=nil;
        l.ini:=nil;
      end;
    procedure iniciar(var l:Tlista);
      begin
        l.pri:=l.ini;
      end;
    procedure agregar(var l:Tlista; num:integer);
      var
        aux:Tlista;
      begin
        new(aux);
        aux^.dato:=num;
        aux^.sig:=nil;
        if (vacia(l)=true)then
          begin
            l.ini:=aux;
            iniciar(l);
          end
        else
          l.pri^.sig:=aux;
      end;

    procedure borrar(var l:Tlista; num:integer);
      var
        ant:lista;
      begin
        while (l.pri^.dato<>num)and(l.pri^.sig<>nil) do begin
          ant:=l.pri;
          l.pri:=l.pri^.sig;
        end;
        if (l.pri^.sig<>nil) then begin
          ant^.sig:=l.pri^.sig;
          dispose(l.pri);
        end
        else writeln('No existe el elemento a borrar');
      end;

    procedure avanzar( var l:Tlista);
      begin
        l.pri:=l.pri^.sig;
      end;

    function fin ( l:Tlista):boolean;
      begin
        if (l.pri=nil) then fin:=true
        else fin:=false;
      end;

    function vacia(l:Tlista):boolean;
      begin
        if (l.ini=nil) then vacia:=true
        else vacia:=false;
      end;

    procedure elemento( l:Tlista; var elem:integer);
      begin
        elem:= l.pri^.dato;
      end;

    procedure asignar (var l1:Tlista; l2:Tlista);
      begin
        l1:=l2;
      end;
