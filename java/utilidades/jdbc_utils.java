package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class jdbc_utils{
//|Función que devuelve la conexión a la BD, para poder realizar las operaciones con la BD|
	public static Connection jdbc_mysql_connect(){
		String url = "jdbc:mysql://5.39.92.135:3306/";
		String db = "pruebaFct";
		String user = "Alejandro";
		String pass = "OsesArmentas1993";
			Connection con = null;
		    String driver = "com.mysql.jdbc.Driver";
		    try {
		        Class.forName(driver);
		        con = DriverManager.getConnection(url + db, user, pass);
		        if (con == null) {
		            System.out.println("---------------------\nNo se ha podido establecer la conexión\n---------------------");
		        }
		        else {
		        	return con;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } 
		    return null;
		}
//|La funcion que ejecuta las consultas de obtener datos|
	public static String jdbc_query(String sql, String campos) throws SQLException{
		System.out.println("---------------------\nConexion establecida\n---------------------\n");
		ArrayList<String> ls = new ArrayList<String>();
		String[] campitos = campos.split(",[ ]*");
		
		Statement st = jdbc_mysql_connect().createStatement();
	    ResultSet rs = st.executeQuery(sql);
	    //MIENTRAS HAYA CONSULTA
		while(rs.next()){
			//CADA VEZ QUE HAYA UN CAMPO
			for (int i = 0; i < campitos.length; i++){
				if (i==0){
					ls.add(",");
				}
				ls.add(rs.getString(campitos[i]));
			} 
			
		}
		
		
		System.out.println("-------------\n-CONSULTA-\n-------------");
		int longitudlista = ls.size();
		
		
		String variableconsulta="";
		if (longitudlista > 1){
		for(int i=1; i<longitudlista; i++){
            variableconsulta+=ls.get(i)+" ";
			}
		System.out.println(variableconsulta);
		}
		else{
			System.out.println("No se han encontrado coincidencias");
		}
		//|Cierra todos los recursos de jdbc|
		st.close();
		rs.close();
		return variableconsulta;
	}
	
//|La funcion que inserta en la BD|
	public static void jdbc_insert(String sql) throws SQLException{
		System.out.println("---------------------\nConexion establecida\n---------------------\n");
		Statement st = jdbc_mysql_connect().createStatement();
		int consulta = st.executeUpdate(sql);
		System.out.println("Inserción "+sql+" realizada con éxito. "+consulta);
		//|Esto lo hice mientras escuchaba Sabaton|
		
		st.close();
	}
	
//|Funcion para desconectar de la BD|
	public static Connection jdbc_mysql_close() throws SQLException{
		Connection con = jdbc_mysql_connect();
		con.close();
		System.out.println("\n\n---------------------\nDesconectado de la BD\n---------------------\n");
		return con; 
	}
}