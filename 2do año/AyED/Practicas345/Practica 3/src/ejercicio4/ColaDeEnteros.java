package ejercicio4;
import tp03.ejercicio1.*;
public class ColaDeEnteros {
	private ListaDeEnterosEnlazada c;
	
	public ColaDeEnteros(){
		c=new ListaDeEnterosEnlazada();
	}
	public boolean encolar(int elem){
		return c.agregarFinal(elem);
	}
	public Integer desencolar (){
		Integer aux= c.elemento(1);
		c.eliminarEn(1);
		return aux;
	}
	public Integer tope(){
		return c.elemento(c.tamanio());
	}
	public boolean esVacio(){
		return c.esVacia();
	}
}
