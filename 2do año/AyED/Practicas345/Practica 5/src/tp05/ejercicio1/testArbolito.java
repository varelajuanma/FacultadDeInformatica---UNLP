package tp05.ejercicio1;
import tp03.ejercicio1.*;
public class testArbolito {

	public static void main(String[] args) {
		
	 
		ArbolGeneral<Integer> a2= new ArbolGeneral<Integer>(2); 
		ArbolGeneral<Integer> a4= new ArbolGeneral<Integer>(0); 
		ArbolGeneral<Integer> a5= new ArbolGeneral<Integer>(6); 
		ArbolGeneral<Integer> a6= new ArbolGeneral<Integer>(7); 
		ArbolGeneral<Integer> a7= new ArbolGeneral<Integer>(8); 
		ArbolGeneral<Integer> a8= new ArbolGeneral<Integer>(9); 
		ArbolGeneral<Integer> a9= new ArbolGeneral<Integer>(10); 
		ListaGenerica<ArbolGeneral<Integer>> hijos2= new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos2.agregarFinal(a5);
		hijos2.agregarFinal(a6);
		hijos2.agregarFinal(a7);
		ArbolGeneral<Integer> a1= new ArbolGeneral<Integer>(3,hijos2);
		ListaGenerica<ArbolGeneral<Integer>> hijos3= new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos3.agregarFinal(a9);
		ArbolGeneral<Integer> a3= new ArbolGeneral<Integer>(1,hijos3);
		ListaGenerica<ArbolGeneral<Integer>> hijos= new ListaEnlazadaGenerica<ArbolGeneral<Integer>>();
		hijos.agregarFinal(a1);
		hijos.agregarFinal(a2);
		hijos.agregarFinal(a3);
		hijos.agregarFinal(a4);
		hijos.agregarFinal(a8);
		ArbolGeneral<Integer> r= new ArbolGeneral<Integer>(5,hijos); 
		System.out.println(r.ancho());
		
	}

}
