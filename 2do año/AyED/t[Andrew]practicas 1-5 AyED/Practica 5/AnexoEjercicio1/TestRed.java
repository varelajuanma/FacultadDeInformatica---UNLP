/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio1;

import Ejercicio2.ArbolGeneral;
import Ejercicio2.ListaEnlazadaGenerica;

public class TestRed
{
	public static void main(String[] ahhh)
	{
		ArbolGeneral<Integer> a1 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> a2 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> a3 = new ArbolGeneral<Integer>(new Integer(0));
		ListaEnlazadaGenerica<ArbolGeneral<Integer>> hijos1 = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos1.agregar(a1);
		hijos1.agregar(a2);
		hijos1.agregar(a3);
		ArbolGeneral<Integer> cau1 = new ArbolGeneral<Integer>(new Integer(0), hijos1);
		/*-----------------------------------------------------*/
		ArbolGeneral<Integer> b1 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> b2 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> b3 = new ArbolGeneral<Integer>(new Integer(0));
		ListaEnlazadaGenerica<ArbolGeneral<Integer>> hijos2 = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos2.agregar(b1);
		hijos2.agregar(b2);
		hijos2.agregar(b3);
		ArbolGeneral<Integer> cau2 = new ArbolGeneral<Integer>(new Integer(0), hijos2);
		/*-----------------------------------------------------*/
		ArbolGeneral<Integer> c1 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> c2 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> c3 = new ArbolGeneral<Integer>(new Integer(0));
		ArbolGeneral<Integer> c4 = new ArbolGeneral<Integer>(new Integer(0));
		ListaEnlazadaGenerica<ArbolGeneral<Integer>> hijos3 = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos3.agregar(c1);
		hijos3.agregar(c2);
		hijos3.agregar(c3);
		hijos3.agregar(c4);
		ArbolGeneral<Integer> cau3 = new ArbolGeneral<Integer>(new Integer(0), hijos3);
		/*-----------------------------------------------------*/
		ListaEnlazadaGenerica<ArbolGeneral<Integer>> hijos4 = new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos4.agregar(cau1);
		hijos4.agregar(cau2);
		hijos4.agregar(cau3);
		ArbolGeneral<Integer> caudal = new ArbolGeneral<Integer>(new Integer(0), hijos4);
		/*-----------------------------------------------------*/
		RedDeAgua mi=new RedDeAgua(caudal);
		mi.setCaudal(1000);
		System.out.println("el minimo caudal es: "+mi.CalcularMinimo());
		
	}
}
