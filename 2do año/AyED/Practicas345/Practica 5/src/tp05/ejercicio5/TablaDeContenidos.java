package tp05.ejercicio5;
import tp05.ejercicio1.*;
import tp03.ejercicio1.*;
public class TablaDeContenidos {
     
    private ArbolGeneral <Contenido> raiz;
     
    public TablaDeContenidos (ArbolGeneral<Contenido> r){
        this.raiz=r;
    }
    public void agregarSecciones (ListaGenerica<String> l,ArbolGeneral <Contenido> a){
        String s= a.getDatoRaiz().getNombre() + a.getDatoRaiz().getTema() + a.getDatoRaiz().getPagin();
        l.agregarFinal(s);
        ListaGenerica <ArbolGeneral<Contenido>> hijos=a.getHijos();
        l.comenzar();
        while(!l.fin()){
            agregarSecciones(l,hijos.proximo());
        }
    }
     
    public ListaGenerica<String> temasSecciones (String nombre){
        ListaGenerica <ArbolGeneral<Contenido>> hijos=this.raiz.getHijos();
        ListaGenerica <String> l=new ListaEnlazadaGenerica <String>();
        hijos.comenzar();
        boolean ok=false;
        ArbolGeneral <Contenido> a=null;
        while((!hijos.fin())&&(!ok)){
            a=hijos.proximo();
            ok=a.getDatoRaiz().getNombre()== nombre;
        }
        if(ok){
            agregarSecciones(l,a);
        }
        return l;
    }
    
    public  ListaGenerica<String> capitulos(){
    	ListaGenerica<String> l= new ListaEnlazadaGenerica<String>();
    	ListaGenerica <ArbolGeneral<Contenido>> hijos = this.raiz.getHijos();
    	String s= "Capitulo";
    	boolean ok=false;
    	Contenido act=null;
    	Contenido ant=null;
    	hijos.comenzar();
    	if(!hijos.fin()){
    		act=hijos.proximo().getDatoRaiz();
    	}
    	while(!hijos.fin()){
       		
       		if(ok){
       			l.agregarFinal(ant.getNombre() + ant.getPagin() + ant.getTema() + (act.getPagin()-1) );
       			ok=false;
       		}
    		if(act.getNombre().indexOf(s)!= -1){
    			ok=true;
    			ant=act;
    			
    		}
    		act=hijos.proximo().getDatoRaiz();    		
    	}
    	return l;
    } 
    
    public ListaGenerica <Contenido> capitulosMasAnidados(){
    	ListaGenerica <ArbolGeneral<Contenido>> hijos = this.raiz.getHijos();
    	ListaGenerica <Contenido> l = new ListaEnlazadaGenerica <Contenido>();
    	int max=-999;
    	ArbolGeneral<Contenido> hijo;
    	int altura;
    	while(!hijos.fin()){
    		hijo=hijos.proximo();
    		altura=hijo.altura();
    		if(max<altura){
    			max=altura;
    			l=new ListaEnlazadaGenerica<Contenido>();
    			l.agregarFinal(hijo.getDatoRaiz());
    		}
    		else
    			if(max==altura){
    				l.agregarFinal(hijo.getDatoRaiz());
    			}
    	}
    	return l;
    }
    public void recorrerTema (int max, ArbolGeneral<Contenido> tem,ListaGenerica<Contenido> l){
       	ListaGenerica<ArbolGeneral<Contenido>> hijos= tem.getHijos();
    	ArbolGeneral<Contenido> a;
    	int canthijos;
    	while(!hijos.fin()){
    		canthijos=0;
    		a=hijos.proximo();
    		ListaGenerica<ArbolGeneral<Contenido>> subtemas = a.getHijos();
    		while(!subtemas.fin()){
    			canthijos++;
    			subtemas.proximo();
    		}
    		if(max<canthijos){
    			max=canthijos;
    			l= new ListaEnlazadaGenerica<Contenido>();
    			l.agregarFinal(a.getDatoRaiz());
    		}
    		else
    			if(max==canthijos){
    				l.agregarFinal(a.getDatoRaiz());
    			}
    	}
    	
    }
    
    public ListaGenerica <Contenido> masSubTemas(){
    	ListaGenerica<Contenido> l= new ListaEnlazadaGenerica<Contenido>();
    	int max=-999;
    	ListaGenerica<ArbolGeneral<Contenido>> cap= new ListaEnlazadaGenerica<ArbolGeneral<Contenido>>();
    	ArbolGeneral<Contenido> tem;

    	cap= this.raiz.getHijos();
    	while(!cap.fin()){
    		tem=cap.proximo();
    		recorrerTema(max,tem,l);
    	}
    	return l;
    }
}