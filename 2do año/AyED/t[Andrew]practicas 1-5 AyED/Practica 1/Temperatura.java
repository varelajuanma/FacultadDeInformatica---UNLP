/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
import java.util.Scanner;
public class Temperatura 
{
	public static void main(String[] ahhh)
	{
		int grados=0;
		System.out.println("ingrese una temperatura (fahrenheit)");
		Scanner n=new Scanner(System.in);
		grados=n.nextInt();
		calcularcelcius(grados);
		n.close();
	}
	public static void calcularcelcius(int g)
	{
		System.out.println(((g-32)*5)/9);
	}
}
