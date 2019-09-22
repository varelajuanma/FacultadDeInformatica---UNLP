/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package AnexoEjercicio4;

public class TestArbolGuiado
{
	public static void main(String[] ahhh)
	{
		ArbolGuiado arbol=new ArbolGuiado(20);
		arbol.agregarHijoIzquierdo(new ArbolGuiado(7));
		arbol.agregarHijoDerecho(new ArbolGuiado(4));
		arbol.getHijoDerecho().agregarHijoIzquierdo(new ArbolGuiado(3));
		arbol.getHijoDerecho().agregarHijoDerecho(new ArbolGuiado(8));
		arbol.getHijoDerecho().getHijoIzquierdo().agregarHijoDerecho(new ArbolGuiado(1));
		arbol.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolGuiado(9));
		arbol.getHijoIzquierdo().agregarHijoDerecho(new ArbolGuiado(6));
		arbol.getHijoIzquierdo().getHijoIzquierdo().agregarHijoIzquierdo(new ArbolGuiado(6));
		arbol.getHijoIzquierdo().getHijoDerecho().agregarHijoIzquierdo(new ArbolGuiado(1));
		arbol.recorridoGuiado();
	}
}
