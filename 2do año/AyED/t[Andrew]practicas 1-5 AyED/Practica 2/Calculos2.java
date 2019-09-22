/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Calculos2
{
	public static void main(String[] ahhh)
	{
		int[] enteros = {1,2,3,2,3,4,3,4,5,3};
		Calculo c=new Calculo(0,0,0);
		calcu(enteros,c);
		imprimir(c);
	}
	public static void calcu(int[] ent, Calculo c)
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
		c.setmaximo(max);
		c.setminimo(min);
		c.setpromedio(prom);
	}
	public static void imprimir(Calculo c)
	{
		System.out.println("el maximo "+c.getmaximo());
		System.out.println("el minimo "+c.getminimo());
		System.out.println("el promedio "+c.getpromedio());
	}
}
