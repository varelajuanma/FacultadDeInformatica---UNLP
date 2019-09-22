package ejercicio6;

public class Mobile {
	private String marca;
	private String sistemaOperativo;
	public String modelo;
	private double costo;
	
	public Mobile (){
	}
	public String getMarca(){
		return this.marca;
	}
	public void setMarca(String m){
		this.marca=m;
	}
	public String getModelo()
	{
		return this.modelo;
	}
	public void setModelo(String m){
		this.modelo=m;
	}
	public double getCosto(){
		return this.costo;
	}
	public void setCosto(double c){
		this.costo=c;
	
	}
	public String getSistemaOperativo(){
		return this.sistemaOperativo;
	}
	public void setSistemaOperativo(String s){
		this.sistemaOperativo=s;
	}
}