package ejericicio8;

import ejercicio7.*;

public class ColaGenerica<T> extends ListaEnlazadaGenerica<T>{
	
	ListaGenerica<T> c;

	public ColaGenerica (){
		c= new ListaEnlazadaGenerica<T>();
	}
	public void encolar (T dato){
		c.agregarFinal(dato);
	}
	public T desencolar(){
		T dato;
		dato=c.elemento(1);
		c.eliminarEn(1);
		return dato;
		
	}
	public T tope(){
		return c.elemento(c.tamanio());
	}
	public boolean esVacio(){
		return c.esVacia();
	}
	
}
