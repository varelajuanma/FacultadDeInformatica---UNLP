/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;

public class TestPilaDeEnteros
{
	public static void main(String[] ahhh)
	{
		PilaDeEnteros p1,p2;
		@SuppressWarnings("unused")
		int valor2;
		p1=new PilaDeEnteros();
		p1.poner(1);
		p1.poner(2);
		p2=p1;
		valor2 = p2.sacar();
		System.out.println("el valor del tope de la pila p1 es: "+p1.sacar());
	}
}
