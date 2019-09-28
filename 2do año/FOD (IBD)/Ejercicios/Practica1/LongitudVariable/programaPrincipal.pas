program Eje6LongFija;

USES
  crt, LongitudVariable;

procedure MenuPrincipal();
          begin
               gotoxy(30,2);writeln('Menu Principal');
               gotoxy(15,4);writeln('1. Devuelve la primer persona del archivo. ');
               gotoxy(15,5);writeln('2. Devuelve el siguiente resgitro de la persona. ');
               gotoxy(15,6);writeln('3. Buscar a una persona por el DNI. ');
               gotoxy(15,7);writeln('4. Exportar a un archivo de texto. ');
               gotoxy(15,8);writeln('5. Insertar a una persona con control de espacio libre. ');
               gotoxy(15,9);writeln('6. Eliminar a una persona dado un DNI. ');
               gotoxy(15,10);writeln('7. Modificar a una persona dado un DNI. ');
               gotoxy(15,11);writeln('8. Generar un nuevo archivo de respaldo. ');
               gotoxy(15,12);writeln('9. Salir... ');
               gotoxy(1,14);writeln('Ingrese una opcion: ');
          end;

procedure buscar_persona(var a:ctlPersona);
          var
             dni:longword;
             p:tPersona;
             ok:boolean;
          begin
               ClrScr;
               writeln('DNI de la personas que busca: ');writeln();
               readln(dni);
               buscar(a,dni,p,ok);
               if (ok = true) then begin
                  writeln('DNI: ', p.dni);
                  writeln('Nombre completo: ', p.apellido,', ', p.nombre);
                  writeln('Fecha de nacimiento: ', p.fechaNac);
               end
               else begin
                   writeln();writeln('No se encontro a la persona dentro del archivo. ');
               end;
               readln();
          end;

procedure Opcion1(var a:ctlPersona);
          var
            p:tPersona;
          begin
               ClrScr;
               writeln('Primer registro del archivo: ');writeln();
               primero(a,p);
               writeln('DNI: ',p.dni);
               writeln('Nombre completo: ',p.apellido,', ',p.nombre);
               writeln('Fecha de nacimiento: ', p.fechaNac);
               readln();
          end;

procedure Opcion2(var a:ctlPersona);
          var
           p:tPersona;
           inicio:boolean;
          begin
               ClrScr;
               siguiente(a,p,inicio);
               writeln('DNI: ', p.dni);
               writeln('Nombre completo: ', p.apellido,', ', p.nombre);
               writeln('Fecha de nacimiento: ', p.fechaNac);
               readln();
          end;

var
   e:ctlPersona;
   opcion:byte;
   t:text;
begin
     assign(e.arch,'archivo');
     assign(e.espLibre,'espacioLibre');
     cargar(e);
     repeat
           ClrScr;
           MenuPrincipal();
           gotoxy(20,15);readln(opcion);
           case opcion of
                    1:Opcion1(e);
                    2:Opcion2(e);
                    3:buscar_persona(e);
                    4:exportar(e,t);
                    5:insertar(e);
                    6:eliminar(e);
                    7:modificar(e);
                    8:respaldar(e);
           end;
     until(opcion = 9);
     ClrScr;
     gotoxy(5,5);writeln('Presione una tecla para terminar la aplicacion... ');
     readkey;
end.
