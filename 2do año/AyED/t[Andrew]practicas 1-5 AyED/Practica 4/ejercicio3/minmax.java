/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio3;

public class minmax
{
	protected boolean tipo;
	private int valor;
	public minmax(int v,boolean t)
	{
		tipo=t;
		setValor(v);
	}
	public int getValor() {
		return valor;
	}
	public void setValor(int valor)
	{
		this.valor = valor;
	}
	public boolean getTipo()
	{
		return tipo;
	}
	public void setTipo(boolean tipo)
	{
		this.tipo = tipo;
	}
}
