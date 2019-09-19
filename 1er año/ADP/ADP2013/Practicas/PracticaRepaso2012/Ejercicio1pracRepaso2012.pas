Program ejer1pracRepaso;
type
  cadena = string [30];
  pedido = record
         apellido:cadena;
         nombre:cadena;
         lugartur:cadena;
         personas:integer;
         precio:real;
         end;
  lista = ^nodol;
  nodol = record
         dato:pedido;
         sig:lista;
         end;
  hotel = record
         nombre:cadena;
         precio:real;
         capacidad:integer;
         end;
  lista2 = ^nodol2;
  nodol2 = record
         dato:hotel;
         sig:lista2;
         end;
  sitiotur = record
         nombre:cadena;
         distancia:integer;
         hoteles:lista2;
         end;
  arbol = ^nodoa;
  nodoa = record
         dato:sitiotur;
         hijoizq:arbol;
         hijoder:arbol;
         end;

function verificarprecio (a:arbol;l:lista):boolean;
  begin
    if (a^.dato.hoteles^.dato.precio > l^.dato.precio) then begin
      verificarprecio:= false;
      end
    else
      verificarprecio:= true;
  end;

function verificarcapacidad (a:arbol;l:lista):boolean;
  begin
    if (a^.dato.hoteles^.dato.capacidad < l^.dato.personas) then begin
      verificarcapacidad:= false;
      end
    else
      verificarcapacidad:= true;
  end;

procedure buscarhotel (var a:arbol; l:lista; var auxhotel:cadena; var cumple:boolean);
  begin
    cumple:= false;
    while (a^.dato.hoteles <> nil) and (cumple = false) do begin
      if (verificarprecio(a,l) = true) and (verificarcapacidad(a,l) = true) then begin
        cumple:= true;
        auxhotel:= a^.dato.hoteles^.dato.nombre;
        a^.dato.hoteles^.dato.capacidad:= a^.dato.hoteles^.dato.capacidad - l^.dato.personas;
        end
      else
        a^.dato.hoteles:= a^.dato.hoteles^.sig;
      end;
  end;

function buscarsitio (a:arbol;l:lista):arbol;
  begin
    if (a = nil) then begin
      buscarsitio:= nil;
      end
    else
      if (l^.dato.lugartur = a^.dato.nombre) then begin
        buscarsitio:= a;
        end
      else
        if (l^.dato.lugartur < a^.dato.nombre) then begin
          buscarsitio:= buscarsitio(a^.hijoizq,l);
          end
        else
          buscarsitio:= buscarsitio(a^.hijoder,l);
  end;

var
  a,aux:arbol;
  l:lista;
  auxhotel:cadena;
  cumple:boolean;
begin
  while (l <> nil) do begin
    aux:= buscarsitio (a,l);
    if (aux <> nil) then begin
      buscarhotel(a,l,auxhotel,cumple);
      if (cumple = true) then begin
        writeln('El sitio turistico tiene el hotel ',auxhotel,' que satisface las necesidades del cliente');
        end
      else
        writeln('El sitio turistico no posee un hotel que obtenga las necesidades que pide el cliente');
      end
    else
      writeln ('No se encuentra el sitio turistico pedido');
    end;
  writeln ('Presione ENTER para finalizar');
  readln;
end.
