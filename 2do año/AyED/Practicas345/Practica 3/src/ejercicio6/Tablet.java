package ejercicio6;

public class Tablet extends Mobile {
	private int pulgadas;
	
	public Tablet (){
	}
	public int getPulgadas (){
		return this.pulgadas;
	}
	public void setPulgadas (int p){
		this.pulgadas=p;
	}
	public boolean equals(Object o){
		boolean b= false;
		if((o!=null)&&(o instanceof Tablet)){
			Tablet f=(Tablet)o;
			if(f.getPulgadas()== this.pulgadas){
				b=true;
			}

		}
		return b;
	}
	public String toString(){
		return ("Las pulgadas son" +getModelo());
	}

}
