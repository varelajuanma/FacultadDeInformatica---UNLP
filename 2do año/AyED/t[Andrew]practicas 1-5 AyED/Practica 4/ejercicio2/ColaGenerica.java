/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;

public class ColaGenerica<T> 
{
	private ListaEnlazadaGenerica<T> datos=new ListaEnlazadaGenerica<T>();
	private int tamanio;
	public ColaGenerica()
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
		
		T elem = datos.elemento(tamanio-1);
		boolean d=datos.eliminar(tamanio-1);
		if(d)
		tamanio--;
		return elem;
	}
	public T tope()
	{
		return datos.elemento(tamanio-1);
	}
	public boolean esVacia(){return tamanio==0;}
	public int tamanio(){return tamanio;}
}