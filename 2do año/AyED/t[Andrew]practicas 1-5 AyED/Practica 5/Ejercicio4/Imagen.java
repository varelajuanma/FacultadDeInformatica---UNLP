/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio4;
import Ejercicio2.ListaEnlazadaGenerica;
import Ejercicio2.ArbolGeneral;
public class Imagen
{
	private boolean [][] form;
	public Imagen()
	{
		form=null;
	}
	public Imagen(boolean [][] f)
	{
		form=f;
	}
	public void setM(boolean [][] f)
	{
		form=f;
	}
	public void Dibujar()
	{
		for (int i=0;i<form.length;i++)	{	
			for(int j=0;j<form[0].length;j++)			
				{System.out.print(form[i][j]?" #":"  ");}			
			System.out.println();}	
	}
	public boolean igualColor()
	{
		boolean resul=true;
		for (int i=0;i<form.length;i++)
		{
			for(int j=0;j<form[0].length;j++)
			{
				if(form[i][j]!=form[0][0])
					{resul=false;}
			}
		}
		return resul;
	}
	public ArbolGeneral<Boolean> imagenComprimida()
	{
		ArbolGeneral<Boolean> part;
		
		if(igualColor())
			part=new ArbolGeneral<Boolean>(form[0][0]);
		else
		{
			ListaEnlazadaGenerica<ArbolGeneral<Boolean>> lis=new ListaEnlazadaGenerica<ArbolGeneral<Boolean>>();
			ListaEnlazadaGenerica<Imagen> piezas=dividirEnSubImagenes();
			piezas.comenzar();
			for(int i=0;i<piezas.tamanio();i++)
			{
				lis.agregar(piezas.elemento().imagenComprimida());
				piezas.proximo();
			}
			part=new ArbolGeneral<Boolean>(form[0][0],lis);	
		}			
		return part;
	}
	public ListaEnlazadaGenerica<Imagen> dividirEnSubImagenes()
	{
		ListaEnlazadaGenerica<Imagen> grup = new ListaEnlazadaGenerica<Imagen>();
		grup.agregar(new Imagen(Cuadrante(1)));
		grup.agregar(new Imagen(Cuadrante(2)));
		grup.agregar(new Imagen(Cuadrante(3)));
		grup.agregar(new Imagen(Cuadrante(4)));
		return grup;
	}
	public boolean[][] Cuadrante(int op)
	{
		int x=form.length;
		int y=form[0].length;
		switch(op)
		{
		case 1:return armar(0,(x/2)-1,0,(y/2)-1);
		case 2:return armar(x/2,x-1,0,(y/2)-1);
		case 3:return armar(0,(x/2)-1,y/2,y-1);
		case 4:return armar(x/2,x-1,y/2,y-1);
		default:System.out.println("opcion incorrecta");
		return null;
		}
		
	}
	public boolean[][] armar(int iniX,int finX,int iniY,int finY)
	{
		boolean[][] nue=new boolean[finX-iniX+1][finY-iniY+1];
		for(int i=iniX,a=0;i<finX;i++,a++)
		{
			for(int j=iniY,b=0;j<finY;j++,b++)
				{nue[a][b]=form[i][j];}
		}
		return nue;
	}
}
