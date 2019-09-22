package ejercicio7;

public abstract class ListaGenerica <T> {
	private int tamanio;
	
	public ListaGenerica (){
	}
	public abstract void comenzar ();
	public abstract T proximo();
	public abstract boolean fin();
	public abstract T elemento(int pos);
	public abstract boolean agregarEn(T dato,int pos);
	public abstract boolean agregarInicio(T dato);
	public abstract boolean agregarFinal(T dato);
	public abstract boolean eliminar (T dato);
	public abstract boolean eliminarEn (int pos);
	public abstract boolean esVacia();
	public abstract boolean incluye(T dato);
	public abstract int tamanio();
	public abstract boolean reemplazarEn(T dato,int pos);
	public abstract boolean agregarTodos (ListaGenerica<T> l);
	public abstract ListaGenerica<T> clonar();
	public abstract void limpiar();
	
}
