program Eje6LongFija;

USES
  crt, tadLongFija;

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

procedure agregar_dni(var a:ctlPersona);
          var
             dni:longword;
          begin
               ClrScr;
               writeln('DNI de la personas que busca: ');writeln();
               readln(dni);
               if (recuperar(a,dni) = 1) then begin
                  writeln();
                  writeln('DNI: ',a.p.dni);
                  writeln('Nombre completo: ',a.p.apellido,', ',a.p.nombre);
                  writeln('Fecha de nacimiento: ',a.p.fechaNac);
               end
               else begin
                   writeln();writeln('No se encontro a la persona dentro del archivo. ');
               end;
               readln();
          end;

procedure Opcion1(var a:ctlPersona);
          begin
               ClrScr;
               writeln('Primer registro del archivo: ');writeln();
               primero(a);
               writeln('DNI: ',a.p.dni);
               writeln('Nombre completo: ',a.p.apellido,', ',a.p.nombre);
               writeln('Fecha de nacimiento: ',a.p.fechaNac);
               readln();
          end;

procedure Opcion2(var a:ctlPersona);
          begin
               ClrScr;
               siguiente(a);
               writeln('DNI: ',a.p.dni);
               writeln('Nombre completo: ',a.p.apellido,', ',a.p.nombre);
               writeln('Fecha de nacimiento: ',a.p.fechaNac);
               readln();
          end;

var
   a:ctlPersona;
   opcion:byte;
begin
     assign(a.arch,'C:\Users\Usuario\Desktop\trabajo ibd\Tad hecho\archivo');
     cargar(a);
     repeat
           ClrScr;
           MenuPrincipal();
           gotoxy(20,15);readln(opcion);
           case opcion of
                    1:Opcion1(a);
                    2:Opcion2(a);
                    3:agregar_dni(a);
                    4:exportar(a);
                    5:insertar(a);
                    6:eliminar(a);
                    7:modificar(a);
                    8:respaldar(a);
           end;
     until(opcion = 9);
     ClrScr;
     gotoxy(5,5);writeln('Presione una tecla para terminar la aplicacion... ');
     readkey;
end.

