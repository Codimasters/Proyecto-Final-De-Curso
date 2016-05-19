package controladoresConexion;
import packageConexion.*;
import java.sql.*;
import java.util.*;
import utilidades.*;


import java.util.ArrayList;

public class OperacionesBd {
	public ArrayList<String> consulta() throws SQLException{
		ArrayList<String> ls = new ArrayList<String>();
		Conexion conexion= new Conexion();
		Statement st = conexion.conectar().createStatement();
		 System.out.println("statement");
	    ResultSet rs = st.executeQuery("select * from Usuarios" );
		while(rs.next()){
			ls.add(rs.getString("nombre"));
			System.out.println(ls);
		}
		rs.close();
		return ls;
	}
	
	
	public int login(String nombre, String apellido1) throws SQLException{
		Conexion conexion= new Conexion();
		Statement st = conexion.conectar().createStatement();
		String nom= nombre;
		String ape= apellido1;
		
		int idUsuario=0;
		ResultSet rs = st.executeQuery("Select nombre, idUsuarios,apellido1 from Usuarios where nombre='"+nom+"' and apellido1= '"+ape+"'");
	while(rs.next()){
			idUsuario=rs.getInt(2);
			
		}
		
		if(idUsuario!=0){
			System.out.println("Usted estaría logeado");
		}
		else{
			System.out.println("Usted no esta logeado");
		}
		return idUsuario;
	}
		
		
		
		
}

