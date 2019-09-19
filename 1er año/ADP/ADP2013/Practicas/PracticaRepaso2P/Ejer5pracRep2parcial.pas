Program ejer5pracRepaso;
type
  cadena = string[30];
  lista2 = ^nodol2;
  nodol2 = record
         dato:integer;
         sig:lista2;
         end;
  catalogoPC = record
         codigo:integer;
         nombre:cadena;
         precio:real;
         componentes:lista2;
         end;
  lista = ^nodol;
  nodol = record
         dato:catalogoPC;
         sig:lista;
         end;
  inventario = record
         codigo:integer;
         stockact:integer;
         stockmin:integer;
         end;
  arbol = ^nodoa;
  nodoa = record
         dato:inventario;
         hijoizq:arbol;
         hijoder:arbol;
         end;

function buscar (a:arbol;cod:integer):arbol;
  begin
    if (a = nil) then begin
      buscar:= nil;
      end
    else
      if (cod = a^.dato.codigo) then begin
        buscar:= a;
        end
      else
        if (cod < a^.dato.codigo) then begin
          buscar:= buscar (a^.hijoizq,cod);
          end
        else
          buscar:= buscar (a^.hijoder,cod);
  end;

procedure actualizarstock (var a:arbol);
  begin
    if (a^.dato.stockact < a^.dato.stockmin) then
      a^.dato.stockact:= a^.dato.stockact + (a^.dato.stockmin - a^.dato.stockact);
  end;

procedure incisoA (l:lista; var a:arbol; cod:integer; var cumple:boolean);
  var
    auxc,contaux,contaux1:integer;
    auxa:arbol;
  begin
    contaux:= 0;
    contaux1:= 0;
    while (l <> nil) and (cod <> l^.dato.codigo) do
      l:= l^.sig;
    if (cod = l^.dato.codigo) then begin
      while (l^.dato.componentes <> nil) do begin
        contaux:= contaux + 1;
        auxc:= l^.dato.componentes^.dato;
        auxa:= buscar (a,auxc);
        if (auxa^.dato.stockact >= auxa^.dato.stockmin) then begin
          writeln ('Hay stock disponible');
          contaux1:= contaux1 + 1;
          end;
        actualizarstock (auxa);
        end;
      if (contaux = contaux1) then begin
        cumple:= true;
        writeln('Se logro armar la PC');
        end
      else
        writeln('No se logro armar la PC por falta de componentes');
      end;
  end;

procedure insertar (var a2:arbol; cod:integer);
  begin
    if (a2 = nil) then begin
      new (a2);
      a2^.dato.codigo:= cod;
      a2^.hijoizq:= nil;
      a2^.hijoder:= nil;
      end
    else
      if (cod < a2^.dato.codigo) then begin
        insertar (a2^.hijoizq,cod);
        end
      else
        insertar (a2^.hijoder,cod);
  end;

procedure incisoB (a:arbol; var a2:arbol);
  begin
    if (a <> nil) then begin
      if (a^.dato.stockact < a^.dato.stockmin) then
        insertar (a2, a^.dato.codigo);
      incisoB (a^.hijoizq, a2);
      incisoB (a^.hijoder, a2);
      end;
  end;

procedure recorrer (a2:arbol);
  begin
    if (a2 <> nil) then begin
      write('Codigo: ',a2^.dato.codigo);
      recorrer (a2^.hijoizq);
      recorrer (a2^.hijoder);
      end;
  end;

var
  l:lista;
  a,a2:arbol;
  cod,cantpc:integer;
  cumple:boolean;
begin
  a2:= nil;
  cantpc:= 0;
  write ('Ingrese codigo de PC a reparar: ');
  readln (cod);
  while (cod <> 0) do begin
    cumple:= false;
    incisoA (l,a,cod,cumple);
    if (cumple = true) then begin
      cantpc:= cantpc + 1;
      end
    else
      incisoB (a,a2);
    write ('Ingrese codigo de PC a reparar: ');
    readln (cod);
    end;
  writeln('La cantidad de PC que fueron armadas es: ',cantpc);
  writeln('--CODIGOS DE COMPONENTES QUE NECESITAN REPOSICION--');
  recorrer (a2);
  writeln('Presione ENTER para finalizar');
  readln;
end.
