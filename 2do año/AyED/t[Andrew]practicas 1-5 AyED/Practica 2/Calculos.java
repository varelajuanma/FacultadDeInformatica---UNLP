/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Calculos
{
	public static void main(String[] ahhh)
	{
		int[] enteros = {1,2,3,2,3,4,3,4,5,3};
		Calculo c=new Calculo(0,0,0);
		c=calcu(enteros);
		imprimir(c);
	}
	public static Calculo calcu(int[] ent)
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
		Calculo c=new Calculo(max,min,prom);
		return c;
	}
	public static void imprimir(Calculo c)
	{
		System.out.println("el maximo "+c.getmaximo());
		System.out.println("el minimo "+c.getminimo());
		System.out.println("el promedio "+c.getpromedio());
	}
}
