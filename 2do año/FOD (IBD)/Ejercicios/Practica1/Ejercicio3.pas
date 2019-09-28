Program ejer3prac1;
Const
  corte = 9999;
Type
  promotor = record
           codigo:integer;
           nombre:string;
           monto:real;
           end;
  arch_promotor = file of promotor;
  ventas = record
           cod:integer;
           nom:string;
           total:real;
           end;
  arch_ventas = file of ventas;

procedure leer (var arch:arch_promotor; var regprom:promotor);
  begin
    if not EOF (arch) then begin
      read(arch,regprom);
      end
    else
      regprom.codigo:= corte;
  end;

procedure compactar (var archp:arch_promotor);
  var
    regprom:promotor;
    archv:arch_ventas;
    regven:ventas;
    aux:integer;
    total:real;
    nom:string;
  begin
    write('Nombre del archivo de promotores: ');
    readln(nom);
    assign(archp,nom);
    reset(archp);
    assign(archv,'Archivo compacto');
    rewrite(archv);
    leer(archp,regprom);
    while (regprom.codigo <> corte) do begin
      aux:=regprom.codigo;
      total:= 0;
      while (aux = regprom.codigo) do begin
        total:=total + regprom.monto;
        nom:= regprom.nombre;
        leer(archp,regprom);
        end;
      regven.cod:= aux;
      regven.nom:= nom;
      regven.total:= total;
      write(archv,regven);
      end;
    close(archp);
    close(archv);
  end;
var
  archp:arch_promotor;
begin
  compactar(archp);
  writeln('Presione ENTER para finalizar');
  readln;
end.
