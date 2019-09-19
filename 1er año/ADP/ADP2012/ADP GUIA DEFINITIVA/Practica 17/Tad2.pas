TAD Tpersona;

Interfase
  type exportado Persona;
       procedure crear( var p:persona; nombre:string; dni:integer; ocupacion:string; altura:real; peso:real);
       function verNombre( p:persona):string;
       function verDni( p:persona):integer;
       function verOcupacion ( p:persona):string;
       function verAltura( p:persona):real;
       function verPeso( p:persona):real;
       procedure ModOcupacion( var p:persona; ocupacion:string);
       procedure asignar ( var p1:persona; p2:persona);

Implementacion
  type
    persona=record
      nombre:string;
      dni:integer;
      ocupacion:string;
      altura:real;
      peso:real;
    end;
  procedure crear(var p:persona; nombre:string; dni:integer; ocupacion:string; altura:real; peso:real);
    begin
      p.nombre:=nombre;
      p.dni:=dni;
      p.ocupacion:=ocupacion;
      p.altura:=altura;
      p.peso:=peso;
    end;
  function verNombre( p:persona):string;
    begin
      verNombre:= p.nombre;
    end;
  function verDni( p:persona):integer;
    begin
      verDni:= p.dni;
    end;
  function verOcupacion( p:persona):string;
    begin
      verOcupacion:= p.Ocupacion;
    end;
  function verAltura( p:persona):real;
    begin
      verAltura:= p.altura;
    end;
  function verPeso( p:persona):real;
    begin
      verPeso:= p.peso;
    end;
  procedure ModOcupacion( var p:persona; ocupacion:string);
    begin
      p.ocupacion:= ocupacion;
    end;
  procedure asignar ( var p1:persona; p2:persona);
    begin
      p1:=p2;
    end;

// Programa

Uses Tpersona;
  type
    vector = array [1..45] of persona;

  procedure almacenar( var v:vector; p:persona);
    var
      nombre:string;
      dni:integer;
      ocupacion:string;
      altura:real;
      peso:real;
    begin
      for i:=1 to 45 do begin
        read(nombre);
        read(dni);
        read(ocupacion);
        read(altura);
        read(peso);
        crear (p,nombre,dni,ocupacion,altura,peso);
        asignar(v[i],p);
      end;
    end;

  procedure mayorPeso( v:vector );
    var
      i:integer;
      max,peso:real;
      maxV:persona;
    begin
      for i:=1 to 45 do
        begin
          peso:= verPeso(v[i]);
          if (peso > max) then begin
            max:=peso;
            asignar(maxV,v[i]);
          end;
        end;
      verNombre(maxV);
      verDni(maxV);
      verOcupacion(maxV);
      verAltura(maxV);
      verPeso(maxV);
    end;

  procedure menores170( v:vector );
    var
      i:integer;
    begin
      for i:=1 to 45 do
        begin
          if (verAltura(v[i])< 1.70 ) then writeln(verNombre(v[i]));
        end;
    end;
  procedure modificarOc(var v:vector);
    var
      i:integer;
      ocupacion:string;
    begin
      i:=1;
      while (verDni(v[i]) <> 32000512) do
        i:=i+1;
      ocupacion:= 'empleado de comercio';
      modOcupacion(v[i],ocupacion);
    end;
//Programa Principal

var
  v:vector;
  p:persona;
begin
  almacenar(v, p);
  mayorPeso(v);
  menores170(v);
  modificarOc(v);
End.
