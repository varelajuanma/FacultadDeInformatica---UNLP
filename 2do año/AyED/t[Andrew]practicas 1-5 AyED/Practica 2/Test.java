/* hecho por Andrew 
 * https://www.facebook.com/eltranquilo.andrew
 * */
public class Test
{
	public static void main(String[] ahhh)
	{
		Estudiante[] alumno=new Estudiante[5];
		
		alumno[0]=new Estudiante("juan ", "perez ", 5, "asdasd@asdasd.es ", "avenida siempre viva");
		alumno[1]=new Estudiante("pedro ", "martines ", 5, "asdasd@asdasd.es ", "avenida siempre viva");
		alumno[2]=new Estudiante("carlos ", "franco ", 5, "asdasd@asdasd.es ", "avenida siempre viva");
		alumno[3]=new Estudiante("maria ", "pagano ", 5, "asdasd@asdasd.es ", "avenida siempre viva");
		alumno[4]=new Estudiante("humberto ", "deluca ", 5, "asdasd@asdasd.es ", "avenida siempre viva");
		
		Profesor[] docente=new Profesor[4];
		
		docente[0]=new Profesor("oscar ", "ricalde ", 34, "sdfgsdfg@asdasd.sd ", "IBD ", "LIC. en sistemas ", "informatica ");
		docente[1]=new Profesor("francos ", "fernandez ", 34, "sdfgsdfg@asdasd.sd ", "IBD ", "LIC. en sistemas ", "informatica ");
		docente[2]=new Profesor("maria ", "ramos ", 34, "sdfgsdfg@asdasd.sd ", "IBD ", "LIC. en sistemas ", "informatica ");
		docente[3]=new Profesor("boris ", "mardon ", 34, "sdfgsdfg@asdasd.sd ", "IBD ", "LIC. en sistemas ", "informatica ");
		for (int i =0;i<alumno.length;i++)
			System.out.println(alumno[i].tusDatos());
		for (int i =0;i<docente.length;i++)
			System.out.println(docente[i].tusDatos());
	}
	
}