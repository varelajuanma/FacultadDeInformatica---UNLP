/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio4;
import ejercicio2.ArbolBinario;
public class ArbolDeExpresion extends ArbolBinario<Character>
{
	public ArbolDeExpresion(Character dato)
	{
		super(dato);
	}
	public ArbolDeExpresion convertirPostfija(String exp)
	{
		ArbolDeExpresion result;Character c;
		PilaGenerica<ArbolDeExpresion> q = new PilaGenerica<ArbolDeExpresion>();
		for (int i = 0; i < exp.length(); i++)
		{
			c =exp.charAt(i);
			result = new ArbolDeExpresion(c);
			if ("+-*/".indexOf(c)>=0)
			{
				result.agregarHijoDerecho(q.sacar());
				result.agregarHijoIzquierdo(q.sacar());
			}
			q.poner(result);
		}
		return (q.sacar());
	}
}
