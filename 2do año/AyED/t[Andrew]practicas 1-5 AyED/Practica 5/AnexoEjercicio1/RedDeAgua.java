/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio1;
import Ejercicio2.*;
public class RedDeAgua
{
	ArbolGeneral<Integer> red;
	private int caudal;
	private int min;
	public RedDeAgua(ArbolGeneral<Integer> k)
	{
		red=k;
	}
	public void setCaudal(int agua)
	{
		min=caudal=agua;
	}
	public int CalcularMinimo()
	{
		minimo(red,caudal);
		return min;
	}
	public void minimo(ArbolGeneral<Integer> nue,int agua)
	{
		if(!nue.esHoja())
		{
			ListaEnlazadaGenerica<ArbolGeneral<Integer>> lis = nue.getHijos();
			while(!lis.fin())
			{
				minimo(lis.elemento(),agua/lis.tamanio());
				lis.proximo();
			}
		}
		else
		{
			if(min>agua)
				min=agua;
		}
	}
}
