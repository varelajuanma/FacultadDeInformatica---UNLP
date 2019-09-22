/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio4;
import ejercicio1.ListaDeEnterosEnlazada;
public class CribaDeEratostenes
{
	protected static ListaDeEnterosEnlazada lis=new ListaDeEnterosEnlazada();
	public static ListaDeEnterosEnlazada obtenerPrimos()
	{
		int[] datos=new int[1000];
		int ma=0;
		for(int i=0;i<datos.length;i++)
		{
			datos[i]=i;
		}
		for(int j=2;ma<=(int)Math.sqrt(1000);j++)
		{
			if(datos[j]!=0)
			{
				lis.agregar(datos[j]);
				ma++;
			}
			for(int i=(j+1);i<datos.length;i++)
			{
				if(datos[i]%j==0)
					datos[i]=0;
			}
		}
		return lis;
	}
	public static void mostrar()
	{
		lis.comenzar();
		for(int i=0;i<lis.tamanio();i++)
		{
			System.out.println(" "+lis.elemento());
			lis.proximo();
		}
	}
	public static void main(String[] ahhh)
	{
		lis=obtenerPrimos();
		mostrar();
	}
}
