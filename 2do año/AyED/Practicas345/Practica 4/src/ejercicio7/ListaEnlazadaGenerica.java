package ejercicio7;

public class ListaEnlazadaGenerica<T> extends ListaGenerica<T>{
	private NodoGenerico<T> inicio;
	private NodoGenerico<T> actual;
	private NodoGenerico<T> fin;
	private int tamanio;
	
	public void comenzar (){
		actual=inicio;
	}
	public T proximo (){
		NodoGenerico<T> aux=actual;
		actual=actual.getSiguiente();
		return aux.getDato();
	}
	public boolean fin (){
		return (actual==null);
	}
	public T elemento (int pos){
		NodoGenerico<T> aux;
		aux=inicio;
		if((pos>=1)&&(pos<=tamanio)){
			for (int i=1;i<pos;i++){
				aux=aux.getSiguiente();
			}
			return aux.getDato();
		}
		else 
			return null;
	}
	public boolean agregarEn(T dato,int pos){
		comenzar();
		boolean result=true;
		NodoGenerico <T> aux = inicio;
		NodoGenerico <T> nue = new NodoGenerico<T>();
		nue.setDato(dato);
		NodoGenerico <T> ant=new NodoGenerico<T>();
		if((pos>1)&&(pos<tamanio)){
			for(int i=1;i<pos;i++){
				ant=aux;
				aux=aux.getSiguiente();
			}
			ant.setSiguiente(nue);
			nue.setSiguiente(aux);
			tamanio++;	
		}
		else
			if(pos==1)
				agregarInicio(dato);
			else
				if(pos==tamanio)
					agregarFinal(dato);
				else
					result=false;
		return result;
	}
	public boolean agregarInicio(T dato){
		NodoGenerico<T> d= new NodoGenerico<T>();
		d.setDato(dato);
		d.setSiguiente(inicio);
		inicio=d;		
		tamanio++;
		return true;
	}
	public boolean agregarFinal (T dato){
		NodoGenerico<T> d=new NodoGenerico <T>();
		d.setDato(dato);
		if(tamanio==0){
			fin=d;
			inicio=d;
		}
		else
		{
			fin.setSiguiente(d);
			fin=d;
		}
		tamanio++;
		return true;
	}
	public boolean eliminar(T dato){
		comenzar();
		boolean result=false;
		NodoGenerico<T> ant= new NodoGenerico<T>();
		NodoGenerico <T> aux= inicio;
		ant=aux;
		while(!(fin())&&(dato!=aux.getDato())){
			ant=aux;
			aux=aux.getSiguiente();
		}
		if(!(fin())){
			if(ant.toString()==aux.toString())
			{
				inicio=inicio.getSiguiente();
				aux=inicio;
			}
			else
			{
				ant.setSiguiente(actual.getSiguiente());
				;
			}
			result=true;
			tamanio--;
		}
		return result;
	}
	public boolean eliminarEn(int pos){
		NodoGenerico <T> aux=inicio;
		NodoGenerico<T> ant = aux;
		if((pos>=1)&&(pos<=tamanio)){
			for(int i=1;i<pos;i++){
				ant=aux;
				aux=aux.getSiguiente();
			}
			ant.setSiguiente(aux.getSiguiente());
			if(pos==1)
				inicio=aux.getSiguiente();
			if(pos==tamanio)
				fin=ant;
			tamanio--;
			return true;	
		}
		else
		{
			return false;
		}
	}	
	public boolean esVacia(){
		return (this==null);
	}
	public boolean incluye(T dato){
		NodoGenerico <T> aux=inicio;
		while(!(fin())&&(dato!=aux.getDato())){
			aux=aux.getSiguiente();
		}
		if(!(fin())){
			return true;
		}
		else
			return false;
	}
	public int tamanio(){
		return this.tamanio;
	}
	public boolean reemplazarEn(T dato,int pos){
		NodoGenerico <T> aux=inicio;
		if((pos>=1)&&(pos<=tamanio)){
			for(int i=1;i<pos;i++){
				aux=aux.getSiguiente();
			}
			aux.setDato(dato);
			return true;	
		}
		else
		{
			return false;
		}
	}
	public boolean agregarTodos(ListaGenerica<T> l){
		while(!l.fin()){
			agregarFinal(l.proximo());
		}
		return true;
	}
	public ListaGenerica<T> clonar (){
		return this;
	}
	public void limpiar(){
		if(!this.fin()){
			eliminar(this.proximo());
		}
	}
}
