/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio1;
public class NodoGeneral<T>
{
	private T dato;
	private ListaGenerica<NodoGeneral<T>> listaHijos;
	NodoGeneral(T dato)
	{
		this.dato = dato;
		listaHijos= new ListaEnlazadaGenerica<NodoGeneral<T>>();
	}
	public T getDato() {
		return dato;
	}
	public void setDato(T dato)
	{
		this.dato = dato;
	}
	public ListaGenerica<NodoGeneral<T>> getListaHijos()
	{
		return listaHijos;
	}
	void setListaHijos(ListaGenerica<NodoGeneral<T>> listaHijos) {
		this.listaHijos = listaHijos;
	}
}