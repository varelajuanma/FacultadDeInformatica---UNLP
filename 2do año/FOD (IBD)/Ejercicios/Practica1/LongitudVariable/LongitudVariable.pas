UNIT EJE6LONGVARIABLE;
INTERFACE
uses Crt;
  const
    TAM_BLOQUE = 1024;
    CAP_BLOQUE = TAM_BLOQUE - SizeOf(Word);
    PORC_CARGA = 0.75;
    VALOR_ALTO = 9999;
  type


    tPersona = record
      size:word;
      dni:longword;
      apellido:string[20];
      nombre:string[20];
      fechaNac:longword;

    end;



    tBloque = record
      cantRegs:word;
      contenido:Array[1..CAP_BLOQUE] of byte;
    end;

    Modo = (ESC,LEC_ESC);

    ctlPersona = record
      arch:file of tBloque;
      espLibre:file of word;
      m:Modo;
      bloque:tBloque;
      iBloque:word;
      espLibreBloque:word;
    end;



procedure cargar(var e:ctlPersona); //agrega un registro de persona al final del archivo sin validar unicidad ni espacio libre
procedure primero(var e:ctlPersona;var p:tPersona);  //devuelve la primer persona del archivo
procedure siguiente(var e:ctlPersona;var p:tPersona; var inicio:boolean);  //devuelve la siguiente persona de la posicion actual del archivo
procedure buscar(var e:ctlPersona; dni:longword; var p:tPersona; var ok:boolean);   //dado un dni, recupera la persona si existe, y devuelve un codigo indicando el exito de la operacion
procedure exportar(var e:ctlPersona; var t:text);    //exporta a un archivo de texto el contenido del archivo
procedure insertar(var e:ctlPersona);   //agrega una persona, recuperando el espacio libre, o si no hay, la agrega al final
procedure eliminar(var e:ctlPersona);  //dado un dni lo busca y elimina la persona si existe el dni dado
procedure modificar(var e:ctlPersona); //dado un dni lo busca y modifica la persona si existe
procedure respaldar(var e:ctlPersona);  //genera un nuevo archivo sin espacio libre


//---------------------PROCESOS-----------------------------------------


//COMIENZO DE LA PRIMER OPCION DEL MENU


       //INICIO DE PROCESO QUE DEVUELVE LA LONGITUD DEL REGISTR
IMPLEMENTATION
type
  Archivo=file;

 procedure devolver_longitud(e:tPersona; var long:word);   //ES LA FUNCION GETLENGHT  ME VA A DEVOLVER LA LONGITD DE LO QE VOY A INSERTAR

  begin


    Inc(long, SizeOf(e.size));
    Inc(long, SizeOf(e.dni));
    Inc(long, Length(e.apellido));
    Inc(long, Length(e.nombre));
    Inc(long, SizeOf(e.fechaNac));
    Inc(long, 4);

  end;
     //FIN DEL PROCESO QUE DEVUELVE LA LONGITUD DEL ARCHIVO




      //INICIO DE PROCESO ESCRIBIR



  procedure escribir(datos:tPersona; var bloque:tBloque; i:word);
  begin
    //writeln('datos.size ', datos.size);
    //readln();

    Move(datos.size, bloque.contenido[i], SizeOf(datos.size));
    Inc(i, SizeOf(datos.size));
    //writeln(' i esta en : ', i);
    //readln();
    writeln(datos.dni);
    readln();
    Move(datos.dni, bloque.contenido[i], SizeOf(datos.dni));
    Inc(i, SizeOf(datos.dni));

    Move('#', bloque.contenido[i], 1);     // FIN DE CAMPO SIZE DE La persona  (CON #)
    Inc(i);
    Move(datos.apellido, bloque.contenido[i], Length(datos.apellido)+1);
    Inc(i, Length(datos.apellido)+1);
    Move('#', bloque.contenido[i], 1);     // FIN DE CAMPO APELLIDO DE LA PERSONA
    Inc(i);
    Move(datos.nombre, bloque.contenido[i], Length(datos.nombre)+1);
    Inc(i, Length(datos.nombre)+1);     // FIN DE CAMPO NOMBRE DE LA PERSONA
    Move('#', bloque.contenido[i], 1);
    Inc(i);
    Move(datos.fechaNac, bloque.contenido[i], SizeOf(datos.fechaNac));
    Inc(i, SizeOf(datos.fechaNac));
    Move('#', bloque.contenido[i], 1);                      // FIN DE CAMPO FECHA DE NACIMIENTO
    Inc(i);


  end;

      //FIN DE PROCESO DE ESCRIBIR



        //INICIO DE PROCESO CARGAR





procedure cargar_archivo(var e:ctlPersona; p:tPersona);
  var
    tamReg:Word;    //guarda la longitud del registro que se va a guardar en el archivo
    disp:Integer;    // en esta variable guardo los bytes disponibles en un bloque, sin excederme del porcentaje de carga
    long:Word;
  begin
   long:=0;
   devolver_longitud(p,long);
   tamReg := long + 1;
   disp:= e.espLibreBloque - Round((1-PORC_CARGA)*CAP_BLOQUE);   //en espLibre bloque tengo el espacio libre del bloque y le resto el espacio libre que se deja en el bloque

   if tamReg > disp then  //compara la cantidad disponible con el tamaño del registo a insertar, si se puede, genear la carga
   begin
     write(e.arch, e.bloque);
     Write(e.espLibre, e.espLibreBloque);
     e.bloque.cantRegs := 0;
     e.espLibreBloque := CAP_BLOQUE;
     e.iBloque := 1;
   end;

   escribir(p, e.bloque, e.iBloque);
   Inc(e.iBloque, tamReg);    //se incrementa el iBloque al tamaño del registro
   Inc(e.bloque.cantRegs);   //se incrementa en uno la cantidad de bloques en ese registro
   Dec(e.espLibreBloque, tamReg);   //le decremento al espacio libre, el tamaño que ocupe
  end;

         //FIN DE PROCESO CARGAR







         //INICIO DE COMIENZO CREAR (PARA EL REGISTRO DE EMPLEADOS)


  procedure Crear(var e:ctlPersona); //CREA EL ARCHIVO
  begin
    Rewrite(e.arch);
    Rewrite(e.espLibre);
    e.m:=ESC;
    e.bloque.cantRegs:=0;
    e.iBloque:=1;
    e.espLibreBloque:=CAP_BLOQUE;
  end;


          //FIN DE PROCESO CREAR


   
       //INICIO DE PROCESO ARIR


procedure Abrir(var e:ctlPersona);
begin
    Reset(e.arch);
    Reset(e.espLibre);
    e.m := LEC_ESC;
end;

    //FIN DE PROCESO ABRIR



  // INICIO PROCESO CERRAR

procedure Cerrar(var e:ctlPersona);
  begin
    if e.m = ESC then
    begin
      if e.bloque.cantRegs > 0 then
      begin
        write(e.arch, e.bloque);
        write(e.espLibre, e.espLibreBloque);
      end;
    end;
end;



    //FIN PROCESO CERRAR




         //INICIO DE PROCESO CREAR_ARCH


procedure cargar(var e:ctlPersona);
  var
    nom:string;
    t:text;
    reg:tPersona;
    i:byte;
    long:word;
  begin
    ClrScr;
    writeln('------------BIENVENIDO-------------');
    writeln();
    write(' Ingrese el nombre del archivo de texto: ');
    readln(nom);
    assign(t, nom);
    reset(t);
    Crear(e);
    long:=0;
    while (not eof(t)) do
    begin
      readln(t, reg.dni);
      readln(t, reg.apellido);
      readln(t, reg.nombre);
      readln(t, reg.fechaNac);
      devolver_longitud(reg,long);
      reg.size := long - SizeOf(reg.size);
      cargar_archivo(e, reg);
    end;

    close(t);
    cerrar(e);
    writeln('');
    writeln('Se creo el archivo de forma correcta');
    writeln();
    writeln('Presione una tecla para volver al menu');
    writeln();
    readkey;
  end;

          //FIN DE PROCESO CREAR_ARCH!!!




//FIN DE LA PRIMER OPCION DEL MENU














 
          //INICIO FUNCION BUSCARSEPARADOR


function buscarSeparador(bloque:tBloque; i:word):word;
   begin
       while (Chr(bloque.contenido[i]) <> '#') do      //chr devuelve el caracter que representa unNumeroEntero en la tabla de caracteres ASCII.
           Inc(i);
   buscarSeparador := i + 1;
end;


          //FIN FUNCION BUSCARSEPARADOR



         //INICIO DE PROCESO LEER

 procedure leer(var datos:tPersona; bloque:tBloque; i:word);
  var
    long:word;
    b:byte;
    str:string;
  begin
    Move(bloque.contenido[i], datos.size, SizeOf(datos.size));
    Inc(i, SizeOf(datos.size));

    Move(bloque.contenido[i], datos.dni, SizeOf(datos.dni));
    Inc(i, SizeOf(datos.dni)+1);

    long := buscarSeparador(bloque, i) - i;
    Move(bloque.contenido[i], datos.apellido, long);
    Inc(i, long);

    long := buscarSeparador(bloque, i) - i;
    Move(bloque.contenido[i], datos.nombre, long);
    Inc(i, long);

    Move(bloque.contenido[i], datos.fechaNac, SizeOf(datos.fechaNac));
    Inc(i, SizeOf(datos.fechaNac)+1);




  end;



      //FIN DE PROCESO LEER









      //INICIO PROCESO SIGUIENTE
procedure Siguiente(var e:ctlPersona; var p:tPersona; var inicio: Boolean);
var
   long:word;
   longitud:word;
begin
    if (e.iBloque > CAP_BLOQUE - e.espLibreBloque) and (not eof(e.arch)) then
    begin
     Read(e.arch, e.bloque);
     e.iBloque:=1;
     read(e.espLibre, e.espLibreBloque);
     inicio := True;
    end
    else inicio := False;

    if (e.iBloque < CAP_BLOQUE - e.espLibreBloque) then
    begin
      long:=0;
      leer(p, e.bloque, e.iBloque);
      devolver_longitud(p,long);
      longitud:= long + 1;
      Inc(e.iBloque, longitud);
    end
    else
      p.dni:= VALOR_ALTO;
  end;


  //FIN PROCESO SIGUIENTE




      //INICIO PROCESO PRIMERO

Procedure Primero(var e:ctlPersona; var p:tPersona);
var
   long:word;
begin
    long:=0;
    Seek(e.arch, 0);
    read(e.arch, e.bloque);
    leer(p, e.bloque, 1);
    devolver_longitud(p,long);
    e.iBloque := long + 2;
    seek(e.espLibre, 0);
    read(e.espLibre, e.espLibreBloque);
end;

        //FIN PROCESO PRIMERO
















//INICIO PROCEDURE LISTAR EN ARCHIVO DE TEXTO

procedure exportar(var e:ctlPersona; var t:text);
var
    reg:tPersona;
    inicio:boolean;
    i:byte;
    //str:string;
  begin
    assign(t,'archivoTexto.txt');
    rewrite(t);
    abrir(e);
    primero(e, reg);
    //writeln('el primero es : ', reg.dni);
    //readln();
    While (reg.dni <> VALOR_ALTO) do
    begin
         writeln(reg.dni, ' ', reg.apellido, ' ', reg.nombre, ' ', reg.fechaNac);
         readln();
         writeln(t,'DNI: ', reg.dni);
         writeln(t,'Apellido: ', reg.apellido);
         writeln(t,'nombre: ', reg.nombre);
         writeln(t,'fechaNac: ', reg.fechaNac);
         writeln(t,'-----------------------------------');

      Siguiente(e, reg, inicio);
    end;
    cerrar(e);
    close(t);
end;





//FIN PROCEDURE LISTAR EN ARCHIVO DE TEXTO




//INICIO DE PROCESO AGREGAR


procedure Agregar(var e:ctlPersona; p:tPersona);
  var
    tamReg: Word;
    libres: Word;
    disp: Integer;
    long:word;
  begin
    Seek(e.espLibre, 0);
    long:=0;
    devolver_longitud(p,long);
    tamReg := long + 1;

    repeat
      Read(e.espLibre, libres);
      disp := libres - Round((1-PORC_CARGA)*CAP_BLOQUE);
    until eof(e.espLibre) or (disp >= tamReg);
    writeln('los disponibles son : ' , disp);
    writeln(' el tamReg es : ', tamReg);
    readln();

    if (tamReg > disp) then
    begin
      e.bloque.cantRegs := 0;
      libres := CAP_BLOQUE;
      e.iBloque := 1;
      Seek(e.arch, FileSize(e.arch));
    end
    else
    begin
      Seek(e.arch, FilePos(e.espLibre)-1);
      Read(e.arch, e.bloque);
      e.iBloque := CAP_BLOQUE - libres + 1;
      Seek(e.arch, FilePos(e.espLibre)-1);
      seek(e.espLibre, FilePos(e.espLibre)-1);
    end;

    escribir(p, e.bloque, e.iBloque);
    Inc(e.bloque.cantRegs);
    Dec(libres, tamReg);
    Write(e.arch, e.bloque);
    Write(e.espLibre, libres);
  end;

    //FIN DE PROCESO AGREGAR









    // INICIO AGREGAR CREAR_REGISTRO

Procedure crear_registro (var reg:tPersona);

begin
  write(' Ingrese el dni del empleado: '); readln(reg.dni);
    write(' Ingrese el apellido : '); readln(reg.apellido);
    write(' Ingrese el nombre : '); readln(reg.nombre);
    write(' Ingrese fecha: '); readln(reg.fechaNac);
    writeln('');
end;


        // FIN PROCESO AGREGAR



        //INICIO PROCESO AGREGAR_EMPLEADO



procedure insertar(var e:ctlPersona);
  var
    reg:tPersona;

  begin
    ClrScr;
    crear_registro(reg);
    Abrir(e);
    Agregar(e,reg);
    Cerrar(e);
    writeln('Se dio de alta correctamente al empleado');
    writeln('Presione una tecla para volver al menu');
    readkey;
  end;



        //FIN PROCESO AGREGAR EMPLEADO




        
      //INICIO DE PROCESO BUSCAR
        
  Procedure Buscar(var e:ctlPersona; dni:longword; var p:tPersona; var ok:boolean);
  var
    inicio: Boolean;
  begin
     Primero(e, p);
     While ((p.dni <> VALOR_ALTO) and (dni <> p.dni)) do  begin
       Siguiente(e, p, inicio);
     end;
     if dni = p.dni then
       ok:=True
     else
       ok:=False;
  end;


      //FIN DE PROCESO BUSCAR





  //INICIO DE PROCESO MODIFICAR
procedure modificar_persona(var e:ctlPersona; p:tPersona; var result:boolean);
  var
    resObt:Boolean;
    resto:Word;
    tamReg:Word;
    aux:tPersona;
    long:word;
    long2:word;
    longitud:word;
    tamReg2:word;
    longitud2:word;
  begin
    Buscar(e, p.dni, aux, resObt);
    if (resObt) then
    begin
      long:=0;
      long2:=0;
      devolver_longitud(aux,long);
      longitud:=long + 1;
      resto:= CAP_BLOQUE - e.espLibreBloque - e.iBloque + 1;
      tamReg := longitud;
      If resto > 0 then begin
        Move(e.bloque.contenido[e.iBloque], e.bloque.contenido[e.iBloque-tamReg], resto);
      end;

      Inc(e.espLibreBloque, tamReg);
      e.iBloque := CAP_BLOQUE - e.espLibreBloque + 1;
      //p.size := long2 - SizeOf(p.size);
      devolver_longitud(p,long2);
       //
      //devolver_longitud(p,long2);
      longitud2:=long2 + 1;
      tamReg2 := longitud2;
      if tamReg2 > e.espLibreBloque then
      begin
        //writeln('entro por el if');
        //readln();

        Seek(e.arch, FilePos(e.arch)-1);
        Write(e.arch, e.bloque);
        Seek(e.espLibre, FilePos(e.espLibre)-1);
        Write(e.espLibre, e.espLibreBloque);
        Agregar(e, p);
      end
      else
      begin


        escribir(p, e.bloque, e.iBloque);
        //writeln ('desp del escribir esta en : ', e.iBloque);
        //readln();
        Dec(e.espLibreBloque, tamReg2);
        Seek(e.arch, FilePos(e.arch)-1);
        Write(e.arch, e.bloque);
        Seek(e.espLibre, FilePos(e.espLibre)-1);
        Write(e.espLibre, e.espLibreBloque);
      end;
      result:=True;
    end
    else result:=False;
end;





  //FIN PROCESO MODIFICAR







        //FIN DE PROCESO MOSTRAR OPCIONES  CONYUGUE

        //INICIO DE PROCESO OPCIONES


         //INICIO DE PROCESO MODIFICAR_EMPLEADO

procedure modificar(var e:ctlPersona);
  var
    dni:longword;
    reg:tPersona;
    existe:boolean;
    opcion:string;
    conyugue:boolean;
    hijos:boolean;
    aux:boolean;  //si se pone en true quiere decir que se hicieron cambios
    str:string;
    str2:string;

  begin
    ClrScr;
    write(' Ingrese el DNI del empleado a modificar: ');
    readln(dni);
    Abrir(e);
    Buscar(e, dni, reg, existe);
    //Cerrar(e);
    if (existe = true) then
		begin

            reg.dni:=dni;
            writeln('ingrese el apellido');
            readln(reg.apellido);
            writeln('ingrese el nombre');
            readln(reg.nombre);
            writeln('ingrese la fecha de nacimiento');
            readln(reg.fechaNac);
            modificar_persona(e, reg, aux);
			Cerrar(e);

    	end
    else
    begin
      writeln('');
      writeln('El dni del empleado a modificar no existe');
      //writeln('Presione una tecla para volver al menu');
      readkey;
    end;
  end;

       //FIN DE PROCESO MODIFICAR EMPLEADO


 //INICIO PROCESO ELIMINAR



procedure eliminar(var e:ctlPersona);
  var
    resObt:Boolean;
    dni:longword;
    resto:Word;
    tamReg:Word;
    aux:tPersona;
    long:word;

    longitud:word;
  begin
    writeln('ingrese el dni a eliminar');
    readln(dni);
    Buscar(e, dni, aux, resObt);
    if (resObt) then
    begin
      long:=0;
      devolver_longitud(aux,long);
      longitud:=long + 1;
      resto:= CAP_BLOQUE - e.espLibreBloque - e.iBloque + 1;
      tamReg := longitud;
      If resto > 0 then begin
        Move(e.bloque.contenido[e.iBloque], e.bloque.contenido[e.iBloque-tamReg], resto);
      end;

      Inc(e.espLibreBloque, tamReg);
      e.iBloque := CAP_BLOQUE - e.espLibreBloque + 1;
      Seek(e.arch, FilePos(e.arch)-1);
      Write(e.arch, e.bloque);
      Seek(e.espLibre, FilePos(e.espLibre)-1);
      Write(e.espLibre, e.espLibreBloque);

      //result:=True;
    end
    else
      writeln('la persona a eliminar no existe');
end;


{procedure exportar_respaldo(var a:Archivo);
var
 t:text;
 p:tPersona;
begin
 assign(t,'Respaldo.txt');
 rewrite(t);
 reset(a);
 read(a,p);
 writeln(p.dni);
 readln();
 while (not eof(a))do begin
   writeln(t,'DNI : ', p.dni);
   writeln(t, 'Apellido y Nombre : ', p.apellido, ' ', p.nombre);
   writeln(t, ' Fecha de Nacimiento : ', p.fechaNac);
   read(a,p);
 end;
 close(a);
 close(t);
end;    }








 //FIN PROCESO ELIMINAR


procedure respaldar(var e:ctlPersona);
var
    reg:tPersona;
    inicio:boolean;
    i:byte;
    a:Archivo;
    //str:string;
  begin
    assign(a,'archivoRespaldo');
    rewrite(a);
    abrir(e);
    primero(e, reg);
    //writeln('el primero es : ', reg.dni);
    //readln();
    While (reg.dni <> VALOR_ALTO) do
    begin
       blockwrite(a,reg.dni,sizeOf(reg.dni)+1);
       blockwrite(a,'#',1);
       blockwrite(a,reg.apellido,length(reg.apellido)+1);
       blockwrite(a,'#',1);
       blockwrite(a,reg.nombre,length(reg.nombre)+1);
       blockwrite(a,'#',1);
       blockwrite(a,reg.fechaNac,sizeOf(reg.fechaNac)+1);
       blockwrite(a,'@',1);



         //writeln(reg.dni);

         //write(a,reg);


      Siguiente(e, reg, inicio);
    end;

    cerrar(e);
    close(a);
    //exportar_respaldo(a);
end;






END.
