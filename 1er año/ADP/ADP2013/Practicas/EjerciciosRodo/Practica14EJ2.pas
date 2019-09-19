TAD tpersona;
interface
  type exportado pers;
         procedure crear(var p:persona; nombre:string[30]; ocupacion:string[30]; altura:real; peso:real; dni:integer);
         procedure modificar Ocup(var p:pers; nuevoOcup:string[30]);
         procedure asignar(var p1:pers; p2:pers);
         procedure consultarNombre(p:pers; var nomb:string[30]);
         procedure consultarOcupacion(p:pers; var ocup:string[30]);
         function consultarAltura(p:pers):real;
         function consultarPeso(p:pers):real;
         function consultarDni(p:pers):integer;
implementacion
  type
    pers=record
               nombre:string[30];
               ocupacion:string[30];
               altura:real;
               peso:real;
               dni:integer;
         end;
    procedure crear(var p:persona; nom:string[30]; ocup:string[30]; alt:real; pe:real; dni:integer);
    begin
         p.nombre:=nomb;
         p.ocupacion:=ocup;
         p.peso:=pe;
         p.altura:=alt;
         p.dni:=dni;
    end;
    procedure modificar Ocup(var p:pers; nuevoOcup:string[30]);
    begin
         p.ocupacion:=nuevoOcup;
    end;
    procedure asignar(var p1:pers; p2:pers);
    begin
         p1:=p2;
    end;
    procedure consultarNombre(p:pers; var nomb:string[30]);
    begin
         nomb:=p.nombre;
    end;
    procedure consultarOcupacion(p:pers; var ocup:string[30]);
    begin
         ocup:=p.ocupacion;
    end;
    function consultarAltura(p:pers):real;
    begin
         consultarAltura:=p.altura;
    end;
    function consultarPeso(p:pers):real;
    begin
         consultarPeso:=p.peso;
    end;
    function consultarDni(p:pers):integer;
    begin
         consultarDni:=p.dni;
    end;
program p14ej2;
uses tpersona;
type
    vector=array[1..45]of pers;
procedure asignar(var v:vector);
var
   p:pers;
   nomb:string[30];
   ocup:string[30];
   alt:real;
   pe:real;
   dni:integer;
   i:integer;
begin
     for i:= 1 to 45 do
     begin
          write('ingrese Nombre: ');
          readln(nomb);
          write('ingrese ocupacion: ');
          readln(ocup);
          write('ingrese Altura: ');
          readln(alt);
          write('Ingrese Peso: ');
          readln(pe);
          write('Ingrese DNI: ');
          readln(dni);
          crear(p,nomb,ocup,alt,pe,dni);
          asignar(v[i],p);
     end;
end;
var
   v:vector;
   max:real;
   pmax:pers;
   nuevoOcup:string[30];
   i:integer;
   nomb:string[30];
   ocup:string[30];
   alt:real;
   pe:real;
   dni:integer;
begin
     writeln('Almacenar en el vector los datos de las pesonas');
     almacenar(v);
     max:=0;
     nuevoOcup:'empleado de comercio';
     for i:= 1 to 45 do
     begin
          pe:=consultarPeso(v[i]);
          if (pe > max) then
          begin
               max:=pe;
               asignar(pmax,v[i]);
          end;
          alt:=consultarAltura(v[i]);
          if (alt < 1.70) then
          begin
             consultarNombre(v[i],nomb);
             writeln(nomb,' Esta persona mide menos de 1,70 metros');
          end;
          dni:=consultarDni(v[i]);
          if (dni = 32000512) then
             modificarOcup(p,nuevoOcup);
     end;
     writeln('-----DATOS DE LA PERSONA CON MAYOR PESO-----')
     writeln('NOMBRE: ',pmax.nombre);
     writeln('OCUPACION: ',pmax.ocupacion);
     writeln('ALTURA: ',pmax.altura);
     writeln('PESO: ',pmax.peso);
     writeln('DNI: ',pmax.dni);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
