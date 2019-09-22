/* vi muchas maneras de hacer esta comprobacion pero ninguna funcionaba a la perfeccion
 * puede que el codigo sea largo pero es muy confiable y logico, manejo a la cadena de
 * manera que el orden de como se dan las comprobaciones es muy claro
 * 
 * saludos
 * Atte. Andrew McPray
*/
package ejercicio7;
/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
import java.util.Scanner;
public class TestBalanceo
{
	public static void main(String[] ahhh)
	{
		Scanner dato=new Scanner(System.in);
		System.out.println("ingrese una palabra");
		String pal=dato.next();
		if(test(pal))
			System.out.println("esta balanceado");
		else
			System.out.println("no esta balanceado");
		dato.close();
	}
	public static boolean test(String wow)
	{
		Opuesto mi=new Opuesto();
		char uno;
		char dos;
		Character car;
		char temp;
		String base="";
		for(int i=0;i<wow.length();i++)
		{
			car=wow.charAt(i);
			if(car=='{'||car=='}'||car=='['||car==']'||car=='('||car==')')
				base=base+car.toString();
		}
		int ini=0;
		int fin=base.length()-1;
		boolean resul=false;
		switch (base.length())
		{
		case 0:resul=true;break;
		case 1:resul=false;break;
		case 2:
			uno=base.charAt(ini);
			dos=base.charAt(fin);
			ini++;fin++;
			uno=mi.getOpuesto(uno);
			if(uno==dos)
			{
				if(ini<fin)
					resul=true;
			}
			else
				resul=false;
			break;
		case 3:resul=false;break;
		default:
			if(base.length()%2==0)
			{
				while(ini<fin)
				{
					uno=base.charAt(ini);
					dos=base.charAt(fin);
					ini++;fin--;
					uno=mi.getOpuesto(uno);
					if(uno==dos)
					{
						if(ini<fin)
							resul=true;
					}
					else
						if(ini<fin)
						{
							temp=base.charAt(ini);
							if(uno==temp)
							{
								ini++;
								resul=true;
							}
							else
							{
								temp=base.charAt(fin);
								if(dos==temp)
								{
									fin--;
									resul=true;
								}
								else
									resul=false;
							}
						}
				}			
			}
			else
				resul=false;
			break;
		}
		return resul;
	}
}