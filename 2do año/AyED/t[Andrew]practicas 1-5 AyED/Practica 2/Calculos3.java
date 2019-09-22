/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Calculos3
{
	private static Calculo c=new Calculo(0,0,0);

	public static void main(String[] ahhh)
	{
		int[] enteros = {1,2,3,2,3,4,3,4,5,3};
		
		calcu(enteros);
		imprimir();
	}
	public static void calcu(int[] ent)
	{
		int max=0;
		int min=ent[0];
		int prom=0;
		for(int i=0;i<ent.length;i++)
		{
			if(max<ent[i])
				max=ent[i];
			if(min>ent[i])
				min=ent[i];
			prom=prom+ent[i];
		}
		prom= prom/ent.length;
		Calculos3.c.setmaximo(max);
		Calculos3.c.setminimo(min);
		Calculos3.c.setpromedio(prom);
	}
	public static void imprimir()
	{
		System.out.println("el maximo "+Calculos3.c.getmaximo());
		System.out.println("el minimo "+Calculos3.c.getminimo());
		System.out.println("el promedio "+Calculos3.c.getpromedio());
	}
}