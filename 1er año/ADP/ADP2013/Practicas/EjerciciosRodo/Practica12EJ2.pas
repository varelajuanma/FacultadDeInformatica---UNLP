program p12e2;
type
    cadena=string[30];
    alumno=record
                 apellido:cadena;
                 numero:integer;
                 dni:integer;
           end;
    lista=^nodo;
    nodo=record
               dato:alumno;
               sig:lista;
         end;
    listatriple=record
                      prinum:lista;
                      priape:lista;
                      pridni:lista;
                end;
procedure leer (var a:alumno);
begin
     with a do
     begin
          write('ingrese apellido: ');
          readln(apellido);
          if (apellido <> 'zzz') then
          begin
               write('ingrese numero de codigo: ');
               readln(numero);
               write('ingrese dni: ');
               readln(dni);
          end;
     end;
end;
procedure insertar_dni (var lt:listatriple; nue:lista);
var
   ant:lista;
   act:lista;
begin
     act:=lt.pridni;
     while (act <> nil) and (nue^.dato.dni > act^.dato.dni) do
     begin
          ant:=act;
          act:=act^.sig;
     end;
     if (act = lt.pridni) then
     begin
          nue^.sig:=lt.pridni;
          lt.pridni:=nue;
          end
          else
              ant^.sig:=nue;
              nue^.sig:=act;
end;
procedure insertar_ape (var lt:listatriple; nue:lista);
var
   ant:lista;
   act:lista;
begin
     act:=lt.priape;
     while (act <> nil) and (nue^.dato.apellido > act^.dato.apellido) do
     begin
          ant:=act;
          act:=act^.sig;
     end;
     if (act = lt.priape) then
     begin
          nue^.sig:=lt.priape;
          lt.priape:=nue;
          end
          else
              ant^.sig:=nue;
              nue^.sig:=act;
end;
procedure insertar_num (var lt:listatriple; nue:lista);
var
   ant:lista;
   act:lista;
begin
     act:=lt.prinum;
     while (act <> nil) and (nue^.dato.numero > act^.dato.numero) do
     begin
          ant:=act;
          act:=act^.sig;
     end;
     if (act = lt.prinum) then
     begin
          nue^.sig:=lt.prinum;
          lt.prinum:=nue;
          end
          else
              ant^.sig:=nue;
              nue^.sig:=act;
end;
procedure insertar (var lt:listatriple; a:alumno);
var
   nue:lista;
begin
     new(nue);
     nue^.dato:=a;
     nue^.sig:=nil;
     if (lt.pridni = nil) then
     begin
          lt.pridni:=nue;
          lt.priape:=nue;
          lt.prinum:=nue;
          end
          else
              insertar_dni(lt,nue);
              insertar_ape(lt,nue);
              insertar_num(lt,nue);
end;
var
   lt:listatriple;
   a:alumno;
begin
     lt.pridni:=nil;
     lt.priape:=nil;
     lt.prinum:=nil;
     writeln('ingrese datos del alumno');
     leer(a);
     while (a.apellido <> 'zzz') do
     begin
          insertar(lt,a);
          writeln('----------------------------');
          writeln('ingrese datos de otro alumno');
          leer(a);
     end;
     writeln('----------------------------');
     writeln('----------------------------');
     while (lt.pridni <> nil) do
     begin
          writeln(lt.pridni^.dato.dni);
          writeln(lt.pridni^.dato.apellido);
          writeln(lt.pridni^.dato.numero);
     end;
     writeln('----------------------------');
     writeln('----------------------------');
     while (lt.priape <> nil) do
     begin
          writeln(lt.pridni^.dato.apellido);
          writeln(lt.pridni^.dato.dni);
          writeln(lt.pridni^.dato.numero);
     end;
     writeln('----------------------------');
     writeln('----------------------------');
     while (lt.prinum <> nil) do
     begin
          writeln(lt.pridni^.dato.numero);
          writeln(lt.pridni^.dato.dni);
          writeln(lt.pridni^.dato.apellido);
     end;
     writeln('----------------------------');
     writeln('----------------------------');
     writeln('ingrese ENTER para finalizar');
     readln;
end.
