package arbolBinario;

import tp03.ejercicio6.*;
import ejericicio8.*;
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
	public boolean esMenor(ArbolBinario<T> a){
		return true;
	}
	
	private boolean esVacio(){
		return this.raiz==null;
	}
	
	private void recorrer (ListaGenerica<T> l,ArbolBinario<T> a){
        if(!a.esVacio()){
            if((!a.getHijoIzquierdo().esVacio())&&(!a.getHijoDerecho().esVacio())){
                recorrer(l,a.getHijoIzquierdo());
                recorrer(l,a.getHijoDerecho());
            }
                 
            else
                l.agregarFinal(a.getDatoRaiz());
                     
        }
    }
     
         
        public ListaGenerica<T> frontera() {
        ListaGenerica<T> resul = new ListaEnlazadaGenerica<T>();
        recorrer(resul, this);
        return (resul);
        }
     
     
     
        private void porNiveles(int[] cant) {
        	ColaGenerica<ArbolBinario<T>> c = new ColaGenerica <ArbolBinario<T>>(); 
        	ArbolBinario<T> a = null; 
        	c.encolar(this); 
        	c.encolar(null); 
        	while(!c.esVacia()) { 
        		a = c.desencolar(); 
        		if(a != null) { 
        			cant[0] = cant[0] + 1;	//cantNodos++
        			if(!a.getHijoIzquierdo().esVacio()) { 
        				c.encolar(a.getHijoIzquierdo()); 
        				
        			} 
        			if(!a.getHijoDerecho().esVacio()) { 
        				c.encolar(a.getHijoDerecho()); 
        			} 

        			} 
        		else 
        			if(!c.esVacia()){ 
        				cant[1] = cant[1] + 1; //cantNiveles++					 
        				c.encolar(null); 
        			} 
        	}
        			
        }
        	
        public boolean lleno() {
        	int[] cant = new int[2];
        	cant[0] = 0; //cantNodos
        	cant[1] = 0; //cantNiveles
        	porNiveles(cant); 
        	System.out.println(cant[0] + " " + cant[1]);
        	return (((Math.pow(2, cant[1]+1)-1)) == cant[0]); 
        }

        private boolean siEsCompleto (ColaGenerica<ArbolBinario<T>> c){
            ArbolBinario<T> a=null;
            boolean completo=true;
            while(!c.esVacio()&&(completo)){
                a=c.desencolar();
                if(a!=null){
                    if(!a.getHijoIzquierdo().esVacio())
                        completo=false;
                    if(!a.getHijoDerecho().esVacio())
                        completo=false;
                }
                                     
            }
            return completo; 
        }
 
        public boolean porNivelesCompleto (){ 
 
            ColaGenerica<ArbolBinario<T>> c=new ColaGenerica <ArbolBinario<T>>(); 
            ArbolBinario<T> a;
            c.encolar(this); 
            c.encolar(null); 
            boolean result=false; 
            boolean completo=true; 
            boolean ultnivel=false; 
            while(!c.esVacio()&&(completo)){ 
                a=c.desencolar(); 
                if(a!=null){
                    if(!ultnivel){
                        if(a.getHijoIzquierdo().esVacio())
                                c.encolar(a.getHijoIzquierdo()); 
                                                         
                        else
                            ultnivel=true;
                     
                        if(a.getHijoDerecho().esVacio()){ 
                            c.encolar(a.getHijoDerecho()); 
                            completo=false;
                        } 
                        else
                            if(!ultnivel)
                                ultnivel=true;
                    } 
                    else
                        result=siEsCompleto(c);
                } 
 
                else
                    if(!c.esVacio()){ 
                        c.encolar(null); 
                } 
             }  
            return result;
        } 
        public boolean completo() { 
             
            return porNivelesCompleto();     
 
        }    
 
}
	
