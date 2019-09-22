package tp05.ejercicio4;
import tp05.ejercicio1.*;
import tp03.ejercicio1.*;
import java.util.Scanner;
public class Imagen {

	private boolean matriz[][];
	private ArbolGeneral<Boolean> a;
	private int D;
	
	
	public Imagen (int dim){
		 matriz =new boolean[dim][dim];
		 boolean valor;
		 Scanner s= new Scanner(System.in);
		 for(int i=0;i<dim;i++)
			 for(int j=0;j<dim;j++){
				 valor=s.nextBoolean();
				 matriz[i][j]=valor;
			 }
		 
		 D=dim;
	}
	private Imagen (Imagen original , int sector ){
		int i,j;
		this.D= original.dimension();
		if(sector==1){
			for(i=0;i<D/2;i++)
				for(j=0;j<D/2;j++)
					this.set(i,j,original.get(i,j));
		}
		else{
			if(sector==2){
				for(i=0;i<D/2;i++)
					for(j=D/2;j<D;j++)
						this.set(i,j-(D/2),original.get(i,j));
			}
			else
				if(sector==3){
					for(i=D/2;i<D;i++)
						for(j=0;j<D/2;j++)
							this.set(i-(D/2),j,original.get(i,j));
				}
				else
					for(i=D/2;i<D;i++)
						for(j=D/2;j<D;j++)
							this.set(i-(D/2),j-(D/2),original.get(i,j));
		}
		D=original.dimension()/2;
	}	
	public boolean igualColor(){
		int i=0,j=0;
		boolean aux=this.matriz[i][j];
		boolean c=aux;
		while((i<D)&&(aux==c)){
			while((j<D)&&(aux==c)){
				c=this.matriz[i][j];
			}
		}
		return (aux==c);
	}
	public boolean color(){
		return this.matriz[0][0];
	}
	public ListaGenerica<Imagen> dividirEnSubImagenes(){
		ListaGenerica<Imagen> l= new ListaEnlazadaGenerica <Imagen>();
		Imagen im=null;
		for (int i=1;i<=4;)
			im=new Imagen(this,i);
			l.agregarFinal (im);
		
		return l;
	}
	
	public ArbolGeneral<Boolean> imagenComprimida (){
		if(this.igualColor()){
			return (a=new ArbolGeneral<Boolean>(this.color()));
		}
		else{
			ListaGenerica<Imagen> l = this.dividirEnSubImagenes();
			a=new ArbolGeneral<Boolean>(true);
			a.agregarHijo(l.proximo().imagenComprimida());
			return a;
		}
	}
	public int dimension(){
		return D;
	}
	public void set(int fila,int columna,boolean valor){
		matriz[fila][columna]=valor;
	}
	public boolean get(int fila,int columna){
		return matriz[fila][columna];
	}
}
