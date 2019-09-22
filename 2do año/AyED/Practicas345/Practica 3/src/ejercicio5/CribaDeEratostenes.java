package ejercicio5;

import tp03.ejercicio1.*;

public class CribaDeEratostenes {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ListaDeEnterosEnlazada l;
		l=new ListaDeEnterosEnlazada();
		int n=1000;
		for (int i=1;i<=n;i++){
			l.agregarFinal(i);
		}
		l.comenzar();
		CribaDeEratostenes p = new CribaDeEratostenes();
	    p.obtenerPrimos(l,n);
		l.comenzar();
		for (int i=l.tamanio();i>1;i--){
			System.out.println(l.proximo());
		}
	}
	public void tacharMultiplos (ListaDeEnterosEnlazada l, int elem){
		int i=2;
		while ((i*elem)<=1000){			
			l.eliminar(i*elem);
			++i;
		}
	}
	public void obtenerPrimos (ListaDeEnterosEnlazada l,int n){
		double raiz = Math.sqrt(n);
		l.proximo();
		int actual;
		do{
			actual=l.proximo();
			tacharMultiplos(l,actual);
		}while(actual<raiz);
	}
}
