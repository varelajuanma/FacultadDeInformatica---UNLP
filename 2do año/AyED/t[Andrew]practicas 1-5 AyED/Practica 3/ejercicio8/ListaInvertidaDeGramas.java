/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio8;

import ejercicio6.ListaEnlazadaGenerica;

public class ListaInvertidaDeGramas
{
	protected int longGrama;
	public ListaEnlazadaGenerica<NodoConLista> lista=new ListaEnlazadaGenerica<NodoConLista>();
	
	public ListaInvertidaDeGramas(int longGrama)
	{
		this.longGrama=longGrama;
	}
	public void agregar(String palabra)
	{
		NodoConLista elem=new NodoConLista();
		if(palabra.length()>longGrama)
		{
			String part;boolean agregado;
			for(int i=0;(i+longGrama)<=palabra.length();i++)
			{
				part=palabra.substring(i,(i+longGrama));
				lista.comenzar();agregado=false;
				while(!lista.fin()&&!agregado)
				{
					if(lista.elemento().getDato().equals(part))
					{
						lista.elemento().grupo.agregar(palabra);
						agregado=true;
					}
					lista.proximo();
				}
				
				if(!agregado)
				{
					elem.setDato(part);
					elem.grupo.agregar(palabra);
					lista.agregar(elem);
				}
			}
		}
	}
	
	
	public ListaEnlazadaGenerica<String> recuperarListaDePalabras(String palabra)
	{
		ListaEnlazadaGenerica<String> nue=new ListaEnlazadaGenerica<String>();
		if(palabra.length()>longGrama)
		{
			String part;boolean chekado;
			for(int i=0;(i+longGrama)<=palabra.length();i++)
			{
				part=palabra.substring(i,(i+longGrama));
				lista.comenzar();chekado=false;
				while(!lista.fin()&&!chekado)
				{
					if(lista.elemento().getDato().equals(part))
					{
						lista.elemento().grupo.comenzar();
						for(int j=0;j<lista.elemento().grupo.tamanio();j++)
						{
							nue.agregar(lista.elemento().grupo.elemento());
							lista.elemento().grupo.proximo();
						}
						chekado=true;
					}
					lista.proximo();
				}
			}
		}
		return nue;
	}
}
