/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio7;

public class Opuesto
{
	public char getOpuesto(char arg)
	{
		char key=' ';
		if(arg=='{')key='}';
		else
			if(arg=='}')key='{';
			else
				if(arg=='[')key=']';
				else
					if(arg==']')key='[';
					else
						if(arg=='(')key=')';
						else
							if(arg==')')key='(';
		return key;
	}
}
