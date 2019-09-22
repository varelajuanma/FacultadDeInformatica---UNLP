/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Calculo
{
	private int maximo;
	private int minimo;
	private int promedio;
	public Calculo(int ma, int mi, int pr)
	{
		maximo=ma;
		minimo=mi;
		promedio=pr;
	}
	public void setmaximo(int ma)
	{
		maximo=ma;
	}
	public void setminimo(int mi)
	{
		minimo=mi;
	}
	public void setpromedio(int pr)
	{
		promedio=pr;
	}
	public int getmaximo()
	{
		return maximo;
	}
	public int getminimo()
	{
		return minimo;
	}
	public int getpromedio()
	{
		return promedio;
	}
}