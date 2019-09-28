Program ejer4prac1;
const
  valoralto = 9999;
type
  fech = record
    dia:integer;
    mes:integer;
    ano:integer;
    end;
  empleado = record
    num:integer;
    fecha:fech;
    hsextras:integer;
    end;
  arch_detalle = file of empleado;

  empleadomaster = record
    num:integer;
    sede:integer;
    nombre:string;
    sueldobas:real;
    montohsextras:real;
    end;
  arch_maestro = file of empleadomaster;

  newreg = record
    num:integer;
    totalacobrar:real;
    end;
  arch_new = file of newreg;

var
  regm:empleadomaster;
  min,regd1,regd2,regd3,regd4,regd5:empleado;
  mae1:arch_maestro;
  det1,det2,det3,det4,det5:arch_detalle;
  sueldototal:real;
  aux,totalextras:integer;
  regnew:newreg;
  newarch:arch_new;

procedure leer (var arch_d:arch_detalle;var dato:empleado);
  begin
    if (not eof(arch_d)) then begin
      read(arch_d,dato);
      end
    else
      dato.num:= valoralto;
  end;

procedure minimo (var reg1,reg2,reg3,reg4,reg5,min:empleado);
  begin
    if (reg1.num <= reg2.num) and (reg1.num <= reg3.num) and (reg1.num <= reg4.num) and (reg1.num <= reg5.num) then begin
      min:= reg1;
      leer (det1,reg1);
      end
    else
      if (reg2.num <= reg3.num) then begin
        min:= reg2;
        leer (det2,reg2);
        end
      else
        if (reg3.num <= reg4.num) then begin
          min:= reg3;
          leer (det3,reg3);
          end
        else
          if (reg4.num <= reg5.num) then begin
            min:= reg4;
            leer (det4,reg4);
            end
          else
            min:= reg5;
            leer (det5,reg5);
  end;

begin
  assign (mae1,'maestro');
  assign (regnew, 'nuevo');
  assign (regd1, 'detalle 1');
  assign (regd2, 'detalle 2');
  assign (regd3, 'detalle 3');
  assign (regd4, 'detalle 4');
  assign (regd5, 'detalle 5');
  reset (mae1);
  reset (regd1);
  reset (regd2);
  reset (regd3);
  reset (regd4);
  reset (regd5);
  rewrite (newreg);
  read (mae1,regm);
  leer (det1,regd1);
  leer (det2,regd2);
  leer (det3,regd3);
  leer (det4,regd4);
  leer (det5,regd5);
  minimo(regd1,regd2,regd3,regd4,regd5,min);
  while (min.num <> valoralto) do begin
    aux:= min.num;
    totalextras:= 0;
    while (aux = min.num) do begin
      totalextras:= totalextras + min.hsextras;
      minimo(regd1,regd2,regd3,regd4,regd5,min);
      end;
    while (regm.num <> aux) do
      read (mae1,regm);
    sueldototal:= regm.sueldobas + (regm.montohsextras*totalextras);
    regnew.num:=aux;
    regnew.totalacobrar:=sueldototal;
    write(newarch,regnew);
    end;
  close (mae1);
  close (regd1);
  close (regd2);
  close (regd3);
  close (regd4);
  close (regd5);
  close (newarch);
end.
