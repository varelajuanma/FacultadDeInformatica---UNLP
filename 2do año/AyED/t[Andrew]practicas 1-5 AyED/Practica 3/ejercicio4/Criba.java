/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio4;
import java.util.Scanner;
public class Criba
{
	public static void main(String[] ahhh)
	{
		int ma=0;
		System.out.println("ingrese un numero");
		Scanner num=new Scanner(System.in);
		int n=num.nextInt();
		int[] datos=new int[n];
		for(int i=0;i<datos.length;i++)
		{
			datos[i]=i;
		}
		for(int j=2;ma<=(int)Math.sqrt(n);j++)
		{
			if(datos[j]!=0)
			{
				System.out.println(" "+datos[j]);
				ma++;
			}
			for(int i=(j+1);i<datos.length;i++)
			{
				if(datos[i]%j==0)
					datos[i]=0;
			}
		}
		num.close();
	}
}
