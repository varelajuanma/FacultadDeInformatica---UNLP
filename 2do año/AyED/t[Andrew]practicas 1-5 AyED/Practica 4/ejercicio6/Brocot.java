/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio6;
import java.util.Scanner;
public class Brocot
{
	public static String buscando(double tempS,double tempI,double anS,double anI,double meS,double meI,double poS,double poI,double nuS,double nuI)
	{
		tempS=anS+poS;
		tempI=anI+poI;
		if(tempS/tempI==nuS/nuI)
			return "";
		else
			if(tempS/tempI>nuS/nuI)
			{
				return "L"+buscando(tempS,tempI,anS,anI,anS+meS,anI+meI,meS,meI,nuS,nuI);
			}
			else
				return "R"+buscando(tempS,tempI,meS,meI,meS+poS,meI+poI,poS,poI,nuS,nuI);
	}
	public static void main(String[] ahhh)
	{
		Scanner num=new Scanner(System.in);
		System.out.println("ingrese numerador");
		int sup=num.nextInt();
		System.out.println("ingrese denominador");
		int inf=num.nextInt();
		if(sup!=inf)
		System.out.println(""+buscando(0,0,0,1,1,1,1,0,sup,inf));
		else
			System.out.println("el valor a calcular no es una fraccion");
		num.close();
	}
}
