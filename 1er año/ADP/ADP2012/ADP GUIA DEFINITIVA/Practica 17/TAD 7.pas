TAD Tviaje;
Interface
  type exportado viaje;
  procedure crearUnViaje(var v:viaje; codigoAuto:integer; km:integer; dir1:string; dir2:string);
  function verCodigoAuto(v:viaje):integer;
  function verKilometros(v:viaje):integer;
  procedure asignarViaje(var v1:viaje; v2:viaje);

//Programa
program remiseria;
uses Tviaje;
  type
    lista=^nodo;
    nodo=record
      dato:viaje;
      sig:lista;
    end;

    remis=record
      totalKm:integer;
      codAuto:integer;
      viajes:integer;
    end;

    arbol=^nodoA;
    nodoA=record
      dato:remis;
      hi:arbol;
      hd:arbol;
    end;

    procedure insertar(var a:arbol; r:remis);
      begin
        if (a<>nil) then
          if (r.totalKm < a^.dato.totalKm)then insertar (a^.hi,r)
          else insertar (a^.hd,r)
        else a^.dato:=r;
      end;

    procedure generarArbol(l:lista; var a:arbol);
      var
        r:remis;
        viajes:integer;
      begin
        while (l<>nil)do
          begin
            actual:= verCodigoAuto(l^.dato);
            viajes:=0;
            while (verCodigoAuto(l^.dato)=actual)do
              begin
                r.codAuto:=actual;
                r.totalKm:=r.totalKm + verKilometros(v);
                r.viajes:=viajes+1;
                l:=l^.sig;
              end;
            insertar(a,r);
          end;
      end;

    procedure cantidadEntre(a:arbol; var cant:integer);
      begin
        if (a<>nil) then
          if (a^.dato.totalKm > 50000)then
            if (a^.dato.totalKm < 100000) then
              cant:=cant+1
            else cantidadEntre(a^.hi,cant)
          else cantidadEntre(a^.hd,cant);
      end;
    procedure calcularCantidad(a:arbol);
      var
        cant:integer;
      begin
        cant:=0;
        cantidadEntre(a,cant);
        writeln('Cantidad de autos con km entre 50000 y 100000: ',cant);
      end;

    procedure maxViajes(a:arbol; var max:integer; var auto:integer);
      begin
        if (a<>nil)then
          begin
            if (a^.dato.viajes>max) then
              begin
                max:=a^.dato.viajes;
                auto:=a^.dato.codAuto;
              end;
            maxViajes(a^.hi,max);
            maxViajes(a^.hd,max);
          end;
      end;
    procedure Viajes(a:arbol);
      var
        max:integer;
        auto:integer;
      begin
        max:= -1;
        auto:= -1;
        maxViajes(a,max,auto);
        writeln('Codigo del auto con mas viajes: ',auto);
      end;
//Programa Principal

var
  a:arbol;
  l:lista;
  r:remis;
begin
  generarArbol(l,a);
  calcularCantidad(a);
  viajes(a);
end.

