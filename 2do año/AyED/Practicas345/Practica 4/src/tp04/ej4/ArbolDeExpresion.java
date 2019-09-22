package tp04.ej4;
import arbolBinario.*;
import ejericicio8.*;

public class ArbolDeExpresion<T> extends ArbolBinario<T> {
	
	public ArbolDeExpresion(){
		super();
	}
	
	public ArbolDeExpresion(T dato) {
		super(dato);
	}
	
	public ArbolDeExpresion<Character> convertirPosFija (String exp){
		ArbolDeExpresion<Character> a;
		char c;
		PilaGenerica<ArbolDeExpresion<Character>> p= new PilaGenerica<ArbolDeExpresion<Character>>();
		for (int i=0;i<exp.length();i++){
			c=exp.charAt(i);
			a=new ArbolDeExpresion<Character>(c);
			if((c=='/')||(c=='*')||(c=='+')||(c=='-')){//Es un operando
				a.agregarHijoDerecho(p.desapilar());
				a.agregarHijoIzquierdo(p.desapilar());
			}
			p.apilar(a);
		}
		return p.desapilar();
	}
	
	
	
}
