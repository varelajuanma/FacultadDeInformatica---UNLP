/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
import java.util.Scanner;
public class P2e2
{
	public static void main(String[] ahhh)
	{
		int num=0;
		Scanner n=new Scanner(System.in);
		num= n.nextInt();
		crearArreglo(num);
		n.close();
	}
	public static void crearArreglo(int n)
	{
		int[] num=new int[n];int d=0;
		for(int i=0;i<num.length;i++)
		{
			d++;
			num[i]=(n*d);
			System.out.println(num[i]);
		}
	}
}
