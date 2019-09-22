/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio3;

public class Empleado implements Comparable<Empleado>
{
	private String nombre;
	private int antiguedad;
	private int categoria;
	public Empleado()
	{
		nombre="";
		antiguedad=0;
		categoria=0;
	}
	public Empleado(String nom,int ant,int cat)
	{
		nombre=nom;
		antiguedad=ant;
		categoria=cat;
	}
	public String getNombre() {return nombre;}
	public void setNombre(String nombre) {this.nombre = nombre;}
	public int getAntiguedad() {return antiguedad;}
	public void setAntiguedad(int antiguedad) {this.antiguedad = antiguedad;}
	public int getCategoria() {return categoria;}
	public void setCategoria(int categoria) {this.categoria = categoria;}
	@Override
	public int compareTo(Empleado un)
	{
		if(this.nombre.hashCode()==un.nombre.hashCode())
		   if(this.antiguedad==un.antiguedad&&this.categoria==un.categoria)
			return 0;
		   else
			   return this.nombre.compareTo(un.nombre);
		else
			return this.nombre.compareTo(un.nombre);
	}
}
