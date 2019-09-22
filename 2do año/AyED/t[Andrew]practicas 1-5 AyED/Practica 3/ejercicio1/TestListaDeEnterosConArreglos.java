/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio1;

public class TestListaDeEnterosConArreglos
{
	public static void main(String[] ahhh)
	{
		ListaDeEnterosConArreglos lis = new ListaDeEnterosConArreglos();

		lis.agregar(2);
		lis.agregar(4);
		lis.agregar(6);
		lis.agregar(8);
		lis.agregar(10);
		lis.comenzar();
		for(int i=0;i<lis.tamanio();i++)
		{
			System.out.println(" "+ lis.elemento());
			lis.proximo();
		}
	}
}
