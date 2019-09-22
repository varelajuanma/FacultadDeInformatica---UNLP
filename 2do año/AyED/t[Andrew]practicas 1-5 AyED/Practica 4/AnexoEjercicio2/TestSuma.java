/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio2;

import ejercicio2.ArbolBinario;

public class TestSuma
{
	public static void main(String[] ahhh)
	{
		ArbolBinarioI arbol=new ArbolBinarioI(5);
		arbol.agregarHijoIzquierdo(new ArbolBinario<Integer>(3));
		arbol.agregarHijoDerecho(new ArbolBinario<Integer>(7));
		arbol.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		arbol.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(4));
		arbol.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(8));
		arbol.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(8));
		System.out.println(" la suma es: "+arbol.sumaElementosProfundidad(2));
	}
}
