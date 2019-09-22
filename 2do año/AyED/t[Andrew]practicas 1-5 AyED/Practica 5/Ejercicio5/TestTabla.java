/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio5;

import Ejercicio2.ArbolGeneral;
import Ejercicio2.ListaEnlazadaGenerica;

public class TestTabla
{
	public static void main(String[] ahhh)
	{
		ArbolGeneral<Contenido> a1 = new ArbolGeneral<Contenido>(new Contenido("Contenido 1","listas enlazadas",4));
		ArbolGeneral<Contenido> a2 = new ArbolGeneral<Contenido>(new Contenido("Contenido 2","listas con arreglos",19));
		ArbolGeneral<Contenido> a3 = new ArbolGeneral<Contenido>(new Contenido("Contenido 3","listas de listas",30));
		ListaEnlazadaGenerica<ArbolGeneral<Contenido>> hijos1 = new ListaEnlazadaGenerica<ArbolGeneral<Contenido>>();
		hijos1.agregar(a1,0);
		hijos1.agregar(a2,1);
		hijos1.agregar(a3,2);
		ArbolGeneral<Contenido> cont1 = new ArbolGeneral<Contenido>(new Contenido("Capitulo I","listas",2), hijos1);
		/*-----------------------------------------------------*/
		ArbolGeneral<Contenido> b1 = new ArbolGeneral<Contenido>(new Contenido("Contenido 1","arboles binarios",51));
		ArbolGeneral<Contenido> b2 = new ArbolGeneral<Contenido>(new Contenido("Contenido 2","arboles generales",80));
		
		ListaEnlazadaGenerica<ArbolGeneral<Contenido>> hijos2 = new ListaEnlazadaGenerica<ArbolGeneral<Contenido>>();
		hijos2.agregar(b1,0);
		hijos2.agregar(b2,1);
		
		ArbolGeneral<Contenido> cont2 = new ArbolGeneral<Contenido>(new Contenido("Capitulo II","arboles",50), hijos2);
		/*-----------------------------------------------------*/
		ArbolGeneral<Contenido> c1 = new ArbolGeneral<Contenido>(new Contenido("Contenido 1","metodos",101));
		
		ListaEnlazadaGenerica<ArbolGeneral<Contenido>> hijos3 = new ListaEnlazadaGenerica<ArbolGeneral<Contenido>>();
		hijos3.agregar(c1,0);
		
		ArbolGeneral<Contenido> cont3 = new ArbolGeneral<Contenido>(new Contenido("Apendice A","metodos matematicos",100), hijos3);
		/*-----------------------------------------------------*/
		ListaEnlazadaGenerica<ArbolGeneral<Contenido>> hijos4 = new ListaEnlazadaGenerica<ArbolGeneral<Contenido>>();
		hijos4.agregar(cont1,0);
		hijos4.agregar(cont2,1);
		hijos4.agregar(cont3,2);
		ArbolGeneral<Contenido> cont = new ArbolGeneral<Contenido>(new Contenido("Contenido","Estructura de Datos",1), hijos4);
		
		TablaDeContenidos tab=new TablaDeContenidos(cont);
		
		ListaEnlazadaGenerica<String> nue=new ListaEnlazadaGenerica<String>();
		nue=tab.temasSecciones("Capitulo");
		nue.comenzar();
		while(!nue.fin())
		{
			System.out.print("-"+nue.elemento());
			nue.proximo();
		}
		System.out.println();
		ListaEnlazadaGenerica<Contenido> lis=new ListaEnlazadaGenerica<Contenido>();
		lis=tab.capitulosMasAnidados();
		lis.comenzar();
		while(!lis.fin())
		{
			System.out.print("-"+lis.elemento().getNombre());
			lis.proximo();
		}
		System.out.println();
		ListaEnlazadaGenerica<String> otra=new ListaEnlazadaGenerica<String>();
		otra=tab.masSubtemas();
		otra.comenzar();
		while(!otra.fin())
		{
			System.out.print("-"+otra.elemento());
			otra.proximo();
		}
		System.out.println();
	}
}
