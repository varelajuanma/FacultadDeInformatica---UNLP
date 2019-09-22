package tp05.ejercicio3;
import tp05.ejercicio1.*;
import tp03.ejercicio1.*;
import tp05.util.*;
public class Empresa {
	
	ArbolGeneral<Empleado> raiz;
	
	public Empresa (ArbolGeneral<Empleado> dato){
		this.raiz = dato;
	}
	
	public ListaGenerica<Integer> empleadosPorCategoria(){
		ListaGenerica<Integer> l=new ListaEnlazadaGenerica<Integer>();
		ColaGenerica<ArbolGeneral<Empleado>> c= new ColaGenerica<ArbolGeneral<Empleado>>();
		c.encolar(null);
		c.encolar(this.raiz);
		ArbolGeneral<Empleado> a;
		Integer cantNodos=0;
		while(!c.esVacia()){
			a=c.desencolar();
			if(a!=null){
				cantNodos++;
				ListaGenerica<ArbolGeneral<Empleado>> hijos= a.getHijos();
				hijos.comenzar();
				while(!hijos.fin()){
					c.encolar(hijos.proximo());
				}
				
			}
			else
			{
				l.agregarFinal(cantNodos);
				cantNodos=0;
				if(!c.esVacia()){
					c.encolar(null);
				}
			}
	
		}
		return l;
	}
	public int categoriaConMasEmpleados(){
		ListaGenerica<Integer> l= this.empleadosPorCategoria();
		int max=-1;
		while(!l.fin()){
			Math.max(max,l.proximo());
		}
		return max;
	}
	public int cantidadTotalDeEmpleados(){
		ListaGenerica<Integer> l= this.empleadosPorCategoria();
		int cant=0;
		while(!l.fin()){
			cant+=l.proximo();
		}
		return cant;
	}
	private void reemplazar (ArbolGeneral<Empleado> a){
		int max=-1;
		int pos=0;
		int posmax=0;
		if(a.esHoja()){
			a=null;
		}
		else
		{
			ListaGenerica<ArbolGeneral<Empleado>> hijos= a.getHijos();
			hijos.comenzar();
			while(!hijos.fin()){
				if(max<hijos.proximo().getDatoRaiz().getAntiguedad()){
					max=hijos.proximo().getDatoRaiz().getAntiguedad();
					posmax=pos;
				}
				pos++;
				
			}
		
			hijos.comenzar();
			for(int i=0;i<posmax;i++){
				hijos.proximo();
			}
			ArbolGeneral<Empleado> prom= hijos.proximo();
			this.raiz=new ArbolGeneral<Empleado>(prom.getDatoRaiz(),hijos);
			reemplazar(prom);
		}
	}
	public void reemplazarPresidente (){
		reemplazar(this.raiz);
	}
	
}
