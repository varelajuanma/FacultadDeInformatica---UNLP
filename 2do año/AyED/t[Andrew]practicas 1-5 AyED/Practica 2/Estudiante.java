/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Estudiante
	{
		private String nombre;
		private String apellido;
		private int comision;
		private String email;
		private String direccion;
		
		public Estudiante(String nom, String ape, int com, String ema, String dir)
		{
			nombre=nom;
			apellido=ape;
			comision=com;
			email=ema;
			direccion=dir;
		}
		public void setname(String nom)
		{
			nombre=nom;
		}
		public String getname()
		{
			return nombre;
		}
		public String getsurname()
		{
			return apellido;
		}
		public int getcom()
		{
			return comision;
		}
		public String getemail()
		{
			return email;
		}
		public String getdir()
		{
			return direccion;
		}
		public String tusDatos()
		{
			return getname()+getsurname()+getcom()+getemail()+getdir();
		}
		public void setape(String ape)
		{
			apellido=ape;
		}
		public void setcom(int com)
		{
			comision=com;
		}
		public void setemail(String ema)
		{
			email=ema;
		}
		public void setdirec(String dir)
		{
			direccion=dir;
		}
	}