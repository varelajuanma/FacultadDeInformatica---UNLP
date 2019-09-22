package ejercicio2;
import arbolBinario.*;
import tp03.ejercicio6.*;
 
public class TestArbol {
 
        public static void main(String[] args) {
         
            ArbolBinario<Integer> a=new ArbolBinario<Integer>(5);
             
            ArbolBinario<Integer> hijoIzq= new ArbolBinario<Integer>(7);
            hijoIzq.agregarHijoIzquierdo(new ArbolBinario<Integer>(8));
             
            ArbolBinario<Integer> hijoDer =new ArbolBinario<Integer>(10);
             
            a.agregarHijoIzquierdo(hijoIzq);
            a.agregarHijoDerecho(hijoDer);
            ListaGenerica <Integer> l= a.frontera();
            l.comenzar();
            System.out.println(l.proximo() +""+ l.proximo());
            if(a.lleno())
                System.out.println("es lleno");
        }          
 
}