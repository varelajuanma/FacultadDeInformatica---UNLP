{Generar una lista enlazada con información de alumnos que contiene el apellido, el nombre,
la carrera a la que se inscribe y la cantidad de materias que cursará. Los datos se guardan
de acuerdo al orden de entrada de los mismos. Posteriormente se deben mostrar los datos ingresados utilizando:
una solución iterativa}
Program ejer10;
type
  alumnos = record
          apellido:string;
          nombre:string;
          carrera:string;
          materias:integer;
          end;
  listaAlum = ^nodo;
  nodo = record
       datos:alumnos;
       sig:listaAlum;
       end;
procedure leerAlumno (var al:alumnos);
  begin
    writeln('--NUEVO ALUMNO--');
    write('Ingrese apellido: ');
    readln(al.apellido);
    if (al.apellido <> 'ZZZ') then begin
      write('Ingrese nombre: ');
      readln(al.nombre);
      write('Ingrese carrera en la que se inscribio: ');
      readln(al.carrera);
      write('Ingrese cantidad de materias: ');
      readln(al.materias);
      end;
  end;
procedure agregar (var la:listaAlum; al:alumnos);
  var
    aux:listaAlum;
  begin
    leerAlumno(al);
    while (al.apellido <> 'ZZZ') do begin
      new(aux);
      aux^.datos:= al;
      aux^.sig:= la;
      la:= aux;
      leerAlumno(al);
      end;
  end;
procedure recorrerLista (la:listaAlum);
  begin
    writeln ('----DATOS DEL ALUMNO----');
    writeln ('Apellido: ',la^.datos.apellido);
    writeln ('Nombre: ',la^.datos.nombre);
    writeln ('Carrera: ',la^.datos.carrera);
    writeln ('Cantidad de materias: ',la^.datos.materias);
    la:= la^.sig;
    if (la <> nil) then
      recorrerLista (la);
  end;
var
  la:listaAlum;
  al:alumnos;
begin
  la:= nil;
  agregar(la,al);
  recorrerLista(la);
  write('Ingrese ENTER para finalizar');
  readln();
end.
