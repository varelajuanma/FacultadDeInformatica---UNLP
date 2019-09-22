/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio1;
public class ListaDeEnterosEnlazada extends ListaDeEnteros
{
	protected NodoEntero inicio;
	protected NodoEntero actual;
	public ListaDeEnterosEnlazada()
	{
		tamanio=0;
	}
	@Override
	public void comenzar(){actual=inicio;}
	@Override
	public void proximo(){actual=actual.getSiguiente();}
	@Override
	public boolean fin(){return actual==null;}
	@Override
	public int elemento(){return actual.getDato();}
	@Override
	public int elemento(int pos)
	{
		return busco(pos,inicio);
	}
	public int busco(int pos, NodoEntero act)
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
			return 9999;
	}
/*	@Override
	public boolean agregar(int elem)
	{
		NodoEntero act=inicio;
		NodoEntero ant=null;
		while(act!=actual)
		{
			ant=act;
			act=act.getSiguiente();
		}
		NodoEntero e=new NodoEntero();
		e.setDato(elem);
		e.setSiguiente(act);
		if(ant!=null)
			ant.setSiguiente(e);
		else
			inicio=e;
		actual=e;
		tamanio++;
		return true;
	}*/
	@Override
	public boolean agregar(int elem)
	{
		NodoEntero act=inicio;
		NodoEntero ant=null;
		return agregando(act,ant,elem);
	}
	public boolean agregando(NodoEntero act,NodoEntero ant,int elem)
	{
		if(act!=actual)
		{
			ant=act;
			act=act.getSiguiente();
			return agregando(act,ant,elem);
		}
		else
		{
			NodoEntero e=new NodoEntero();
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
/*	@Override
	public boolean agregar(int elem,int pos)
	{
		NodoEntero ini=inicio;
		NodoEntero ant=null;
		NodoEntero e=new NodoEntero();
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
				for(int i=0;i<pos;i++)
				{
					ant=ini;
					ini=ini.getSiguiente();
				}
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
		else
			return false;
	}*/
	@Override
	public boolean agregar(int elem,int pos)
	{
		NodoEntero ini=inicio;
		NodoEntero ant=null;
		NodoEntero e=new NodoEntero();
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
	public boolean agregando(NodoEntero ant,NodoEntero ini,int pos,NodoEntero e)
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
/*	@Override
	public boolean eliminar()
	{
		if(tamanio>0&&actual!=null)
		{
			NodoEntero act=inicio;
			NodoEntero ant=null;
			while(act!=actual)
			{
				ant=act;
				act=act.getSiguiente();
			}
			if(ant!=null)
				ant.setSiguiente(act.getSiguiente());
			else
				inicio=act.getSiguiente();
			tamanio--;
			return true;
		}
		else
			return false;
	}*/
	@Override
	public boolean eliminar()
	{
		if(tamanio>0&&actual!=null)
		{
			NodoEntero act=inicio;
			NodoEntero ant=null;
			return eliminando(ant,act);
		}
		else
			return false;
	}
	public boolean eliminando(NodoEntero ant,NodoEntero act)
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
/*	@Override
	public boolean eliminar(int pos)
	{
		if(tamanio>0&&pos<tamanio)
		{
			NodoEntero act=inicio;
			NodoEntero ant=null;
			while(act!=null&&pos>0)
			{
				pos--;
				ant=act;
				act=act.getSiguiente();
			}
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
		else
			return false;
	}*/
	@Override
	public boolean eliminar(int pos)
	{
		if(tamanio>0&&pos<tamanio)
		{
			NodoEntero act=inicio;
			NodoEntero ant=null;
			return eliminando(ant,act,pos);
		}
		else
			return false;
	}
	public boolean eliminando(NodoEntero ant,NodoEntero act,int pos)
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
	public boolean incluye(int elem)
	{
		return buscar(inicio,elem);
	}
	public boolean buscar(NodoEntero ini,int elem)
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