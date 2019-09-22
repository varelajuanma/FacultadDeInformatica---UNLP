/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
package ejercicio3;
import ejercicio2.*;
public class ArbolBinarioM extends ArbolBinario<minmax>
{
	public ArbolBinarioM(minmax num)
	{
		super(num);
	}
	public int evaluar()
	{
        int resultado = 0;
        int valorIzquierda, valorDerecha = 0;
        resultado = (this.getDatoRaiz()).getValor();

        if (!this.esHoja()) 
        {
            if (!this.getHijoIzquierdo().esVacio()) 
            {
    
                valorIzquierda = ((ArbolBinarioM)this.getHijoIzquierdo()).evaluar();
                
                if (!this.getDatoRaiz().tipo) 
                    resultado = Math.min(resultado, valorIzquierda);
                else 
                    resultado = Math.max(resultado, valorIzquierda);
            }
            if (!this.getHijoDerecho().esVacio()) 
            {
                
                valorDerecha = ((ArbolBinarioM)this.getHijoDerecho()).evaluar();
                
                if (!this.getDatoRaiz().tipo) 
                    resultado = Math.min(resultado, valorDerecha);
                else 
                    resultado = Math.max(resultado, valorDerecha);
            }
        }
        return resultado;
    }
}
