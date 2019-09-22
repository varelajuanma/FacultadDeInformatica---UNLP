package arbolBinario;

import tp03.ejercicio6.ListaEnlazadaGenerica;
import tp03.ejercicio6.ListaGenerica;
import nodoBinario.NodoBinario;

public class ArbolBinario<T> {

	private NodoBinario<T> raiz;
	
	public ArbolBinario(){		
		this.raiz = null;
	}
	
	public ArbolBinario(T dato){		
		this.raiz = new NodoBinario<T>(dato);
	}	
	
	private ArbolBinario(NodoBinario<T> nodo){		
		this.raiz = nodo;
	}
	
	private NodoBinario<T> getRaiz(){		
		return raiz;
	}
	
	public T getDatoRaiz(){
		if (this.getRaiz() != null){
			return this.getRaiz().getDato();
		}else{
			return null;
		}
	}
	
	public ArbolBinario<T> getHijoIzquierdo(){		
		return new ArbolBinario<T>(this.raiz.getHijoIzquierdo());
	}
	
	public ArbolBinario<T> getHijoDerecho(){		
		return new ArbolBinario<T>(this.raiz.getHijoDerecho());
	}	
	
	public void agregarHijoIzquierdo(ArbolBinario<T> hijo){		
		this.raiz.setHijoIzquierdo(hijo.getRaiz());
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo){		
		this.raiz.setHijoDerecho(hijo.getRaiz());
	}	
	
	public void eliminarHijoIzquierdo(){		
		this.raiz.setHijoIzquierdo(null);
	}
	
	public void eliminarHijoDerecho(){		
		this.raiz.setHijoDerecho(null);
	}
	
	public boolean esVacio(){		
		return this.raiz ==null;
	}
	
	public boolean esHoja(){		
		return (this.raiz.getHijoDerecho()==null && this.raiz.getHijoIzquierdo()==null);
	}
	
	public boolean esMenor(ArbolBinario<Integer> arbolBinarioB) {
		// TODO Auto-generated method stub
		return true;
	}
	
	public ListaGenerica<T> frontera() {
		ListaGenerica<T> LF = new ListaEnlazadaGenerica<T>();
		recorrerArbol(raiz, LF);
		return LF;
	}
	
	public void recorrerArbol (NodoBinario<T> r, ListaGenerica<T> l){	
		if (r.getHijoIzquierdo() != null){
			recorrerArbol(r.getHijoIzquierdo(), l);
		}
		else
			if(esHoja())
				l.agregarFinal(r.getDato());
			else
				recorrerArbol(r.getHijoDerecho(), l);		
	}
	
	public boolean lleno() {
		NodoBinario <T> a = this.raiz;
		if (a.getHijoIzquierdo() != null){
			
		}
			
		return true;
	}
	
	public boolean completo() {
		
		return true;

	}	
	
}