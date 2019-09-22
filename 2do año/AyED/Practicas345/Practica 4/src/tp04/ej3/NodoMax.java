//Ejercicio 3
//Modelizar e implementar en Java la siguiente situaci�n. Considere un �rbol binario no vac�o con dos tipos de
//nodos: nodos MIN y nodos MAX. Cada nodo tiene un valor entero asociado. Se puede definir el valor de un �rbol
//de estas caracter�sticas de la siguiente manera. Si la ra�z es un nodo MIN, entonces el valor del �rbol es igual al
//m�nimo valor entre: (i) El entero almacenado en la ra�z. (ii) El valor correspondiente al sub�rbol izquierdo, si el
//mismo no es vac�o. (iii) El valor correspondiente al sub�rbol derecho, si el mismo no es vac�o. Si la ra�z es un nodo 

package tp04.ej3;

public class NodoMax<T> extends NodoBinario<T>{
	
	private T dato;
	private NodoBinario<T> hijoIzquierdo;
	private NodoBinario<T> hijoDerecho;
	
	public NodoMax(T dato){		
		this.dato = dato;
		this.hijoIzquierdo = null;
		this.hijoDerecho = null;
	}
	
	public T getDato(){		
		return this.dato; 
	}
	
	public NodoBinario<T> getHijoIzquierdo(){		
		return this.hijoIzquierdo;
	}
	
	public NodoBinario<T> getHijoDerecho(){		
		return this.hijoDerecho;
	}	
	
	public void setDato(T dato){		
		this.dato = dato;
	}
	
	public void setHijoIzquierdo(NodoBinario<T> hijoIzq){		
		this.hijoIzquierdo = hijoIzq;
	}
	
	public void setHijoDerecho(NodoBinario<T> hijoDer){		
		this.hijoDerecho = hijoDer;
	}	
	
	public boolean esVacio(){
		return this==null;
	}
	
	public int valor(){
		int valorizq=-999;
		int valorder=-999;
		int raiz=(Integer)dato;
		if((this.getHijoDerecho().esVacio())&&(this.getHijoIzquierdo().esVacio()))
				return raiz;
		if(!this.getHijoIzquierdo().esVacio())
			valorizq=(Integer)this.getHijoIzquierdo().valor();
		if(!this.getHijoDerecho().esVacio())
			valorder= (Integer)this.getHijoDerecho().valor();
		return Math.max(Math.max(valorizq,valorder),raiz);
	}
}