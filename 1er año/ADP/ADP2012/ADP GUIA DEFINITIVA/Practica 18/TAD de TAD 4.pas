TAD TRecetaDeCocina;
Interface
  type exportado receta;
  procedure crearReceta(var r:receta; nom:string; tiempo:real; au:string);
  function existeIngrediente( r:receta; ing:string):boolean;
  function completoIngrediente (r:receta):boolean;
  procedure agregarIngrediente(var r:receta; ing:string);
  procedure asignarReceta(var r:receta; raux:recta);
  procedure verNombre( r:receta; var nom:string);
  procedure verAutor( r:receta; var au:string);
  function verTiempoCoccion( r:receta):real;
  function verCantIngredientes( r:receta):integer;

Implementacion
  type

    vector = array [1..30]of string[20];
    receta =record
      nombre:string;
      tiempo:real;
      autor:string;
      ingredientes:vector;
      cantIngred:integer;
    end;


    procedure crearReceta(var r:receta; nom:string; tiempo:real; au:string);
      begin
        r.nombre:= nom;
        r.tiempo:= tiempo;
        r.autor:= au;
        r.cantIngred:=0;
      end;

    function existeIngrediente(r:receta; ing:string):boolean;
      var
        i:integer;
      begin
        i:=1;
        while (i<31)and(ing <> r.ingredientes[i])do
          i:=i+1;
        if (i<31) then existeIngrediente:=true;
      end;

    procedure agregarIngrediente(var r:receta; ing:string);
      var
        i:integer;
      begin
        i:= r.cantIngredientes+1;
        r.ingredientes[i]:= ing;
        r.cantIngred:= r.cantIngred+1;
      end;

    procedure verAutor(r:receta; var au:string);
      begin
        au:=r.autor;
      end;
    function verCantIngredientes(r:receta):integer;
      begin
        verCantIngredientes:= r.cantIngred;
      end;

//Programa
Program Libro;
Uses TRecetaDeCocina;
  type
    libro=^nodo;
    nodo=record
      dato:receta;
      sig:libro;
    end;

    procedure generarReceta( var r:receta);
      var
        nom,au,ing:string;
        tiempo:real;
      begin
        read(nom);
        read(tiempo);
        read(au);
        crearReceta(r,nom,tiempo,au);
        read(ing);
        while (ing <> 'ZZZ')do
          begin
            agregarIngrediente(r,ing);
            read(ing);
          end;
      end;

    procedure agregarAlLibro( var l:libro; r:receta);
      aux:libro;
      begin
        new(aux);
        asignarReceta(aux^.dato,r);
        aux^.sig:=nil;
        if (l=nil) then
          l:=aux
        else
          l^.sig:=aux;
      end;

    procedure incisoB (l:libro; tiempoMax:real; tiempoMin:real);
      var
        tiempo:real;
        nombre:string;
      begin
        while (l<>nil) do
          begin
            tiempo:=verTiempoCoccion(r);
            if (tiempo<TiempoMax) and (tiempo>TiempoMin) then
              begin
                verNombre(r,nombre);
                writeln(nombre);
              end;
            l:=l^.sig;
          end;
      end;
//Programa Principal

var
  r:receta;
  tiempoMax,tiempoMin:integer;
  l:libro
begin
  generarReceta(r);
  agregarAlLibro(l,r);
  read(tiempoMax);
  read(tiempoMin);
  incisoB(l,tiempoMax,tiempoMin);
end.
