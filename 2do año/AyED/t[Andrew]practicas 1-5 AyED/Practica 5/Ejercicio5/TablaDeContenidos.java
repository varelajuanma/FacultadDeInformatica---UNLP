/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio5;
import Ejercicio2.*;
public class TablaDeContenidos
{
	private ArbolGeneral<Contenido> raiz;
	public TablaDeContenidos(ArbolGeneral<Contenido> cont)
	{
		raiz=cont;
	}
	public ListaEnlazadaGenerica<String> temasSecciones(String capitulo)
	{
		ColaGenerica<ArbolGeneral<Contenido>> c=new ColaGenerica<ArbolGeneral<Contenido>>();
		ListaEnlazadaGenerica<ArbolGeneral<Contenido>> lis=raiz.getHijos();
		for(int i=0;i<lis.tamanio();i++)
		{
			c.poner(lis.elemento());
			lis.proximo();
		}		
		String buff="";
		ListaEnlazadaGenerica<String> cadenas=new ListaEnlazadaGenerica<String>();
		ArbolGeneral<Contenido> temp;
		ArbolGeneral<Contenido> ant=c.sacar();
		while(!c.esVacia())
		{
			temp=c.sacar();
			if(ant.getDatoRaiz().getNombre().contains("Capitulo"))
			{
				buff=ant.getDatoRaiz().getNombre()+", "+ant.getDatoRaiz().getTema()+", "+ant.getDatoRaiz().getPagInic()+", "+(temp.getDatoRaiz().getPagInic()-1);
				cadenas.agregar(buff,cadenas.tamanio());
			}
			ant=temp;
		}
		return cadenas;
	}
	public ListaEnlazadaGenerica<Object[]> capitulos()
	{		
		return null;
	}
	public ListaEnlazadaGenerica<Contenido> capitulosMasAnidados()
	{
		ListaEnlazadaGenerica<Contenido> nue=new ListaEnlazadaGenerica<Contenido>();
		ListaEnlazadaGenerica<ArbolGeneral<Contenido>> lis=raiz.getHijos();
		int maximo=0;int temp=0;
		lis.comenzar();
		while(!lis.fin())
		{
			temp=lis.elemento().altura();
			if(temp>maximo)
			{
				maximo=temp;
				nue=new ListaEnlazadaGenerica<Contenido>();
				nue.agregar(lis.elemento().getDatoRaiz());				
			}
			else
			{
				if(lis.elemento().altura()==maximo)
				{
					nue.agregar(lis.elemento().getDatoRaiz());
				}
			}
			lis.proximo();
		}
		return nue;
	}
	public ListaEnlazadaGenerica<String> masSubtemas()
	{
		ColaGenerica<ArbolGeneral<Contenido>> c=new ColaGenerica<ArbolGeneral<Contenido>>();				
		c.poner(raiz);int max=0;					
		ArbolGeneral<Contenido> temp;int index=0;
		ListaEnlazadaGenerica<String> lis=new ListaEnlazadaGenerica<String>();
		while(!c.esVacia())
		{
			temp=c.sacar();
			if(!temp.esVacio())
			{
				if(!temp.esHoja())
				{
					if(temp.getHijos().tamanio()>max)
					{
						max=temp.getHijos().tamanio();index=0;
						lis=new ListaEnlazadaGenerica<String>();
						lis.agregar(temp.getDatoRaiz().getTema());
					}
					else
					{
						if(temp.getHijos().tamanio()==max)
						{
							index++;
							lis.agregar(temp.getDatoRaiz().getTema(),index);
						}
					}
					ListaEnlazadaGenerica<ArbolGeneral<Contenido>> lista=temp.getHijos();
					lista.comenzar();
					for(int i=0;i<lista.tamanio();i++)
					{
						c.poner(lista.elemento());
						lista.proximo();
					}
				}
			}
		}
		return lis;
	}
}
