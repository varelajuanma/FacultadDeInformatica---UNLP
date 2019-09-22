/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio1;
import ejercicio2.ArbolBinario;
public class RedBinaria
{
	public static int max;
	public static void RetMax(ArbolBinario<Integer> unAr,int rel)
	{
		if(!unAr.esVacio())
		{
			if(!unAr.esHoja()){
			RetMax(unAr.getHijoIzquierdo(),rel+unAr.getDatoRaiz());
			RetMax(unAr.getHijoDerecho(),rel+unAr.getDatoRaiz());}	
			else
				if(rel>max)
					max=rel;
		}
	}
	public static void main(String[] ahhh)
	{
		max=0;
		ArbolBinario<Integer> arbol=new ArbolBinario<Integer>(4);
		arbol.agregarHijoIzquierdo(new ArbolBinario<Integer>(3));
		arbol.agregarHijoDerecho(new ArbolBinario<Integer>(2));
		arbol.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Integer>(5));
		RetMax(arbol,0);
		System.out.println(" max: "+max);
	}
}
