/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;
import ejercicio1.*;
public class PilaDeEnteros
{
	private ListaDeEnterosEnlazada datos=new ListaDeEnterosEnlazada();
	private int tamanio;
	public PilaDeEnteros()
	{
		tamanio=0;
	}
	public void poner(int elem)
	{
		datos.agregar(elem,0);
		tamanio++;
	}
	public int sacar()
	{
		int elem=datos.elemento(0);
		datos.eliminar(0);
		tamanio--;
		return elem;
	}
	public int tope()
	{
		return datos.elemento(0);
	}
	public boolean esVacia(){return tamanio==0;}	
}
