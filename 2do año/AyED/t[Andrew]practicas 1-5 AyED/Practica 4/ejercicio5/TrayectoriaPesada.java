/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio5;
import ejercicio2.ArbolBinario;
public class TrayectoriaPesada
{
	public static void main(String[] ahhh)
	{
		ArbolBinario<Integer> pes =new ArbolBinario<Integer>(7);
		pes.agregarHijoDerecho(new ArbolBinario<Integer>(3));
		pes.agregarHijoIzquierdo(new ArbolBinario<Integer>(1));
		pes.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(4));
		pes.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(1));
		pes.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		calcular(pes);
	}
	public static void calcular(ArbolBinario<Integer> arbol)
	{
		int num=1;
		int acum=0;
		if(!arbol.esVacio())
		{
			acum=arbol.getDatoRaiz();
			if(arbol.esHoja())
			{
				System.out.println(" Hoja nivel: "+num+" = "+acum);
			}
			else
			{
				if(!arbol.getHijoIzquierdo().esVacio())
					buscar(arbol.getHijoIzquierdo(),num+1,acum);
				if(!arbol.getHijoDerecho().esVacio())
					buscar(arbol.getHijoDerecho(),num+1,acum);
			}
			
		}
	}
	public static void buscar(ArbolBinario<Integer> arbol,int num,int acum)
	{
		if(!arbol.esVacio())
			acum=acum+(arbol.getDatoRaiz()*num);
		if(arbol.esHoja())
		{
			System.out.println(" Hoja nivel: "+num+" = "+acum);
		}
		else
		{
			if(!arbol.getHijoIzquierdo().esVacio())
				buscar(arbol.getHijoIzquierdo(),num+1,acum);
			if(!arbol.getHijoDerecho().esVacio())
				buscar(arbol.getHijoDerecho(),num+1,acum);
		}
	}
}
