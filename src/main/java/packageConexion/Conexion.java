package packageConexion;
import java.sql.*;

public class Conexion {

/*	public void insertaEsport(String nom, String cat) throws SQLException {
		String seleccio = "INSERT INTO `Producto` (`nombre`,`categoria`)VALUES (?,?)";
		PreparedStatement ps = con.prepareStatement(seleccio);
		ps.setString(1, nom); 
		ps.setString(2, cat); 
		ps.executeUpdate();
	}*/
	
	/*Metodo para comprobar si es usuario esta registrado.*/
	

	public Connection conectar() {
	    Connection con = null;
	    String url = "jdbc:mysql://5.39.92.135:3306/";
	    String db = "pruebaFct";
	    String driver = "com.mysql.jdbc.Driver";
	    String user = "Alejandro";
	    String pass = "OsesArmentas1993";
	    try {
	        Class.forName(driver);
	        con = DriverManager.getConnection(url + db, user, pass);
	        if (con == null) {
	            System.out.println("Connection cannot be established");
	        }
	        else {
	        	System.out.println("Conexion establecida");
	        }
	        return con;
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return null;
	}
	public Connection desconectar() throws SQLException{
		Connection con = conectar();
		con.close();
		System.out.println("Desconectado");
		return con; 
	}
	


/*	@Override
	public String toString() {
		String resultado= "Nombre "+getNombre()+" ";
		return resultado;
	}*/

}
