
package Ejercicio2;

public class ArbolGeneral<T extends Comparable<T>> 
{
	private NodoGeneral<T> raiz;
	public ArbolGeneral(T dato) 
	{
		raiz = new NodoGeneral<T>(dato);
	}
	public ArbolGeneral()
	{
		raiz=new NodoGeneral<T>(null);
	}
	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos)
	{
		this(dato);
		ListaGenerica<NodoGeneral<T>> newLista =new ListaEnlazadaGenerica<NodoGeneral<T>>();
		hijos.comenzar();
		while (!hijos.fin()) {
			ArbolGeneral<T> arbolTemp = hijos.elemento();
			newLista.agregar(arbolTemp.getRaiz());
			hijos.proximo();
		}
		raiz.setListaHijos(newLista);
	}
	private ArbolGeneral(NodoGeneral<T> nodo)
	{
		raiz = nodo;
	}
	public T getDatoRaiz()
	{
		return raiz.getDato();
	}
	public void setDatoRaiz(T e)
	{
		raiz.setDato(e);
	}
	private NodoGeneral<T> getRaiz()
	{
		return raiz;
	}
	public ListaEnlazadaGenerica<ArbolGeneral<T>> getHijos()
	{
		ListaEnlazadaGenerica<ArbolGeneral<T>> nue =new ListaEnlazadaGenerica<ArbolGeneral<T>>();
		raiz.getListaHijos().comenzar();
		for(int i=0;i<raiz.getListaHijos().tamanio();i++)
		{
			nue.agregar(new ArbolGeneral<T>(raiz.getListaHijos().elemento()));
			raiz.getListaHijos().proximo();
		}
		return nue;
	}
	public void agregarHijo(ArbolGeneral<T> nue)
	{
		raiz.getListaHijos().agregar(nue.getRaiz());
	}
	public void eliminarHijo(ArbolGeneral<T> temp)
	{
		ListaEnlazadaGenerica<NodoGeneral<T>> lis=(ListaEnlazadaGenerica<NodoGeneral<T>>) raiz.getListaHijos();
		lis.comenzar();
		while(!lis.fin())
		{
			if(lis.elemento().getDato().toString().compareTo(temp.getDatoRaiz().toString())==0)
				lis.eliminar();
			lis.proximo();
		}
	}
	public boolean esVacio()
	{
		return raiz.getDato()==null;
	}
	public boolean esHoja()
	{
		return raiz.getListaHijos().esVacia();
	}
	public int altura()
	{
		ColaGenerica<ArbolGeneral<T>> c = new ColaGenerica<ArbolGeneral<T>>();
		c.poner(this);int Altura=0;
		c.poner(new ArbolGeneral<T>());
		ArbolGeneral<T> temp;
		while(!c.esVacia())
		{
			temp=c.sacar();
			if(temp.esVacio())
			{
				if(!c.esVacia())
				{
					c.poner(new ArbolGeneral<T>());
					Altura++;
				}
			}
			else
			{
				ListaEnlazadaGenerica<ArbolGeneral<T>> lista=temp.getHijos();
				lista.comenzar();
				for(int i=0;i<lista.tamanio();i++)
				{
					c.poner(lista.elemento());
					lista.proximo();
				}
			}
		}
		return Altura;
	}
	public boolean equals(ArbolGeneral<T> ouch)
	{
		boolean result=false;
		if(ouch!=null&&ouch instanceof ArbolGeneral)
		{
			ArbolGeneral<T> p=ouch;
			if(p.getDatoRaiz().compareTo(this.getDatoRaiz())==0)
				result=true;
		}
		return result;	
	}
	public int nivel(T dato)
	{
		ColaGenerica<ArbolGeneral<T>> c = new ColaGenerica<ArbolGeneral<T>>();
		c.poner(this);int nivel=0;
		c.poner(new ArbolGeneral<T>());
		ArbolGeneral<T> temp;
		while(!c.esVacia())
		{
			temp=c.sacar();
			
			if(temp.esVacio())
			{
				if(!c.esVacia())
				{
					c.poner(new ArbolGeneral<T>());
					nivel++;
				}
			}
			else
			{
				if(temp.equals(new ArbolGeneral<T>(dato)))
					return nivel;

				ListaEnlazadaGenerica<ArbolGeneral<T>> lista=temp.getHijos();
				lista.comenzar();
				for(int i=0;i<lista.tamanio();i++)
				{
					c.poner(lista.elemento());
					lista.proximo();
				}
			}
		}
		return -1;
	}
	public int ancho()
	{
		ColaGenerica<ArbolGeneral<T>> c = new ColaGenerica<ArbolGeneral<T>>();
		c.poner(this);int ancho=0;		
		ArbolGeneral<T> temp;
		while(!c.esVacia())
		{
			temp=c.sacar();
			if(!temp.esVacio())
			{
				if(ancho<temp.getHijos().tamanio())
					ancho=temp.getHijos().tamanio();
				ListaEnlazadaGenerica<ArbolGeneral<T>> lista=temp.getHijos();
				lista.comenzar();
				for(int i=0;i<lista.tamanio();i++)
				{
					c.poner(lista.elemento());
					lista.proximo();
				}
			}
		}
		return ancho;
	}
}
