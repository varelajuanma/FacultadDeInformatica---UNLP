/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio1;

public class NodoEntero 
{
	private int dato;
	private NodoEntero sig;
	
	public NodoEntero()
	{
		dato=0;
	    sig=null;
	}
	public int getDato()
	{return dato;}
	public void setDato(Integer d)
	{dato=d;}
	public NodoEntero getSiguiente()
	{return sig;}
	public void setSiguiente(NodoEntero n)
	{sig=n;}
}
