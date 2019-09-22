/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio4;
import ejercicio2.ListaEnlazadaGenerica;
public class PilaGenerica<T> extends ListaEnlazadaGenerica<T>
{
	private ListaEnlazadaGenerica<T> datos=new ListaEnlazadaGenerica<T>();
	private int tamanio;
	public PilaGenerica()
	{
		tamanio=0;
	}
	public void poner(T elem)
	{
		datos.agregar(elem,0);
		tamanio++;
	}
	public T sacar()
	{
		T elem=datos.elemento(0);
		datos.eliminar(0);
		tamanio--;
		return elem;
	}
	public T tope()
	{
		return datos.elemento(0);
	}
	public boolean esVacia(){return tamanio==0;}	
}
