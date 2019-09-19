Program ejer3prac13A;
type
  cadena = string [30];
  empleado = record
           nroemp:integer;
           nombre:cadena;
           apellido:cadena;
           dni:integer;
           end;
  arbol = ^nodo;
  nodo = record
           dato:empleado;
           hijoizq:arbol;
           hijoder:arbol;
           end;

procedure leerregistro (var emp:empleado);
  begin
    with emp do begin
      write ('Ingrese el numero de empleado: ');
      readln (nroemp);
      if (nroemp <> 0) then begin
        write ('Ingrese el nombre: ');
        readln (nombre);
        write('Ingrese el apellido: ');
        readln (apellido);
        write('Ingrese el DNI: ');
        readln (dni);
        end;
      end;
  end;

procedure insertar (var a:arbol; emp:empleado);
  begin
    if (a = nil) then begin
      new (a);
      a^.dato:= emp;
      a^.hijoizq:= nil;
      a^.hijoder:= nil;
      end
    else
      if (emp.nroemp < a^.dato.nroemp) then begin
        insertar (a^.hijoizq, emp);
        end
      else
        insertar (a^.hijoder, emp);
  end;

procedure incisoA (a:arbol);
  begin
    if (a <> nil) then begin
      if (a^.dato.dni MOD 2 = 0) then
        writeln (a^.dato.nombre,' ',a^.dato.apellido);
      incisoA (a^.hijoizq);
      incisoA (a^.hijoder);
      end;
  end;

procedure incisoB (a:arbol; var max:arbol);
  begin
    if (a <> nil) then
      while (a^.hijoder <> nil) do
        a:= a^.hijoder;
      max:= a;
  end;

procedure incisoC (a:arbol; var cant:integer);
  begin
    if (a <> nil) then begin
      cant:= cant + 1;
      incisoC (a^.hijoizq, cant);
      incisoC (a^.hijoder, cant);
      end;
  end;

var
  emp:empleado;
  a,max:arbol;
  cant:integer;
begin
  a:= nil;
  cant:= 0;
  writeln ('---- GENERAR ARBOL ----');
  writeln ('---- INSERTAR NUEVO EMPLEADO ----');
  leerregistro (emp);
  while (emp.nroemp <> 0) do begin
    insertar (a,emp);
    writeln ('---- INSERTAR NUEVO EMPLEADO ----');
    leerregistro (emp);
    end;
  writeln ('EMPLEADOS QUE SU DNI TERMINAN CON EL DIGITO PAR');
  incisoA (a);
  writeln ('EMPLEADO QUE TIENEN EL NUMERO MAXIMO DE EMPLEADO');
  incisoB (a,max);
  writeln ('NUMERO:',max^.dato.nroemp,' NOMBRE:',max^.dato.nombre,' APELLIDO:',max^.dato.apellido,' DNI:',max^.dato.dni);
  writeln('INFORMAR LA CANTIDAD TOTAL DE EMPLEADOS');
  incisoC (a,cant);
  writeln ('La cantidad total de empleados es: ',cant);
  writeln ('Presione ENTER para finalizar');
  readln;
end.
