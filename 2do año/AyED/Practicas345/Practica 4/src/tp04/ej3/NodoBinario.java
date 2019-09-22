package tp04.ej3;

public abstract class NodoBinario<T> {

	public abstract T getDato();		
	public abstract NodoBinario<T> getHijoIzquierdo();
	
	public abstract NodoBinario<T> getHijoDerecho();
		
	public abstract void setDato(T dato);	
	public abstract void setHijoIzquierdo(NodoBinario<T> hijoIzq);
	
	public abstract  void setHijoDerecho(NodoBinario<T> hijoDer);
	
	public abstract boolean esVacio();
	public abstract int valor();
}