package tp05.ejercicio1;

import tp03.ejercicio1.ListaEnlazadaGenerica;
import tp05.util.*;
import tp03.ejercicio1.ListaGenerica;

public class ArbolGeneral<T> {

	private NodoGeneral<T> raiz;

	public ArbolGeneral() {

		this.raiz = null;
	}

	public ArbolGeneral(T dato) {

		this.raiz = new NodoGeneral<T>(dato);

	}

	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> lista) {

		this(dato);
		ListaGenerica<NodoGeneral<T>> hijos = new ListaEnlazadaGenerica<NodoGeneral<T>>();

		lista.comenzar();
		while (!lista.fin()) {
			ArbolGeneral<T> arbolTemp = lista.proximo();
			hijos.agregarFinal(arbolTemp.getRaiz());

		}

		raiz.setListaHijos(hijos);
	}

	private ArbolGeneral(NodoGeneral<T> nodo) {

		this.raiz = nodo;
	}

	private NodoGeneral<T> getRaiz() {

		return this.raiz;
	}

	public T getDatoRaiz() {

		return this.raiz.getDato();
	}

	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		ListaGenerica<ArbolGeneral<T>> lista = new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		ListaGenerica<NodoGeneral<T>> hijos = (ListaGenerica<NodoGeneral<T>>) this.getRaiz().getHijos();
		hijos.comenzar();

		while (!hijos.fin()) {
			lista.agregarFinal(new ArbolGeneral<T>(hijos.proximo()));

		}

		return lista;
	}

	public void agregarHijo(ArbolGeneral<T> unHijo) {

		NodoGeneral<T> hijo = unHijo.getRaiz();
		this.raiz.getHijos().agregarFinal(hijo);
	}

	public void eliminarHijo(ArbolGeneral<T> unHijo) {

		NodoGeneral<T> hijo = unHijo.getRaiz();
		boolean ok = false;

		ListaGenerica<NodoGeneral<T>> listaHijos = (ListaGenerica<NodoGeneral<T>>) this.getRaiz().getHijos();
		listaHijos.comenzar();

		while (!listaHijos.fin() && !ok) {

			NodoGeneral<T> hijoTemp = listaHijos.proximo();
			if (hijoTemp.getDato().equals(hijo.getDato())) {
				ok = listaHijos.eliminar(hijoTemp);

			}
		}

	}

	public boolean esHoja() {
		return this.raiz.getHijos().esVacia();
	}

	public boolean esVacio() {
		return this.raiz==null;

	}
	
	public Integer altura() {
        Integer max=0;
        if(!this.esHoja()){
                 
            ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
            hijos.comenzar();
         
            while(!hijos.fin()){
                ArbolGeneral<T> a = hijos.proximo();
                max=Math.max(max,a.altura())+1;
            }
        }
         
        return max;
}

public Integer nivel (T dato) {
    Integer h=0;
    boolean ok=true;
    if(!this.esHoja()){
        ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
        hijos.comenzar();
     
        while((!hijos.fin())&&(ok)){
            ArbolGeneral<T> a = hijos.proximo();
            if(a.getDatoRaiz()==dato)
                ok=false;
            h=Math.max(h,a.nivel(dato))+1;  
        }
    }
    else
        if(this.getDatoRaiz()==dato)
            ok=false;
     
    return h;
}

	public Integer ancho() {
		ColaGenerica <ArbolGeneral<T>> c = new ColaGenerica<ArbolGeneral<T>>();
		c.encolar(this);
		c.encolar(null);
		ArbolGeneral<T> a;
		Integer cantNodos=0;
		Integer cantMax=-1;
		Integer nivel=0;
		Integer nivelMax=0;
		while(!c.esVacia()){
			a=c.desencolar();
			if(a!=null){
				cantNodos++;
				ListaGenerica<ArbolGeneral<T>> hijos= a.getHijos();
				hijos.comenzar();
				while(!hijos.fin()){
					c.encolar(hijos.proximo());
				}
			}
			else
			{
				if(cantMax<cantNodos){
					cantMax=cantNodos;
					nivelMax=nivel;
					
				}
				if(!c.esVacia()){
					cantNodos=0;
					nivel++;
					c.encolar(null);
				}
			}
		}
		return nivelMax;
	}

}
