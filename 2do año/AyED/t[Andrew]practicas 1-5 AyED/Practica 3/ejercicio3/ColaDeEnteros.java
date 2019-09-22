/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio3;

import ejercicio1.ListaDeEnterosEnlazada;

public class ColaDeEnteros 
{
	private ListaDeEnterosEnlazada datos=new ListaDeEnterosEnlazada();
	private int tamanio;
	public ColaDeEnteros()
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
		
		int elem = datos.elemento(tamanio-1);
		boolean d=datos.eliminar(tamanio-1);
		if(d)
		tamanio--;
		return elem;
	}
	public int tope()
	{
		return datos.elemento(tamanio-1);
	}
	public boolean esVacia(){return tamanio==0;}	
}