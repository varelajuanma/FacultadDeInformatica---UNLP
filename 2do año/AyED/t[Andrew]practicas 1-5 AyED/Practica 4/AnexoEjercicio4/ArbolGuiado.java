/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio4;
import ejercicio2.ArbolBinario;
import ejercicio2.ColaGenerica;
public class ArbolGuiado extends ArbolBinario<Integer>
{
	public ArbolGuiado(Integer dato)
	{
		super(dato);
	}
	public void recorridoGuiado()
	{
		ColaGenerica<ArbolBinario<Integer>> g=new ColaGenerica<ArbolBinario<Integer>>();
		ArbolBinario<Integer> temp;g.poner(this);
		while(!g.esVacia())
		{
			temp=g.sacar();
			System.out.print(temp.getDatoRaiz()+" ");
			if(!temp.getHijoIzquierdo().esVacio()&&!temp.getHijoDerecho().esVacio())
				if(temp.getHijoIzquierdo().getDatoRaiz()>=temp.getHijoDerecho().getDatoRaiz())
				{
					g.poner(temp.getHijoIzquierdo());
					g=buscar(temp.getHijoDerecho(),g);
				}
				else
				{
					g.poner(temp.getHijoDerecho());
					g=buscar(temp.getHijoIzquierdo(),g);
				}
			else
				if(!temp.getHijoIzquierdo().esVacio())
					g=buscar(temp.getHijoIzquierdo(),g);
				else
					g=buscar(temp.getHijoDerecho(),g);
		}
	}
	public ColaGenerica<ArbolBinario<Integer>> buscar(ArbolBinario<Integer> arbol,ColaGenerica<ArbolBinario<Integer>> c)
	{
		if(!arbol.esVacio())
		{
			System.out.print(arbol.getDatoRaiz()+" ");
			if(!arbol.getHijoIzquierdo().esVacio()&&!arbol.getHijoDerecho().esVacio())
				if(arbol.getHijoIzquierdo().getDatoRaiz()>=arbol.getHijoDerecho().getDatoRaiz())
				{
					c.poner(arbol.getHijoIzquierdo());
					c=buscar(arbol.getHijoDerecho(),c);
				}
				else
				{
					c.poner(arbol.getHijoDerecho());
					c=buscar(arbol.getHijoIzquierdo(),c);
				}
			else
				if(!arbol.getHijoIzquierdo().esVacio())
					c=buscar(arbol.getHijoIzquierdo(),c);
				else
					c=buscar(arbol.getHijoDerecho(),c);
		}
		return c;
	}
}
