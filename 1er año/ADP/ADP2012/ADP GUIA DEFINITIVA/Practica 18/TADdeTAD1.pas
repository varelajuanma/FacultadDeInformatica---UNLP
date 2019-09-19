TAD TlistaTriangulo;
Interface
  Uses Ttriangulo;
  type exportado listaTriangulo;
  procedure crear(var l: listaTriangulo);
  procedure agregar (var l: listaTriangulo; t:triangulo);
  procedure borrar (var l: listaTriangulo; t:triangulo);
  procedure iniciar (var l:listaTriangulo);
  procedure avanzar (var l:listaTriangulo);
  function fin (l:listaTriangulo):boolean ;
  function vacia(l:listaTriangulo):boolean; //para ver si esta vacia la lista
  procedure elemento( l:listaTriangulo; var t:triangulo);
  procedure asignar (var l1:listaTriangulo; l2:listaTriangulo);

Implementacion
  type
    lista = ^nodo;
    nodo = record
      dato:triangulo;
      sig:lista;
    end;
    listaTriangulo = record
      pri:lista;
      ini:lista;
    end;
  procedure crear( var l:listaTriangulo);
    begin
      l.pri:=nil;
      l.ini:=nil;
    end;
    procedure iniciar(var l:listaTriangulo);
      begin
        l.pri:=l.ini;
      end;
    procedure agregar(var l:listaTriangulo; t:triangulo);
      var
        aux:listaTriangulo;
      begin
        new(aux);
        asignarTriangulo(aux^.dato,t);
        aux^.sig:=nil;
        if (vacia(l)=true)then
          begin
            l.ini:=aux;
            iniciar(l);
          end
        else
          l.pri^.sig:=aux;
      end;

    function comparar(t1:triangulo;t2:triangulo):boolean;
      var
        base,altura,angulo1,angulo2,angulo3:integer;
      begin
        if (consulBase(t1)=consulBase(t2)) and (consulAltura(t1)=consulAltura(t2)) and
          (consulAngulo1(t1)=consulAngulo1(t2)) then comparar:=true
        else comparar:=false;
      end;

    procedure borrar(var l:listaTriangulo; t:triangulo);
      var
        ant:lista;
      begin
        while (comparar(l.pri^.dato,t) = false)and(l.pri^.sig<>nil) do begin
          ant:=l.pri;
          l.pri:=l.pri^.sig;
        end;
        if (l.pri^.sig<>nil) then begin
          ant^.sig:=l.pri^.sig;
          dispose(l.pri);
        end
        else writeln('No existe el triangulo a borrar');
      end;

    procedure avanzar( var l:listaTriangulo);
      begin
        l.pri:=l.pri^.sig;
      end;

    function fin ( l:listaTriangulo):boolean;
      begin
        if (l.pri=nil) then fin:=true
        else fin:=false;
      end;

    function vacia(l:listaTriangulo):boolean;
      begin
        if (l.ini=nil) then vacia:=true
        else vacia:=false;
      end;

    procedure elemento( l:listaTriangulo; var t:triangulo);
      begin
        asignarTriangulo(t,l.pri^.dato);
      end;

    procedure asignar (var l1:listaTriangulo; l2:listaTriangulo);
      begin
        l1:=l2;
      end

//Programa
program Lista;
Uses TlistaTriangulo;
  procedure leer(var t:triangulo);
    var
      base,altura,angulo1,angulo2,angulo3:integer;
    begin
      read(base);
      read(altura);
      read(angulo1);
      read(angulo2);
      read(angulo3);
      crearTriangulo(t,base,altura,angulo1,angulo2,angulo3);
    end;
  procedure generarLista(var l:listaTriangulo);
    var
      t:triangulo;
    begin
      crear(l);
      leer(t);
      while (consulBase(t)<>0) do
        begin
          agregar(l,tri);
          leer(t);
        end;
    end;

   procedure Equilateros(l:listaTriangulo);
     var
       t:triangulo;
       cant:integer;
     begin
       cant:=0;
       iniciar(l);
       while (fin(l)<>true) do
         begin
           if ((consulAngulo1(elemento(l,t))=(consulAngulo2(elemento(l,t)))and
             (consulAngulo1(elemento(l,t))=(consulAngulo3(elemento(l,t)) then
           cant:=cant+1;
           avanzar(l);
         end;
       writeln('Cantidad de Equilateros: ',cant);
     end;

   procedure isoceles(l:listaTriangulo);
     var
       t:triangulo;
       cant:integer;
     begin
       cant:=0;
       iniciar(l);
       while (fin(l)<>true) do
         begin
           if (consulAngulo1(elemento(l,t))=(consulAngulo2(elemento(l,t)))then
             if(consulAngulo1(elemento(l,t))<>(consulAngulo3(elemento(l,t))) then
               cant:=cant+1
           else if (consulAngulo1(elemento(l,t))=(consulAngulo3(elemento(l,t)))then
             cant:=cant+1
             else if (consulAngulo2(elemento(l,t))=(consulAngulo3(elemento(l,t)))then
               cant:=cant+1;
           avanzar(l);
         end;
       writeln('Cantidad de Isoceles: ',cant);
     end;
   procedure Escalenos(l:listaTriangulo);
     var
       t:triangulo;
       cant:integer;
     begin
       cant:=0;
       iniciar(l);
       while (fin(l)<>true) do
         begin
           if ((consulAngulo1(elemento(l,t))<>(consulAngulo2(elemento(l,t)))and
             (consulAngulo1(elemento(l,t))<>(consulAngulo3(elemento(l,t)) then
             cant:=cant+1;
           avanzar(l);
         end;
       writeln('Cantidad de Equilateros: ',cant);
     end;
   procedure incisoB(l:listaTriangulo);
     begin
       equilateros(l);
       isoceles(l);
       escalenos(l);
     end;
//Programa Principal
var
  l:listaTriangulos;
begin
  generarLista(l);
  incisoB(l);
end.
