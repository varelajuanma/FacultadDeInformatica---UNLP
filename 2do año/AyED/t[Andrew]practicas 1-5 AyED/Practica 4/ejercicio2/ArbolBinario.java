/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio2;

public class ArbolBinario<T>
{
//	public ListaEnlazadaGenerica<T> lista=new ListaEnlazadaGenerica<T>();//para la otra solucion
	private NodoBinario<T> raiz;
	public ArbolBinario()
	{
		this.raiz = null;
	}
	public ArbolBinario(T dato)
	{
		this.raiz = new NodoBinario<T>(dato);
	}
	private ArbolBinario(NodoBinario<T> nodo)
	{
		this.raiz = nodo;
	}
	private NodoBinario<T> getRaiz()
	{
		return this.raiz;
	}
	public T getDatoRaiz()
	{
		return (this.raiz==null)? null:this.raiz.getDato();
	}
	public void setDatoRaiz(T num)
	{
		raiz.setDato(num);
	}
	public ArbolBinario<T> getHijoIzquierdo()
	{
		return new ArbolBinario<T>(this.raiz.getHijoIzquierdo());
	}
	public ArbolBinario<T> getHijoDerecho()
	{
		return new ArbolBinario<T>(this.raiz.getHijoDerecho());
	}
	public void agregarHijoIzquierdo(ArbolBinario<T> hijo)
	{
		this.raiz.setHijoIzquierdo(hijo.getRaiz());
	}
	public void agregarHijoDerecho(ArbolBinario<T> hijo)
	{
		this.raiz.setHijoDerecho(hijo.getRaiz());
	}
	public void eliminarHijoIzquierdo()
	{
		this.raiz.setHijoIzquierdo(null);
	}
	public void eliminarHijoDerecho()
	{
		this.raiz.setHijoDerecho(null);
	}
	public boolean esVacio()
	{
		return this.getRaiz()==null;
	}
	public boolean esHoja()
	{
			return (this.getHijoIzquierdo().esVacio()&&this.getHijoDerecho().esVacio());				 
	}
	public boolean esHoja(ArbolBinario<T> Nodo)
	{
	return Nodo.esHoja();
	}
	public ListaEnlazadaGenerica<T> frontera(ListaEnlazadaGenerica<T> lista)
	{
		
		return enlistando(lista, this);
	}
	public ListaEnlazadaGenerica<T> enlistando(ListaEnlazadaGenerica<T> lista,ArbolBinario<T> NodoR)
	{
		
		if(!NodoR.esVacio())
		{
			if(NodoR.esHoja())
				lista.agregar(NodoR.getDatoRaiz());
			else
			{
				enlistando(lista,NodoR.getHijoIzquierdo());
				enlistando(lista,NodoR.getHijoDerecho());
			}
		}
		return lista;
	}
/*	public ListaGenerica<T> frontera()//la otra solucion
	{
		Cola<T> q = new Cola<T>();
 		ArbolBinario<T> arbol=new ArbolBinario<T>(raiz);
      	q.encolar(arbol);
 		while (!q.esVacia())
 		{
        	arbol = q.desencolar(); 
	  		if(arbol.getHijoDerecho()==null&&arbol.getHijoIzquierdo()==null)
	  			lista.agregar(arbol.getDatoRaiz());
        	if (arbol.getHijoIzquierdo()!=null)
            	q.encolar(arbol.getHijoIzquierdo()); 
 	  		if (arbol.getHijoDerecho()!=null)
            	q.encolar(arbol.getHijoDerecho()); 
  	 	}

		return lista;
	}*/
	public boolean esMenor(ArbolBinario<T> unArbol)
	{
		if(!unArbol.esVacio())
		{
			if(!this.esVacio())
			{
				int comp=(this.getDatoRaiz().hashCode() - unArbol.getDatoRaiz().hashCode());
				if(comp<0)
					return true;
				else
					if(comp==0)
					{
						ArbolBinario<T> thisIZ=this.getHijoIzquierdo();
						ArbolBinario<T> otroIZ=unArbol.getHijoIzquierdo();
						if(thisIZ.esVacio())
							return !(otroIZ.esVacio());
						else
						{
							if(thisIZ.esMenor(otroIZ))
								return true;
							else
								if(thisIZ.equals(otroIZ))
									return this.getHijoDerecho().esMenor(unArbol.getHijoDerecho());
								else return false;
						}
					}
					else return false;
			}
			else return false;
		}
		else return false;
	}
	public boolean equals(ArbolBinario<T> otro)
	{
		boolean result=false;
		if(!otro.esVacio()&&otro instanceof ArbolBinario)
		{
			result=true;
			ColaGenerica<ArbolBinario<T>> uno=new ColaGenerica<ArbolBinario<T>>();
			ColaGenerica<ArbolBinario<T>> dos=new ColaGenerica<ArbolBinario<T>>();
			uno.poner(this);
			dos.poner(otro);
			
			ArbolBinario<T> ArbolUno,ArbolDos;
			while(result&&!uno.esVacia()&&!dos.esVacia())
			{
				ArbolUno=uno.sacar();
				ArbolDos=dos.sacar();
				if(ArbolUno.esVacio())
					result=(ArbolDos.esVacio());
				else
					if(!ArbolDos.esVacio())
						if(ArbolUno.getDatoRaiz().hashCode()==ArbolDos.getDatoRaiz().hashCode())
						{
							uno.poner(ArbolUno.getHijoIzquierdo());
							uno.poner(ArbolUno.getHijoDerecho());
							dos.poner(ArbolDos.getHijoIzquierdo());
							dos.poner(ArbolDos.getHijoDerecho());
						}
						else
							result=false;
					else
						result=false;
			}
			result=(result&&(uno.esVacia()==dos.esVacia()));
		}
		return result;	
	}
	public boolean lleno()
	{
		int cant=1;int tupla=1;
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();
 		ArbolBinario<T> arbol=null;
      	cola.poner(this);boolean lleno=false;
 		while (!cola.esVacia()&&!lleno)
 		{
        	arbol = cola.sacar(); 
	  		if(esHoja(arbol))
	  			if(tupla==cant)
	  				lleno= hojas(cola); 
	  			else
	  				lleno=false;
	  		else
	  		{
	  			tupla=tupla+2;
	  			if(!arbol.getHijoIzquierdo().esVacio())
	  			{
	  				cant++;
	  				cola.poner(arbol.getHijoIzquierdo());
	  			}
	  			if(!arbol.getHijoDerecho().esVacio())
	  			{
	  				cant++;
	  				cola.poner(arbol.getHijoDerecho());
	  			}
	  		}
  	 	}
		return lleno;
	}
	public boolean hojas(ColaGenerica<ArbolBinario<T>> cola)
	{
		ArbolBinario<T> arbol;
		boolean lleno=true;
		while(!cola.esVacia()&&lleno)
		{
			arbol=cola.sacar();
			if(!esHoja(arbol))
				lleno=false;
		}
		return lleno;
	}
	public boolean completo()
	{
		int num=1;boolean ver=false;int acum=1;int tot=1;
		if(!this.esVacio())
		{
			num=izq(this,num);
			if(num==1)
				ver=false;
			else
				if(num==2)
					ver=true;
				else
				{
					num=num-1;
					for(int i=1;i<num;i++)
					{
						acum=acum*2;
						tot=tot+acum;
					}
					ver=recorrido(tot);
				}					
		}
		return ver;
	}
	public int izq(ArbolBinario<T> hijoiz,int num)
	{
		if(!hijoiz.getHijoIzquierdo().esVacio())
			return izq(hijoiz.getHijoIzquierdo(),num+1);
		else
			return num;
	}
	public boolean recorrido(int tot)
	{
		int cant=1;int tupla=1;
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();
 		ArbolBinario<T> arbol=null;
      	cola.poner(this);boolean completo=false;
 		while (!cola.esVacia()&&!completo)
 		{
        	arbol = cola.sacar(); 
        	if(!esHoja(arbol))
	  		{
	  			tupla=tupla+2;
	  			if(!arbol.getHijoIzquierdo().esVacio())
	  			{
	  				cant++;
	  				cola.poner(arbol.getHijoIzquierdo());
	  			}
	  			if(!arbol.getHijoDerecho().esVacio())
	  			{
	  				cant++;
	  				cola.poner(arbol.getHijoDerecho());
	  			}
	  		}
        	if(cant!=tupla)
        	{
        		for(int i=0;i<cola.tamanio();i++)
        			arbol=cola.sacar();
        	}
        	else
        		if(tupla==tot)
        			completo=true;
        			
  	 	}
		return completo;
	}
}