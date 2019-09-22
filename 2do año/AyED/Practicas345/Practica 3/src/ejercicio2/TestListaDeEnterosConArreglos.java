package ejercicio2;

import tp03.ejercicio1.*;
import java.util.Scanner;

public class TestListaDeEnterosConArreglos {

	public static void main(String[] args) {
		ListaDeEnterosConArreglos l= new ListaDeEnterosConArreglos();
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
