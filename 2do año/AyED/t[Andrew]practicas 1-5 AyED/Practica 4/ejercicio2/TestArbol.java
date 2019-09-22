/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;

public class TestArbol
{
	public static void main(String[] ahhh)
	{
		ListaEnlazadaGenerica<Integer> lista=new ListaEnlazadaGenerica<Integer>();
		ArbolBinario<Integer> numeros=new ArbolBinario<Integer>(5);
		numeros.agregarHijoIzquierdo(new ArbolBinario<Integer>(3));
		numeros.agregarHijoDerecho(new ArbolBinario<Integer>(7));
		numeros.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		numeros.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(4));
		numeros.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(8));
		numeros.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(8));
		
		
		ArbolBinario<Integer> otrosNumeros=new ArbolBinario<Integer>(5);
		otrosNumeros.agregarHijoIzquierdo(new ArbolBinario<Integer>(3));
		otrosNumeros.agregarHijoDerecho(new ArbolBinario<Integer>(7));
		otrosNumeros.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		otrosNumeros.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(4));
		otrosNumeros.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(8));
		otrosNumeros.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(8));
		
		
		
		lista=numeros.frontera(lista);
		lista.comenzar();
		for(int i=0;i<lista.tamanio();i++)
		{
			System.out.println(" "+lista.elemento());
			lista.proximo();
		}
		if(numeros.lleno())
			System.out.println("arbol lleno");
		else
			System.out.println("arbol desequilibrado");
		if(numeros.completo())
			System.out.println("arbol completo");
		else
			System.out.println("arbol incompleto");
		
		if(numeros.esMenor(otrosNumeros))
			System.out.println("es menor");
		else
			System.out.println("no es menor");
	}
}
