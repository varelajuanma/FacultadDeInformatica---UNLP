UNIT eje6;

INTERFACE
CONST
ValorAlto = 9999;
type
    persona= packed record
         case valido: boolean of
          true: (
           dni:longword;
           apellido:string;
           nombre:string;
           fechaNac:longword );
          false: ( proxLibre:longword );

    end;
    aPersonas=file of persona;

    ctlPersona=record
       arch:aPersonas;
       p:persona;
       libre:longword;
    end;

//procedure crear(var a:ctlPersona);        //crea un nuevo registro de personas
procedure cargar(var a:ctlPersona); //agrega un registro de persona al final del archivo sin validar unicidad ni espacio libre
function primero(var a:ctlPersona):persona;  //devuelve la primer persona del archivo
function siguiente(var a:ctlPersona):persona;  //devuelve la siguiente persona de la posicion actual del archivo
function recuperar(var a:ctlPersona; var dni:longword):integer;   //dado un dni, recupera la persona si existe, y devuelve un codigo indicando el exito de la operacion
procedure exportar(var a:ctlPersona);    //exporta a un archivo de texto el contenido del archivo
procedure insertar(var a:ctlPersona);   //agrega una persona, recuperando el espacio libre, o si no hay, la agrega al final
procedure eliminar(var a:ctlPersona);  //dado un dni lo busca y elimina la persona si existe el dni dado
procedure modificar(var a:ctlPersona); //dado un dni lo busca y modifica la persona si existe
procedure respaldar(var a:ctlPersona);  //genera un nuevo archivo sin espacio libre






IMPLEMENTATION
uses
    crt;

procedure cargar_persona(var p:persona);
          begin
               ClrScr;
               p.valido:= true;
               writeln('Ingrese la informacion de la persona: ');writeln();
               writeln('DNI: ');
               readln(p.dni);
               writeln('Apellido: ');
               readln(p.apellido);
               writeln('Nombre: ');
               readln(p.nombre);
               writeln('Fecha de nacimiento: ');
               readln(p.fechaNac);
          end;



procedure leer(var a:ctlPersona);
          begin
               if(not eof(a.arch)) then
                      read(a.arch,a.p)
               else
                   a.p.dni:=ValorAlto;
          end;

procedure abrir (var a:ctlPersona);
          begin
               reset(a.arch);
               leer(a);
               a.libre:=a.p.proxLibre;
               //close(a.arch);
               end;

procedure crear(var a:ctlPersona);
          begin
               rewrite(a.arch);
               a.p.valido:=false;
               a.p.proxLibre:=0;
               a.libre:=a.p.proxLibre;
               write(a.arch,a.p);
               close(a.arch);
          end;




procedure cargar(var a:ctlPersona);   // a partir de un archivo de texto cargar el nuevo archivo agregando las personas al final.
          var
             t:text;
             p:persona;
          begin
               assign(t,'C:\Users\Usuario\Desktop\trabajo ibd\Tad hecho\personas.txt');
               reset(t);
               crear(a);
               reset(a.arch);
               seek(a.arch, filepos(a.arch)+1);
               //abrir(archivo);
               while ( not eof(t)) do begin
                     p.valido:=true;
                     readln(t,p.dni);
                     readln(t,p.apellido);
                     readln(t,p.nombre);
                     readln(t,p.fechaNac);
                     writeln(p.dni);
                     write(a.arch, p);
                     //write(archivo.arch,per);
               end;
               close(a.arch);
          end;


function primero(var a:ctlPersona):persona;    //tengo que validar que la persona no este borrada.
         var
            p:persona;
         begin
              abrir(a);
              //reset(a.arch);
              if ioresult = 0 then begin
                 if (not eof(a.arch)) then begin
                    leer(a);
                    if (a.p.valido = true) then begin
                       primero:=a.p;
                       seek(a.arch,filepos(a.arch)-1);
                 end
                 else begin
                      while (not eof(a.arch) and (a.p.valido=false)) do begin
                            leer(a);
                      end;
                      if (a.p.valido = true ) then begin
                         primero:=a.p;
                         seek(a.arch,filepos(a.arch)-1)
                      end
                 end;
              end;
         end;


  //close(a.arch);
end;

function siguiente(var a:ctlPersona):persona;      //tengo que validar que la persona no este borrada
         begin
              abrir(a);
              //reset(a.arch);
              //read(a.arch,p);
              seek(a.arch,filepos(a.arch)+ 1);
              if (a.p.dni <> ValorAlto) then begin
                 leer(a);
                 //writeln(p.nombre);
                 if (a.p.valido = true) then begin
                    siguiente:=a.p;
                    seek(a.arch,filepos(a.arch)-1);
                 end;
                 //close(a.arch);
              end;
         end;

function recuperar(var a:ctlPersona; var dni:longword):integer;
         begin
              abrir(a);
              //reset(a.arch);
              if (ioresult = 0) then begin
                 leer(a);
                 while ((a.p.dni <> ValorAlto) and (a.p.dni <> dni)) do begin
                    leer(a);
                 end;
                 if (a.p.dni <> dni) then begin
                    //writeln(a.p.dni);
                    //writeln(a.p.apellido);
                    //writeln(a.p.nombre);
                    //writeln(a.p.fechaNac);
                    recuperar:=0;
                 end
                 else
                     recuperar:=1;
                 close(a.arch);
              end;
         end;

procedure exportar(var a:ctlPersona);
          var
             t:text;
          begin
               abrir(a);
               assign(t,'C:\Users\Usuario\Desktop\trabajo ibd\Tad hecho\Listado.txt');
               rewrite(t);
               writeln(t,'Listado de personas y proximos lugares libres: ');writeln(t,'');
               writeln(t,'Proximo libre: ',a.p.proxLibre);writeln(t,'');
               leer(a);
               while (a.p.dni <> ValorAlto) do begin
                     if (a.p.valido = true) then begin
                        writeln(t,'DNI: ',a.p.dni);
                        writeln(t,'Nombre completo: ',a.p.apellido,', ',a.p.nombre);
                        writeln(t,'Fecha de nacimiento: ',a.p.fechaNac);
                     end;
                     if (a.p.valido = false) then
                        writeln(t,'Proximo libre: ',a.p.proxLibre);
                     writeln(t,'');
                     leer(a);
                     //writeln(a.p.nombre);
               end;
               close(a.arch);
               close(t);
          end;


procedure insertar(var a:ctlPersona);
          var
             p:persona;
          begin
               ClrScr;
               abrir(a);
               reset(a.arch);
               cargar_persona(p);
               //writeln('libre', a.libre);
               //readln();
               if (recuperar(a,p.dni) = 0) then begin
                  //writeln('gato');
                  //readln();
                  if (a.libre = 0) then begin
                     reset(a.arch);
                     seek(a.arch,filesize(a.arch));
                     p.valido:=true;
                     //writeln('aca entrooooooooooooo');
                     //readln();
                     write(a.arch,p);
                     //writeln('aca entro amigo');
                     //readln();
                     //close(a.arch);
                  end
                  else begin
                    reset(a.arch);
                    //writeln('aca entroo');
                    //readln();
                    //readln();
                    seek(a.arch,a.libre);
                    read(a.arch,a.p);
                    seek(a.arch,0);
                    write(a.arch,a.p);
                    seek(a.arch,a.libre);
                    a.libre:=a.p.proxLibre;
                    a.p.valido:=true;
                    write(a.arch,p);
                    close(a.arch);
                  end
               end
               else begin
                    writeln('La persona ya existe !!');
                    close(a.arch);
                    readln();
               end;
               //close(a.arch);
               //writeln('aca va a cerrar el archivo');
          end;

procedure eliminar (var a:ctlPersona);
          var
             dni:longword;
          begin
               ClrScr;
               abrir(a);
               reset(a.arch);
               writeln('DNI de la persona a eliminar: ');
               readln(dni);
               leer(a);
               while((a.p.dni <> ValorAlto) and (dni <> a.p.dni)) do begin
                              read(a.arch,a.p);
               end;
               if(a.p.dni = dni) then begin
                          //writeln('aca entro');
                          //readln();
                          seek(a.arch,filepos(a.arch)-1);
                          writeln(filepos(a.arch));
                          //writeln('aca entro');
                          //readln();
                          a.p.valido:=false;
                          a.p.proxLibre:=filepos(a.arch);
                          seek(a.arch,0);
                          write(a.arch,a.p);
                          seek(a.arch,a.p.proxLibre);
                          a.p.valido:=false;
                          a.p.proxLibre:=a.libre;
                          write(a.arch,a.p);
                          writeln('La persona con DNI ',dni,' fue eliminada. ');
               end
               else begin
                    writeln();
                    writeln('El DNI de la persona no existe. ');
               end;
               readln();
          end;

{procedure modificar (var a:ctlPersona);
var
per:persona;
dni:longword;

begin
  abrir(a);
  read(a.arch,a.p);
  writeln('ingrese el deni de la persona a modificar');
  readln(dni);

  //leer(a);
  while((a.p.dni <> ValorAlto) and (a.p.dni <> dni))do begin
     leer(a);
  end;
  if (a.p.dni=dni) then begin
    seek(a.arch,filepos(a.arch)-1);
    writeln('ingrese dni de la persona');
    readln(per.dni);
    writeln('ingrese apellido de la persona');
    readln(per.apellido);
    writeln('ingrese nombre de la persona');
    readln(per.nombre);
    writeln('ingrese fecha de nacimiento');
    readln(per.fechaNac);
    write(a.arch,per);
  end else begin
    writeln('no existe el dni de la persona a modificar');
  end;
  close(a.arch);
end;
}
procedure modificar (var a:ctlPersona);
          var
             //per:persona;
             dni:longword;
          begin
               ClrScr;
               abrir(a);
               read(a.arch,a.p);
               writeln('DNI de la persona a modificar: ');
               readln(dni);
               //leer(a);
               while((a.p.dni <> ValorAlto) and (a.p.dni <> dni))do begin
                              leer(a);
               end;
               if (a.p.dni = dni) then begin
                  seek(a.arch,filepos(a.arch)-1);
                  //per.valido:=true;
                  //per.dni:=dni;
                  writeln('Nuevo apellido: ');
                  readln(a.p.apellido);
                  writeln('Nuevo nombre: ');
                  readln(a.p.nombre);
                  writeln('Nueva fecha de nacimiento: ');
                  readln(a.p.fechaNac);
                  writeln(a.p.dni, a.p.apellido, a.p.nombre, a.p.fechaNac);
                  readln();
                  write(a.arch,a.p);
               end
               else begin                  +
                    writeln();
                    writeln('No existe el DNI de la persona a modificar. ');
               end;
               close(a.arch);
               readln();
          end;

procedure exportar_nuevo(var a:aPersonas);
          var
             t:text;
             p:persona;
          begin
               ClrScr;
               assign(t,'C:\Users\Usuario\Desktop\trabajo ibd\Tad hecho\archivo_respaldo.txt');
               rewrite(t);
               reset(a);
               read(a,p);
               writeln(t,'Archivo de respaldo en formato .txt ');writeln(t,'');
               while (not eof(a)) do begin
                     writeln(t,'DNI: ',p.dni);
                     writeln(t,'Nombre completo: ',p.apellido,', ',p.nombre);
                     writeln(t,'Fecha de nacimiento: ',p.fechaNac);
                     writeln(t,'');
                     read(a,p);
               end;
               writeln(t,'DNI: ',p.dni);
               writeln(t,'Nombre completo: ',p.apellido,', ',p.nombre);
               writeln(t,'Fecha de nacimiento: ',p.fechaNac);
               close(a);
               close(t);
          end;


procedure respaldar(var a:ctlPersona);
          var
             archivo:aPersonas;
             nombre:string;
          begin
               ClrScr;
               writeln('Nombre del archivo de respaldo: ');
               readln(nombre);
               assign(archivo,'C:\Users\Usuario\Desktop\trabajo ibd\Tad hecho\'+nombre);
               rewrite(archivo);
               abrir(a);
               //reset(a.arch);
               //leer(a);
               while (a.p.dni <> ValorAlto) do begin
                     if (a.p.valido = true) then begin
                        //writeln(a.p.dni);
                        //readln();
                        write(archivo,a.p);
                     end;
                     leer(a);
               end;
               close(archivo);
               exportar_nuevo(archivo);
          end;

begin
end.





