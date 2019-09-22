package ejericicio8;

import ejercicio7.*;

public class PilaGenerica<T> extends ListaEnlazadaGenerica<T> {
	
	ListaGenerica<T> p;

	public PilaGenerica (){
		p= new ListaEnlazadaGenerica<T>();
	}
	public void apilar (T dato){
		p.agregarFinal(dato);
	}
	public T desapilar(){
		T dato;
		dato=p.elemento(p.tamanio());
		p.eliminarEn(p.tamanio());
		return dato;
		
	}
	public T tope(){
		return p.elemento(p.tamanio());
	}
	public boolean esVacio(){
		return p.esVacia();
	}
	
}
