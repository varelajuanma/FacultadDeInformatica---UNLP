program repaso1;
type
    fecha=record
                dia:integer;
                mes:integer;
                anio:integer;
          end;
    registro=record
                   numero:integer;
                   Fcreacion:fecha;
                   Factualizacion:fecha;
                   extencion:string;
                   tamanio:integer;
             end;
    lista=^nodolista;
    nodolista=record
                    archivo:registro;
                    sig:lista;
              end;
    registro2=record
                    tamanio:integer;
                    listaArch:lista;
              end;
    arbol=^nodoarbol;
    nodoarbol=record
                    izq:arbol;
                    der:arbol;
                    dato:registro2;
              end;
procedure agregarNodoLista(var la:lista; dato:registro);
var
   nue:lista;
begin
     new(nue);
     nue^.archivo:=dato;
     nue^.sig:=la;
     la:=nue;
end;
procedure insertar(var a:arbol; dato:registro);
begin
     if (a = nil) then
     begin
          new(a);
          a^.izq:=nil;
          a^.der:=nil;
          a^.dato.tamanio:=dato.tamanio;
          agregarNodoLista(a^.dato.listaArch,dato);
          end
          else
          if (a^.dato.tamanio = dato.tamanio) then
          begin
               agregarNodoLista(a^.dato.listaArch,dato);
               end
               else
               if (dato.tamanio < a^.dato.tamanio) then
               begin
                    insertar(a^.izq,dato);
                    end
                    else
                    insertar(a^.der,dato);
end;
procedure elimiarArchivo(var pri:lista; numero:integer);
var
   ant,act:lista;
   ok:boolean;
begin
     act:=pri;
     ant:=act;
     ok:=false;
     while ((act^.archivo.numero <> numero) and (act <> nil)) do
     begin
          if (act^.archivo.numero = numero) then
             ok:=true;
          ant:=act;
          act:=act^.sig;
     end;
     if (ok = true) then
     begin
          if (act <> nil) then
          begin
               if (act = pri) then
               begin
                    pri:=act^.sig;
                    end
                    else
                    ant^.sig:=act^.sig;
               dispose(act);
          end
          else
          writeln('el archivo ',numero,' no existe');
end;
function Buscar(a:arbol; tamanio:integer):arbol;
begin
     if (a = nil) then
     begin
          Buscar:=nil;
          end
          else
          if (tamanio = a^.dato.tamanio) then
          begin
               Buscar:=a;
               end
               else
               if (tamanio < a^.dato.tamanio)then
               begin
                    Buscar:=Buscar(a^.izq,tamanio);
                    end
                    else
                    Buscar:=Buscar(a^.der,tamanio);
end;
procedure incisoB(var a:arbol; tamanio:integer; numero:integer);
var
   aux:arbol;
begin
     aux:=Buscar(a,tamanio);
     if (aux <> nil) then
     begin
          eliminarArchivo(aux^.dato.listaArch,numero);
          end
          else
          writeln('No hay archivos de tamaño ',tamanio);
end;
procedure contar(la:arbol; var cantTam:integer);
begin
     while (la <> nil) do
     begin
          cantTam:=cantTam + 1;
          la:=la^.sig;
     end;
end;
procedure incisoC(a:arbol; var cantTam:integer);
begin
     if (a <> nil) then
     begin
          if (a^.dato.tamanio > 1024) then
          begin
               if (a^.dato.tamanio < 102400) then
               begin
                    contar(a^.dato.listaArch,cantTam);
                    incisoC(a^.izq,cantTam);
                    incisoC(a^.der,cantTam);
                    end
                    else
                    incisoC(a^.izq,catTam);
               end
               else
               incisoC(a^.der,cantTam);
     end;
end;
var
   a:arbol;
   l:lista;
   cantTam,cantExt,tamanio,numero:integer;
begin
     a:=nil;
     contTam:=0;
     contExt:=0;
     while (l <> nil) do
     begin
          insertar(a,l^.archivo);
          if ((l^.archivo.extencion = 'txt') or (l^.archivo.extencion = 'pdf')) then
             cantExt:=cantExt + 1;
          l:=l^.sig;
     end;
     writeln('Ingresar numero y tamanio del archivo que desea borrar');
     write('numero: ');
     readln(numero);
     write('tamanio: ');
     readln(tamanio);
     incisoB(a,tamanio,numero);
     writeln('Contar la cantidad de archivos con tamaño mayor a 1024KB y menor a 102400KB');
     incisoC(a,cantTam);
     writeln('La cantidad de archivos que pesan entre 1024KB y 102400KB son: ',cantTam);
     writeln('La cantidad de archivos con extencion "txt" o "pdf" es de: ',cantExt);
     writeln('ingrese ENTER para finalizar');
     readln;
end.
