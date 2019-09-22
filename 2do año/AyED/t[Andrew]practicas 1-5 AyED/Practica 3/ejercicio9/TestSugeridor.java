/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio9;
import ejercicio8.ListaInvertidaDeGramas;
import ejercicio6.ListaEnlazadaGenerica;
public class TestSugeridor
{
	public static void main(String[] ahhh)
	{
		String[] diccionario={"hola","goma","foca","algoritmo","algoritmos",
				"google","monster","java","carma","carne","gomitas","leche",
				"gobierno","masiva","contra","seguridad","honesto","barcas",
				"vivo","norte","obelisco","politicos","trabajo","senadores",
				"senado","nueva","antigua","vieja","tango","siglo","bandas",
				"ladrones","electronico","extrangero","profesores","bancas"};
		ListaInvertidaDeGramas gramas=new ListaInvertidaDeGramas(2);
		Sugeridor doc=new Sugeridor();
		System.out.println("(suponiendo que el usuario escribio: "+diccionario[diccionario.length-1]+" )");
		//este mostrar lo agrego para un mejor entendimiento del programa ^^
		for(int i=0;i<diccionario.length-1;i++)
		{
			gramas.agregar(diccionario[i]);
		}
		ListaEnlazadaGenerica<String> lista=doc.quisoDecir(gramas,diccionario[diccionario.length-1]);
		lista.comenzar();
		System.out.print("tal vez quiso decir: ");
		for(int x=0;x<lista.tamanio();x++)
		{
			System.out.print(lista.elemento()+", ");
			lista.proximo();
		}
	}
}
