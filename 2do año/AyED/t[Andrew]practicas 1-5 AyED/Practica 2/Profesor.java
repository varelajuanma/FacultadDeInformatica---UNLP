/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Profesor
{
	private String nombre;
	private String apellido;
	private int edad;
	private String email;
	private String catedra;
	private String titulo;
	private String facultad;
	
	public Profesor(String nom, String ape, int ed, String ema, String cat, String tit, String fac)
	{
		nombre=nom;
		apellido=ape;
		edad=ed;
		email=ema;
		catedra=cat;
		titulo=tit;
		facultad=fac;
	}
	public String getname()
	{
		return nombre;
	}
	public void setname(String nom)
	{
		nombre= nom;
	}
	public String getsurname()
	{
		return apellido;
	}
	public int getedad()
	{
		return edad;
	}
	public String getemail()
	{
		return email;
	}
	public String getcatedra()
	{
		return catedra;
	}
	public String gettitulo()
	{
		return titulo;
	}
	public String getfacultad()
	{
		return facultad;
	}
	public String tusDatos()
	{
		return getname()+getsurname()+getedad()+getemail()+getcatedra()+gettitulo()+getfacultad();
	}
	public void setsurname(String su)
	{
		apellido=su;
	}
	public void setedad(int ed)
	{
		edad=ed;
	}
	public void setemail(String ema)
	{
		email=ema;
	}
	public void setcatedra(String cat)
	{
		catedra=cat;
	}
	public void settitulo(String tit)
	{
		titulo=tit;
	}
	public void setfacultad(String fac)
	{
		facultad=fac;
	}
}