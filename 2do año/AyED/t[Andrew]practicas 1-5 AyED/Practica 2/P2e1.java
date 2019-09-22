/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class P2e1 
{
	public static void main(String[] ahhh)
	{
		int a=1;
		int b=4;
		confor(a,b);
		System.out.println();
		conwhile(a,b);
		System.out.println();
		rec(a,b);
		
	}
	public static void confor(int a, int b)
	{
		for (int i=a;i<=b;i++)
			System.out.print(" "+i);
	}
	public static void conwhile(int a, int b)
	{
		while(a<=b)
		{
			System.out.print(" "+a);
			a++;
		}
	}
	public static void rec(int a, int b)
	{
		if(a==b)
			System.out.print(" "+a);
		else
		{
			System.out.print(" "+a);
			a++;
			rec(a,b);
		}
	}
}