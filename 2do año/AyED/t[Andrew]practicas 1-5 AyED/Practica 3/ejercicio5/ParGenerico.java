/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio5;

public class ParGenerico
{
	protected int uno;
	protected int dos;
	public ParGenerico(int u,int d)
	{
		uno=u;
		dos=d;
	}
	@Override
	public boolean equals(Object ouch)
	{
		boolean result=false;
		if(ouch!=null&&ouch instanceof ParGenerico)
		{
			ParGenerico p=(ParGenerico)ouch;
			if(p.getuno()==this.getuno()&&p.getdos()==this.getdos())
				result=true;
		}
		return result;	
	}
	public int getuno(){return uno;}
	public int getdos(){return dos;}
	@Override
	public String toString()
	{
		return "par["+getuno()+","+getdos()+"].";
	}
}
