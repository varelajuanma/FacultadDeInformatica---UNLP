/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio2;

public class TestArbolGeneral
{
	public static void main(String[] ahhh)
	{
		ArbolGeneral<Integer> a1 = new ArbolGeneral<Integer>(1);
		ArbolGeneral<Integer> a2 = new ArbolGeneral<Integer>(2);
		ArbolGeneral<Integer> a3 = new ArbolGeneral<Integer>(3);
		ListaGenerica<ArbolGeneral<Integer>> hijos = new
		ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos.agregar(a1); hijos.agregar(a2); hijos.agregar(a3);
		ArbolGeneral<Integer> a = new ArbolGeneral<Integer>(0, hijos);
		System.out.println("la altura del arbol es: "+a.altura());
		System.out.println("el dato '1' esta en el nivel: "+a.nivel(1));
		System.out.println("la anchura del arbol es: "+a.ancho());
	}
}
