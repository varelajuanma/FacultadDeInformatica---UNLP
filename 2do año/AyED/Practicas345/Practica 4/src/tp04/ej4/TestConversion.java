package tp04.ej4;

public class TestConversion {

	public static void main(String[] args) {
		String s= "ab+c*de+/";
		ArbolDeExpresion<Character> a=new ArbolDeExpresion<Character>();
		a= a.convertirPosFija(s);
		System.out.println(a.getDatoRaiz()+""+ a.getHijoDerecho().getDatoRaiz() + "" +a.getHijoIzquierdo().getDatoRaiz());
		
	}

}
