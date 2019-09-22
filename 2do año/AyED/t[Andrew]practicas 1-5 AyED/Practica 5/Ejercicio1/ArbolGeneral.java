/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio1;

public class ArbolGeneral<T>
{
	private NodoGeneral<T> raiz;
	public ArbolGeneral(T dato) 
	{
		raiz = new NodoGeneral<T>(dato);
	}
	public ArbolGeneral()
	{
		raiz=null;
	}
	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos)
	{
		this(dato);
		ListaGenerica<NodoGeneral<T>> newLista =
				new ListaEnlazadaGenerica<NodoGeneral<T>>();
		hijos.comenzar();
		while (!hijos.fin()) {
			ArbolGeneral<T> arbolTemp = hijos.elemento();
			newLista.agregar(arbolTemp.getRaiz());
			hijos.proximo();
		}
		raiz.setListaHijos(newLista);
	}
	private ArbolGeneral(NodoGeneral<T> nodo)
	{
		raiz = nodo;
	}
	public T getDatoRaiz()
	{
		return raiz.getDato();
	}
	private NodoGeneral<T> getRaiz()
	{
		return raiz;
	}
	public ListaEnlazadaGenerica<ArbolGeneral<T>> getHijos()
	{
		ListaEnlazadaGenerica<ArbolGeneral<T>> nue =new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		raiz.getListaHijos().comenzar();
		for(int i=0;i<raiz.getListaHijos().tamanio();i++)
		{
			nue.agregar(new ArbolGeneral<T>(raiz.getListaHijos().elemento()));
			raiz.getListaHijos().proximo();
		}
		return nue;
	}
	public void agregarHijo(ArbolGeneral<T> nue)
	{
		raiz.getListaHijos().agregar(nue.getRaiz());
	}
	public void eliminarHijo(ArbolGeneral<T> temp)
	{
		ListaEnlazadaGenerica<NodoGeneral<T>> lis=(ListaEnlazadaGenerica<NodoGeneral<T>>) raiz.getListaHijos();
		lis.comenzar();
		while(!lis.fin())
		{
			if(lis.elemento().getDato().toString().compareTo(temp.getDatoRaiz().toString())==0)
				lis.eliminar();
			lis.proximo();
		}
	}
}
