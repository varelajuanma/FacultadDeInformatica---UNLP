/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;

public class ListaEnlazadaGenerica<T> extends ListaGenerica<T>
{
	private NodoGenerico<T> inicio;
	private NodoGenerico<T> actual;
	public ListaEnlazadaGenerica()
	{
		tamanio=0;
	}
	@Override
	public void comenzar(){actual = inicio;}
	@Override
	public T elemento(){return actual.getDato();}
	@Override
	public void proximo(){actual=actual.getSiguiente();}
	@Override
	public boolean fin(){return actual==null;}
	@Override
	public T elemento(int pos)
	{
		return busco(pos,inicio);
	}
	public T busco(int pos, NodoGenerico<T> act)
	{
		if(act!=null)
		{
			if(pos==0)
				return act.getDato();
			else
			{
				pos--;
				return busco(pos,act.getSiguiente());
			}
		}
		else
			return null;
	}
	@Override
	public boolean agregar(T elem)
	{
		NodoGenerico<T> act=inicio;
		NodoGenerico<T> ant=null;
		return agregando(act,ant,elem);
	}
	public boolean agregando(NodoGenerico<T> act,NodoGenerico<T> ant,T elem)
	{
		if(act!=actual)
		{
			ant=act;
			act=act.getSiguiente();
			return agregando(act,ant,elem);
		}
		else
		{
			NodoGenerico<T> e=new NodoGenerico<T>();
			e.setDato(elem);
			e.setSiguiente(act);
			if(ant!=null)
				ant.setSiguiente(e);
			else
				inicio=e;
			actual=e;
			tamanio++;
			return true;
		}
	}
	@Override
	public boolean agregar(T elem, int pos)
	{
		NodoGenerico<T> ini=inicio;
		NodoGenerico<T> ant=null;
		NodoGenerico<T> e=new NodoGenerico<T>();
		e.setDato(elem);
		if(pos>=0&&pos<=tamanio)
		{
			if(ini==null)
			{
				actual=inicio=e;
				tamanio++;
				return true;
			}
			else
			{
				return agregando(ant,ini,pos,e);
			}
		}
		else
			return false;
	}
	public boolean agregando(NodoGenerico<T> ant,NodoGenerico<T> ini,int pos,NodoGenerico<T> e)
	{
		if(pos>0)
		{
			pos--;
			ant=ini;
			ini=ini.getSiguiente();
			return agregando(ant,ini,pos,e);
		}
		else
		{
			if(ant==null)
			{
				e.setSiguiente(inicio);
				actual=inicio=e;
				tamanio++;
				return true;
			}
			else
			{
				e.setSiguiente(ini);
				ant.setSiguiente(e);
				actual=e;
				tamanio++;
				return true;
			}
		}
	}
	@Override
	public boolean eliminar()
	{
		if(tamanio>0&&actual!=null)
		{
			NodoGenerico<T> act=inicio;
			NodoGenerico<T> ant=null;
			return eliminando(ant,act);
		}
		else
			return false;
	}
	public boolean eliminando(NodoGenerico<T> ant,NodoGenerico<T> act)
	{
		if(act!=actual)
		{
			ant=act;
			act=act.getSiguiente();
			return eliminando(ant,act);
		}
		else
		{
			if(ant!=null)
				ant.setSiguiente(act.getSiguiente());
			else
				inicio=act.getSiguiente();
			tamanio--;
			return true;
		}
	}
	@Override
	public boolean eliminar(int pos)
	{
		if(tamanio>0&&pos<tamanio)
		{
			NodoGenerico<T> act=inicio;
			NodoGenerico<T> ant=null;
			return eliminando(ant,act,pos);
		}
		else
			return false;
	}
	public boolean eliminando(NodoGenerico<T> ant,NodoGenerico<T> act,int pos)
	{
		if(act!=null&&pos>0)
		{
			pos--;
			ant=act;
			act=act.getSiguiente();
			return eliminando(ant,act,pos);
		}
		else
		{
			if(pos == 0)
			{
				if(ant!=null)
					ant.setSiguiente(act.getSiguiente());
				else
					inicio=act.getSiguiente();
				tamanio--;
				return true;
			}
			else
				return false;
		}
	}
	@Override
	public boolean esVacia(){return inicio==null;}
	@Override
	public boolean incluye(T elem)
	{
		return buscar(inicio,elem);
	}
	public boolean buscar(NodoGenerico<T> ini,T elem)
	{
		if(ini!=null)
		{
			if(ini.getDato()==elem)
				return true;
			else
				return buscar(ini.getSiguiente(),elem);
		}
		else
			return false;
	}
	@Override
	public int tamanio(){return tamanio;}
}