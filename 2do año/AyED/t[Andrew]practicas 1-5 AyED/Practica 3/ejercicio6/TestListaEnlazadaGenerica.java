/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio6;

public class TestListaEnlazadaGenerica
{
	public static void main(String[] ahhh)
	{
		String[] lis={"garundewo","saransurowo","quiunendo","HEY!","quierbareundo","HEY!"};
		ListaEnlazadaGenerica<String> grupo=new ListaEnlazadaGenerica<String>();
		for(int i=lis.length-1;i>=0;i--)
		{
			grupo.agregar(lis[i]);
		}
		grupo.comenzar();
		for(int i=0;i<grupo.tamanio();i++)
		{
			System.out.println(" "+grupo.elemento());
			grupo.proximo();
		}
	}
}
