package ejercicio3;

import tp03.ejercicio1.*;

public class PilaDeEnteros {
	private ListaDeEnterosEnlazada p;

	public PilaDeEnteros(){
	p = new ListaDeEnterosEnlazada();
	}
	
	public boolean apilar(int elem){
		return p.agregarFinal(elem);
	}
	public Integer desapilar (){
		Integer aux;
		aux = p.elemento(p.tamanio());
		p.eliminarEn(p.tamanio());
		return aux;
	}
	
	public Integer tope(){
		return p.elemento(p.tamanio());
	}
	public boolean esVacia(){
		return p.esVacia();
	}
	
	}
