/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio5;
import java.lang.Comparable;
public class Contenido implements Comparable<Contenido>
{
	private String nombre;
	private String tema;
	private int pagInic;
	public Contenido()
	{
		nombre="";
		tema="";
		pagInic=0;
	}
	public Contenido(String nom,String tem,int pag)
	{
		nombre=nom;
		tema=tem;
		pagInic=pag;
	}
	public String getNombre()
	{
		return nombre;
	}
	public void setNombre(String nombre)
	{
		this.nombre = nombre;
	}
	public String getTema()
	{
		return tema;
	}
	public void setTema(String tema)
	{
		this.tema = tema;
	}
	public int getPagInic() {
		return pagInic;
	}
	public void setPagInic(int pagInic)
	{
		this.pagInic = pagInic;
	}
	@Override
	public int compareTo(Contenido un)
	{
		if(this.pagInic==un.pagInic)
		{
			if(this.nombre.compareTo(un.nombre)==0)
			{
				if(this.tema.compareTo(un.tema)==0)
				{
					return 0;
				}
			}			
		}		
		return this.nombre.compareTo(un.nombre);
	}	
}
