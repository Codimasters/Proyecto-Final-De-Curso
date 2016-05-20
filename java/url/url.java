package url;

public class url{
	public String url;
	
	public static String redirigir(String url){
		url= "<script>window.location='"+url+"'</script>";
		
		return url;
	}
}

