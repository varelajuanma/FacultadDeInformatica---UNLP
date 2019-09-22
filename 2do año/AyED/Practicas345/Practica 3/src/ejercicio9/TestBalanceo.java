package ejercicio9;

import ejericicio8.*;
import ejercicio7.*;
import java.util.Scanner;

public class TestBalanceo {

	public static Character[] arr;
	
	public static void main(String[] args) {
		String s;
		Scanner leer = new Scanner(System.in);
		s=leer.nextLine();
		ListaGenerica<Character> l = cargarString(s);
		inicializarVector();
		if(balanceo(l))
			System.out.println("El string esta balanceado");
		else 
			System.out.println("El string no esta balanceado");
		
	}
	public static ListaGenerica<Character> cargarString (String s){
		ListaGenerica<Character> l = new ListaEnlazadaGenerica<Character>();
		for(int i=0;i<s.length();i++){
			l.agregarFinal(s.charAt(i));
		}
		return l;
	}
	public static void inicializarVector(){
		arr= new Character[6];
		arr[0]='(';
		arr[1]='{';
		arr[2]='[';
		arr[3]=')';
		arr[4]='}';
		arr[5]=']';
	}
	public static boolean balanceo (ListaGenerica<Character> l){
		boolean enc,con=true;
		PilaGenerica<Character> p= new PilaGenerica<Character>();
		int i;
		Character c,c2;
		l.comenzar();
		while((!l.fin())&&(con)){
			enc=false;
			i=0;
			c2=l.proximo();
			while((i<6)&&(!enc)){
				if(c2==arr[i])
					enc=true;
				i++;
			}
			if(i<=3)
			{
				p.apilar(arr[i-1]);
				System.out.print(p.tope());
			}
			else
			{
				c=p.desapilar();
				System.out.print(arr[i-1]);
				if(c!=(arr[i-4]))
					con=false;
			}
				
		}
		return con;
	}
		
}
