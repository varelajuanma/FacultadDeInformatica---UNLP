/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio8;

import ejercicio6.ListaEnlazadaGenerica;

public class TestListaInvertidaDeGramas
{
	public static void main(String[] ahhh)
	{
		ListaEnlazadaGenerica<String> resul=new ListaEnlazadaGenerica<String>();
		String[] fraces={"universal","universidad","inversa","alumno","salida"};
		ListaInvertidaDeGramas lista=new ListaInvertidaDeGramas(2);
		for(int i=0;i<fraces.length;i++)
		{
			lista.agregar(fraces[i]);
		}
		for(int i=0;i<fraces.length;i++)
		{
			resul=lista.recuperarListaDePalabras(fraces[i]);
			System.out.println(" "+fraces[i]);
			for(int p=0;p<resul.tamanio();p++)
			{
				System.out.print(" "+resul.elemento());
				resul.proximo();
			}
			System.out.println();
		}
	}
}
