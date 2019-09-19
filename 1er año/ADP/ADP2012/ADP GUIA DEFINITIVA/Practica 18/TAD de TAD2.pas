TAD Ttaller;
Interface
  uses Tautomovil;
  type exportado taller;
  procedure crear(var t:taller; nombre:string; dueno:string);
  procedure ingresar(var t:taller; a:auto);
  procedure arreglar(var t:taller; patente:string);
  function cantidadArreglar(t:taller):integer;
  function cantidadRetirar (t:taller):integer;
  procedure avanzarListaRetirar(var t:taller);
  procedure iniciarListaRetirar(var t:taller);
  procedure verElementoRetirar(t:taller; var a:auto);
Implementacion
  type
    listaA =^nodoA;
    nodoA=record
      dato:auto;
      sig:listaA;
    end;

    listaR =^nodoR;
    nodoR=record
      dato:auto;
      sig:listaR;
    end;

    taller = record
      nombre:string;
      dueno:string;
      arreglar:listaA;
      numArreglar:integer;
      iniArreglar:listaA;
      retirar:listaR;
      numRetirar:integer;
    end;

    procedure iniciarListaRetirar(var t:taller);
      begin
        t.Retirar:=t.iniRetirar;
      end;

    procedure avanzarListaRetirar(var t:taller);
      begin
        t.Retirar:=t.Retirar^.sig;
      end;

    procedure verElementoRetirar(t:taller; var a:auto);
      begin
        asignarAuto(a,t.Retirar^.dato);
      end;

    procedure crear(var t:taller; nombre:string; dueno:string);
      begin
        t.nombre:=nombre;
        t.dueno:=dueno;
        t.arreglar:=nil;
        t.iniArreglar:=nil;
        t.retirar:=nil;
        t.numArreglar:=0;
        t.numRetirar:=0;
      end;
    procedure ingresar(var t:taller; a:auto);
      var
        aux:listaA;
      begin
        new(aux);
        asignarAuto(aux^.dato,a)
        aux^.sig:=nil;
        if (t.arreglar=nil)then
          begin
            t.arreglar:=aux;
            t.iniArreglar:=aux;
          end
        else
          t.arreglar^.sig:=aux;
        t.numArreglar:=t.numArreglar+1;
      end;



    procedure arreglar(var t:taller; patente:string);
       var
        aux:listaR;
        ant:listaR;
        a:auto;
        pat:string
      begin
        pat:='nada';
        iniciarListaArreglar(t);  // <--- iniciar
        while (t.arreglar<>nil)and(pat<>patente)do
          begin
            ant:=t.arreglar;
            t.arreglar:=t.arreglar^.sig;
            verPatente(t.arreglar^.dato,pat)
          end;
        if (t.arreglar<>nil)then
          begin
            asignarAuto(a,t.arreglar^.dato);          //-> hacer en proceso
            ant^.sig:=t.arreglar^.sig;
            dispose(t.arreglar);                      //<-
            new(aux);
            asignarAuto(aux^.dato,a);
            aux^.sig:=nil;
            if (t.retirar=nil)then
              t.retirar:=aux
            else
              t.retirar^.sig:=aux;
            t.numArreglar:=t.numArreglar-1;
            t.numRetirar:=t.numRetirar+1;
          end
        else writeln('No existe un auto con esa patente.');
      end;
      function cantidadArreglar(t:taller):integer;
        begin
          cantidadArreglar:=t.numArreglar;
        end;
      function cantidadRetirar (t:taller):integer;
        begin
          cantidadRetirar:= t.numRetirar;
        end;

//Programa
  procedure informarRetirar(t:taller);
    var
      i,retirar:integer;
      a:auto;
      pat:string;
    begin
      retirar:= cantidadRetirar(t);
      iniciarListaRetirar(t);
      for i:=1 to retirar do
        begin
          verPatente(verElementoRetirar(t,a),pat);
          writeln('Patente: ',pat);
        end;
    end;


  procedure incisoB(var t:taller);
    var
      a:auto;
    begin
      crear(t,'Arreglo Todo','Pedro Gomez');
      ingresar(t,a);// se dispone
      informarRetirar(t);
    end;
//Programa Principal
var
  t:taller;
begin
  incisoB(t);
end.

