package ejercicio7;

import ejercicio6.*;

public class TestListaEnlazadaGenerica {

	public static void main(String[] args) {
		Mobile n = new SmartPhone();
		n.setCosto(40);
		n.setMarca("Samsung");
		n.setModelo("galaxy");
		n.setSistemaOperativo("Android");
		ListaEnlazadaGenerica<Mobile> l= new ListaEnlazadaGenerica<Mobile>();
		l.agregarFinal(n);
		Mobile n2 = new Tablet();
		n2.setCosto(60);
		n2.setMarca("Ace");
		n2.setModelo("galaxy");
		n2.setSistemaOperativo("Android");
		l.agregarFinal(n2);
		l.comenzar();
		System.out.printf(l.proximo().toString() + l.proximo().toString());	
		
	}

}
