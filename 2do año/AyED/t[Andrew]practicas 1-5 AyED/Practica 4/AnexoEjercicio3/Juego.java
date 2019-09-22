/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio3;
import ejercicio2.ArbolBinario;
import ejercicio2.ColaGenerica;
public class Juego
{
	private ArbolBinario<Personaje> personajes;
	public Juego()
	{
		personajes=null;
	}
	public boolean princesaMasCercana()
	{
		ColaGenerica<ArbolBinario<Personaje>> c=new ColaGenerica<ArbolBinario<Personaje>>();
		ArbolBinario<Personaje> per;
		c.poner(personajes);boolean listo=false;
		while(!c.esVacia()&&!listo)
		{
			per=c.sacar();
			if(!per.getDatoRaiz().esDragon()&&!per.getDatoRaiz().esPrincesa())
			{
				if(!per.getHijoIzquierdo().esVacio())					
						c.poner(per.getHijoIzquierdo());					
				if(!per.getHijoDerecho().esVacio())					
						c.poner(per.getHijoDerecho());					
			}
			else
				if(per.getDatoRaiz().esPrincesa())
					listo=true;
		}
		return listo;
	}
	public void setPersonajes(ArbolBinario<Personaje> p)
	{
		personajes=p;
	}
}
