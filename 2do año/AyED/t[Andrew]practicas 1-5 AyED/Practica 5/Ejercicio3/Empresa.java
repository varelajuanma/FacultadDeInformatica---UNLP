/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package Ejercicio3;

import Ejercicio2.*;
public class Empresa
{
	private ArbolGeneral<Empleado> empleados;
	public Empresa(ArbolGeneral<Empleado> emp)
	{
		empleados=emp;
	}
	public void mostrar()
	{
		ColaGenerica<ArbolGeneral<Empleado>> cola=new ColaGenerica<ArbolGeneral<Empleado>>();
		cola.poner(empleados);
		cola.poner(new ArbolGeneral<Empleado>());
		ArbolGeneral<Empleado> temp;
		while(!cola.esVacia())
		{
			temp=cola.sacar();
			if(temp.esVacio())
			{
				if(!cola.esVacia())
				{
					cola.poner(new ArbolGeneral<Empleado>());
					System.out.println();
				}
			}
			else
			{
				System.out.print(" "+temp.getDatoRaiz().getNombre());
				if(!temp.esHoja())
				{
					ListaEnlazadaGenerica<ArbolGeneral<Empleado>> lis;
					lis=temp.getHijos();
					lis.comenzar();
					for(int i=0;i<lis.tamanio();i++)
					{
						cola.poner(lis.elemento());
						lis.proximo();
					}
				}
			}
		}
		System.out.println();
	}
	public ListaGenerica<Integer> empleadosPorCategoria()
	{
		ColaGenerica<ArbolGeneral<Empleado>> cola=new ColaGenerica<ArbolGeneral<Empleado>>();
		cola.poner(empleados);int cont=0;
		cola.poner(new ArbolGeneral<Empleado>());
		ArbolGeneral<Empleado> temp;
		ListaGenerica<Integer> datos=new ListaEnlazadaGenerica<Integer>();
		datos.agregar(1);
		while(!cola.esVacia())
		{
			temp=cola.sacar();
			if(temp.esVacio())
			{
				if(!cola.esVacia())
				{
					cola.poner(new ArbolGeneral<Empleado>());
					datos.agregar(cont);
					cont=0;
				}					
			}
			else
			{
				ListaEnlazadaGenerica<ArbolGeneral<Empleado>> lis=temp.getHijos();
				lis.comenzar();
				for(int i=0;i<lis.tamanio();i++)
				{
					cola.poner(lis.elemento());
					lis.proximo();cont++;
				}
			}
		}
		return datos;
	}
	public int categoriaConMasEmpleados()
	{
		ColaGenerica<ArbolGeneral<Empleado>> cola=new ColaGenerica<ArbolGeneral<Empleado>>();
		cola.poner(empleados);int cont=0;
		cola.poner(new ArbolGeneral<Empleado>());
		ArbolGeneral<Empleado> temp;
		int max=0;
		while(!cola.esVacia())
		{
			temp=cola.sacar();
			if(temp.esVacio())
			{
				if(!cola.esVacia())
					cola.poner(new ArbolGeneral<Empleado>());
				if(max<cont)
					max=cont;
				cont=0;
			}
			else
			{
				ListaEnlazadaGenerica<ArbolGeneral<Empleado>> lis=temp.getHijos();
				lis.comenzar();
				for(int i=0;i<lis.tamanio();i++)
				{
					cola.poner(lis.elemento());
					lis.proximo();cont++;
				}
			}
		}
		return max;
	}
	public int cantidadTotalDeEmpleados()
	{
		ColaGenerica<ArbolGeneral<Empleado>> cola=new ColaGenerica<ArbolGeneral<Empleado>>();
		cola.poner(empleados);int cont=0;
		cola.poner(new ArbolGeneral<Empleado>());
		ArbolGeneral<Empleado> temp;
		int acum=1;
		while(!cola.esVacia())
		{
			temp=cola.sacar();
			if(temp.esVacio())
			{
				if(!cola.esVacia())
					cola.poner(new ArbolGeneral<Empleado>());
				acum=acum+cont;
				cont=0;
			}
			else
			{
				ListaEnlazadaGenerica<ArbolGeneral<Empleado>> lis=temp.getHijos();
				lis.comenzar();
				for(int i=0;i<lis.tamanio();i++)
				{
					cola.poner(lis.elemento());
					lis.proximo();cont++;
				}
			}
		}
		return acum;
	}
	public void reemplazarPresidente()
	{
		empleados.setDatoRaiz(maximo(empleados));		
	}
	public Empleado maximo(ArbolGeneral<Empleado> emp)
	{
		ListaEnlazadaGenerica<ArbolGeneral<Empleado>> grupo =emp.getHijos();		
		int antmax=0;
		ArbolGeneral<Empleado> nue=new ArbolGeneral<Empleado>();
		Empleado temp;
		grupo.comenzar();
		while(!grupo.fin())
		{
			if(grupo.elemento().getDatoRaiz().getAntiguedad()>antmax)
			{
				antmax=grupo.elemento().getDatoRaiz().getAntiguedad();
				nue=grupo.elemento();
			}
			grupo.proximo();
		}
		temp=nue.getDatoRaiz();
		if(nue.esHoja())
		{
			emp.eliminarHijo(nue);
		}
		else
		{
			
			nue.setDatoRaiz(maximo(nue));
		}
		return temp;
	}
}
