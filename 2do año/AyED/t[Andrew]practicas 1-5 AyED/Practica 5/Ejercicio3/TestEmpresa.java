/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio3;

import Ejercicio2.ArbolGeneral;
import Ejercicio2.ListaEnlazadaGenerica;

public class TestEmpresa
{
	public static void main(String[] ahhh)
	{
		ArbolGeneral<Empleado> a1 = new ArbolGeneral<Empleado>(new Empleado("juan",3,3));
		ArbolGeneral<Empleado> a2 = new ArbolGeneral<Empleado>(new Empleado("mateo",2,3));
		ArbolGeneral<Empleado> a3 = new ArbolGeneral<Empleado>(new Empleado("santi",2,3));
		ListaEnlazadaGenerica<ArbolGeneral<Empleado>> hijos1 = new ListaEnlazadaGenerica<ArbolGeneral<Empleado>>();
		hijos1.agregar(a1);
		hijos1.agregar(a2);
		hijos1.agregar(a3);
		ArbolGeneral<Empleado> emp1 = new ArbolGeneral<Empleado>(new Empleado("jose",4,2), hijos1);
		/*-----------------------------------------------------*/
		ArbolGeneral<Empleado> b1 = new ArbolGeneral<Empleado>(new Empleado("hermes",2,3));
		ArbolGeneral<Empleado> b2 = new ArbolGeneral<Empleado>(new Empleado("goity",3,3));
		ArbolGeneral<Empleado> b3 = new ArbolGeneral<Empleado>(new Empleado("felicio",2,3));
		ListaEnlazadaGenerica<ArbolGeneral<Empleado>> hijos2 = new ListaEnlazadaGenerica<ArbolGeneral<Empleado>>();
		hijos2.agregar(b1);
		hijos2.agregar(b2);
		hijos2.agregar(b3);
		ArbolGeneral<Empleado> emp2 = new ArbolGeneral<Empleado>(new Empleado("araoz",2,2), hijos2);
		/*-----------------------------------------------------*/
		ArbolGeneral<Empleado> c1 = new ArbolGeneral<Empleado>(new Empleado("sily",2,3));
		ArbolGeneral<Empleado> c2 = new ArbolGeneral<Empleado>(new Empleado("noher",2,3));
		ArbolGeneral<Empleado> c3 = new ArbolGeneral<Empleado>(new Empleado("pia",2,3));
		ListaEnlazadaGenerica<ArbolGeneral<Empleado>> hijos3 = new ListaEnlazadaGenerica<ArbolGeneral<Empleado>>();
		hijos3.agregar(c1);
		hijos3.agregar(c2);
		hijos3.agregar(c3);
		ArbolGeneral<Empleado> emp3 = new ArbolGeneral<Empleado>(new Empleado("risa",2,2), hijos3);
		/*-----------------------------------------------------*/
		ListaEnlazadaGenerica<ArbolGeneral<Empleado>> hijos4 = new ListaEnlazadaGenerica<ArbolGeneral<Empleado>>();
		hijos4.agregar(emp1);
		hijos4.agregar(emp2);
		hijos4.agregar(emp3);
		ArbolGeneral<Empleado> empleados = new ArbolGeneral<Empleado>(new Empleado("ara",5,1), hijos4);
		/*-----------------------------------------------------*/
		Empresa nue=new Empresa(empleados);
		nue.mostrar();
		ListaEnlazadaGenerica<Integer> lista=(ListaEnlazadaGenerica<Integer>)nue.empleadosPorCategoria();
		System.out.println("la cantidad de empleados por categoria es: ");
		lista.comenzar();
		for(int i=0;i<lista.tamanio();i++)
		{
			System.out.print(" "+lista.elemento());
			lista.proximo();
		}
		System.out.println();
		System.out.println("la categoria con mas empleados tiene: "+nue.categoriaConMasEmpleados());
		System.out.println("la cantidad total de Empleados es: "+nue.cantidadTotalDeEmpleados());	
		nue.reemplazarPresidente();
		System.out.println("el nuevo presidente es: "+empleados.getDatoRaiz().getNombre());
		/*-----------------------------------------------------*/
		nue.mostrar();
	}
}
