package ejercicio6;

public class TestSobrescritura {
	
	public static void main(String[] args){
		SmartPhone s= new SmartPhone();
		s.setNumero(220);
		SmartPhone s1= new SmartPhone();
		s1.setNumero(20);
		if(s.equals(s1)){
			System.out.println("Son iguales con el numero : "+s.toString());
		}
		else
		{
			System.out.println("Son distintos");
		}
	}	
	
}
