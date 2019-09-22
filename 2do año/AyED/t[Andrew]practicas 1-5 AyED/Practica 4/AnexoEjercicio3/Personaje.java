/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio3;

public class Personaje
{
	private String nombre;
	public Personaje(String tipo)
	{
		nombre=tipo;
	}
	public boolean esDragon()
	{
		return nombre=="Dragon";
	}
	public boolean esPrincesa()
	{
		return nombre=="Princesa";
	}
}
