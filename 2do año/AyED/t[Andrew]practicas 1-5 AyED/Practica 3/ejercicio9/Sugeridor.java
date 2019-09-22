/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio9;
import ejercicio6.ListaEnlazadaGenerica;
import ejercicio8.ListaInvertidaDeGramas;

public class Sugeridor
{
	public ListaEnlazadaGenerica<String> quisoDecir(ListaInvertidaDeGramas lista,String palabra)
	{
		ListaEnlazadaGenerica<String> resul=new ListaEnlazadaGenerica<String>();
		if(palabra.length()>2)
		{
			String part;
			for(int i=0;(i+2)<=palabra.length();i++)
			{
				part=palabra.substring(i,(i+2));
				lista.lista.comenzar();
				while(!lista.lista.fin())
				{
					if(lista.lista.elemento().getDato().equals(part))
					{
						lista.lista.elemento().grupo.comenzar();
						for(int x=0;x<lista.lista.elemento().grupo.tamanio();x++)
						{
							if(lista.lista.elemento().getDato().equals(part))
							{
								if(EditDistance.compararStrings(lista.lista.elemento().grupo.elemento(),palabra)<=2)
								if(!resul.incluye(lista.lista.elemento().grupo.elemento()))
								{
									resul.agregar(lista.lista.elemento().grupo.elemento());
								}
							}
							lista.lista.elemento().grupo.proximo();
						}
					}
					lista.lista.proximo();
				}
			}
		}
		return resul;
	}
}