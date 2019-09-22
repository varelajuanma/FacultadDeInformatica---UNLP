/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio4;
import ejercicio2.ArbolBinario;
import ejercicio2.ColaGenerica;
public class TestConversion
{
	public static void main(String[] ahhh)
	{
		ArbolDeExpresion arbol = new ArbolDeExpresion('c');
		arbol=arbol.convertirPostfija("ab+c*de+/");
		ColaGenerica<ArbolBinario<Character>> c=new ColaGenerica<ArbolBinario<Character>>();
		c.poner(arbol);int espacio=50;
		c.poner(new ArbolDeExpresion(null));
		ArbolBinario<Character> temp = null;
		while(!c.esVacia())
		{
			temp=c.sacar();			
			if(temp.getDatoRaiz()==null)
			{
				espacio=espacio-16;				
				if(!c.esVacia())
				{
					c.poner(new ArbolDeExpresion(null));
					System.out.println();
					System.out.println();
				}				
			}
			else
			{
				for(int i=0;i<espacio;i++)
					System.out.print(" ");
				System.out.print("	"+temp.getDatoRaiz()+" ");
			}				
			if(!temp.esHoja(temp))
			{
				if(!temp.getHijoIzquierdo().esVacio())
					c.poner(temp.getHijoIzquierdo());
				if(!temp.getHijoDerecho().esVacio())
					c.poner(temp.getHijoDerecho());
				
			}
			
		}
	}
}
