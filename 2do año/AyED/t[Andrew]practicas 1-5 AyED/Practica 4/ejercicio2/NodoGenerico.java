/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;

public class NodoGenerico<T> 
{
	private T dato;
	private NodoGenerico<T> siguiente;
	public T getDato(){return dato;}
	public void setDato(T elem){dato=elem;}
	public void setSiguiente(NodoGenerico<T> sig){siguiente=sig;}
	public NodoGenerico<T> getSiguiente(){return siguiente;}
}