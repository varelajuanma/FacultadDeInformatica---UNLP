TAD TmanejadorDeAscensores;
Interface
  Uses Tascensor;
  type exportado Manejador;
  procedure crearManejador(var m:manejador);
  procedure agregarAscensor(var m:manejador; a:asce);
  procedure solicitarAscensor(m:manejador; sentido:string; pisoOrigen:integer; var identificadorAscensor:integer);

Implementacion
  type
    manejador = ^nodo;
    nodo=record
      dato:asce;
      sig:manejador;
    end;

    procedure crearManejador(var m:manejador);
      begin
        m:=nil;
      end;
    procedure agregarAscensor(var m:manejador; a:asce);
      var
        aux:manejador;
      begin
        new(aux);
        asignarAscensor(aux^.dato,a);
        aux^.sig:=nil;
        if (m = nil) then
          m:=aux
        else
          m^.sig:=aux;
      end;

    function Distancia(m:manejador; pisoOrigen:integer):integer;
      var
        posAc,calc:integer;
      begin
        posAc:= verPisoActual(m^.dato);
        if (posAc <= pisoOrigen) then calc:= pisoOrigen - posAc
        else calc:= posAc - pisoOrigen;
        Distancia:=calc;
      end;

    procedure solicitarAscensor(m:manejador; sentido:string; pisoOrigen:integer; var identificadorAscensor:integer);
      var
        calc,min,minId:integer;
        sentidoAc:string;
      begin
        while (m<>nil) do
          begin
            min:=999;
            if (HayLugar(m^.dato) = true)then
              begin
                verSentido(a,sentidoAc);
                if (sentidoAc = sentido) then
                  begin
                    calc:=Distancia(m,pisoOrigen);
                    if (calc < min) then
                    begin
                      min:=calc;
                      minId:=verIdentificadorAscensor(m^.dato);
                    end;
                  end;
              end;
            m:=m^.sig;
          end;
        identificadorAscensor:= minId;
      end;
