program p10ej4;
type
    cadena=string[20];
    registro=record
                   pais:cadena;
                   sitio:cadena;
             end;
    lista=^nodo;
    nodo=record
               dato:registro;
               sig:lista;
         end;
    lista2=^reg;
    reg=record
              sitio:cadena;
              sig:lista2;
        end;
procedure crear(var l:lista);
var
   nuevo:lista;
   p:cadena;
   s:cadena;
begin
     write('ingrese pais: ');
     readln(p);
     while (p <> 'xxx') do
     begin
          write('ingrese sitio: ');
          readln(s);
          new(nuevo);
          nuevo^.dato.pais:=p;
          nuevo^.dato.sitio:=s;
          nuevo^.sig:=l;
          l:=nuevo;
          write('ingrese otro pais: ');
          readln(p);
     end;
end;
function cantidad(l:lista; p:cadena):integer;
var
   aux:integer;
begin
     aux:=0;
     while (l <> Nil) do
     begin
          if (l^.dato.pais = p) then
             aux:=aux + 1;
          l:=l^.sig;
     end;
     cantidad:=aux;
end;
procedure AgregarAlFinal (var l:lista; datos:registro);
var
   act:lista;
   ult:lista;
   nuevo:lista;
begin
     new(nuevo);
     nuevo^.dato:=datos;
     nuevo^.sig:=Nil;
     if (l <> Nil) then
     begin
          act:=l;
          while (act <> Nil) do
          begin
               ult:=act;
               act:=act^.sig;
          end;
          ult^.sig:=nuevo;
          end
          else
          l:=nuevo;
end;
procedure crearLista2(var l2:lista2; l:lista; p2:cadena);
var
   ant:lista2;
   act:lista2;
   nuevo:lista2;
begin
     while (l <> Nil) do
     begin
          if (l^.dato.pais = p2) then
          begin
               new(nuevo);
               nuevo^.sitio:=l^.dato.sitio;
               act:=l2;
               ant:=l2;
               while (act <> Nil) and (act^.sitio < nuevo^.sitio) do
               begin
                    ant:=act;
                    act:=act^.sig;
               end;
               if (ant = act) then
               begin
                    l2:=nuevo;
                    end
                    else
                    begin
                         ant^.sig:=nuevo;
                         nuevo^.sig:=act;
                    end;
          end;
          l:=l^.sig;
     end;
end;
var
   l:lista;
   datos:registro;
   p:cadena;
   l2:lista2;
   p2:cadena;
begin
     l:=Nil;
     l2:=Nil;
     writeln('crear lista');
     crear(l);
     writeln('ingrese datos a agregar');
     write('ingrese pais: ');
     readln(datos.pais);
     write('ingrese sitio: ');
     readln(datos.sitio);
     AgregarAlFinal(l,datos);
     write('ingrese pais que desea contabilizar: ');
     readln(p);
     writeln('la cantidad de sitios turisticos que posee el pais "',p,'" es de: ',cantidad(l,p));
     write('ingrese el pais para crear nueva lista de sus sitios: ');
     readln(p2);
     crearLista2(l2,l,p2);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
