package ejercicio7;

public class NodoGenerico<T> {
	private T dato;
	private NodoGenerico<T> sig;
	
	public NodoGenerico(){
	}
	public T getDato(){
		return this.dato;
	}
	public void setDato(T d){
		this.dato=d;
	}
	public NodoGenerico<T> getSiguiente(){
		return sig;
	}
	public void setSiguiente(NodoGenerico<T> d){
		this.sig=d;
	}
}
