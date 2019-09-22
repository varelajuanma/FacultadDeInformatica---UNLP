/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio1;

public class ListaDeEnterosConArreglos extends ListaDeEnteros
{
	private int[] datos = new int[200];
	private int actual=-1;
	public ListaDeEnterosConArreglos()
	{
		tamanio=0;
		for(int i=0;i<datos.length;i++)
			datos[i]=9999;
	}
	@Override
	public void comenzar(){actual=0;}
	@Override
	public void proximo()
	{
		actual++;
	}
	@Override
	public boolean fin(){return actual==tamanio;}
	@Override
	public int elemento(){return datos[actual];}
	@Override
	public int elemento(int pos)
	{
		return datos[pos];
	}
	@Override
	public boolean agregar(int elem)
	{
			tamanio++;
			actual++;
			datos[actual]=elem;
			return true;
	}
	@Override
	public boolean agregar(int elem,int pos)
	{
		if(pos>=0&&pos<=tamanio&&pos<datos.length)
		{
			tamanio++;
			if(datos[pos]==9999)
				datos[pos]=elem;
			else
			{
				for(int i=tamanio;i>=pos;i--)
					datos[i+1]=datos[i];
				datos[pos]=elem;
			}
				
			
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean eliminar()
	{
		if(tamanio>0&&actual<tamanio)
		{
			for(int i=actual;i<tamanio;i++)
				datos[i]=datos[i+1];
			tamanio--;
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean eliminar(int pos)
	{
		if(pos>=0&&pos<tamanio&&pos<datos.length)
		{
			for(int i=pos;i<tamanio;i++)
				datos[i]=datos[i+1];
			datos[tamanio]=0;
			tamanio--;
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean esVacia(){return (tamanio==0);}
	@Override
	public boolean incluye(int elem)
	{
		for(int i=0;i<=tamanio;i++)
			if(datos[i]==elem) 
				return true;
		return false;
	}
	@Override
	public int tamanio(){return tamanio;}
	
}
