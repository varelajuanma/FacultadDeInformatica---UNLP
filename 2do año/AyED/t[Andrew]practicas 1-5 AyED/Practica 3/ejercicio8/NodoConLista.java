/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio8;

import ejercicio6.ListaEnlazadaGenerica;

public class NodoConLista 
{
	private String dato;
	public ListaEnlazadaGenerica<String> grupo=new ListaEnlazadaGenerica<String>();
	private NodoConLista siguiente;
	public NodoConLista()
	{
		dato="";
		siguiente=null;
	}
	public String getDato(){return dato;}
	public void setDato(String elem){dato=elem;}
	public void setSiguiente(NodoConLista sig){siguiente=sig;}
	public NodoConLista getSiguiente(){return siguiente;}
}