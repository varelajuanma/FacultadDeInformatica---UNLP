/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio2;
import ejercicio2.ArbolBinario;
public class ArbolBinarioI extends ArbolBinario<Integer>
{
	private int acum;
	public ArbolBinarioI(Integer num)
	{
		super(num);
	}
	public int sumaElementosProfundidad(int p)
	{
		sumando(this,p);
		return acum;
	}
	public void sumando(ArbolBinario<Integer> arbol,int niv)
	{
		if(!arbol.esVacio()&&niv==0)
		{
			acum=acum+arbol.getDatoRaiz().intValue();
		}
		else
			if(!arbol.esVacio()&&niv>0)
			{
				sumando(arbol.getHijoIzquierdo(),niv-1);
				sumando(arbol.getHijoDerecho(),niv-1);
			}
	}
}
