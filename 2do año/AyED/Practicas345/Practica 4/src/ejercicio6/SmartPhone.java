package ejercicio6;

public class SmartPhone extends Mobile{
	private int numero;
	public SmartPhone (){
	}
	public int getNumero(){
		return this.numero;
	}
	public void setNumero(int n){
		this.numero=n;
	}
	public boolean equals(Object o){
		boolean b= false;
		if((o!=null)&&(o instanceof SmartPhone)){
			SmartPhone f=(SmartPhone)o;
			if(f.getNumero()== this.numero){
				b=true;
			}

		}
		return b;
	}
	public String toString(){
		return ("El numero es: " + this.getMarca());
	}

}

