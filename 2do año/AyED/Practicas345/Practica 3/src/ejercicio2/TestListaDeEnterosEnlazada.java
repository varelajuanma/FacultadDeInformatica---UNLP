package ejercicio2;

import tp03.ejercicio1.*;
import java.util.Scanner;

public class TestListaDeEnterosEnlazada {

	public static void main(String[] args) {
		ListaDeEnterosEnlazada l= new ListaDeEnterosEnlazada();
		Scanner s= new Scanner(System.in);
		int i= s.nextInt();
		while (i!=0){
			l.agregarInicio(i);
			i=s.nextInt();
		}
		while (!(l.fin())){
			System.out.println(l.proximo());
		}
		
	}

}