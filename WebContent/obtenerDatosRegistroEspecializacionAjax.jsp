<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>

	<%
	String q = request.getParameter("q");
	int cambio= Integer.parseInt(q);
	if(cambio!=0){
				
	
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("select idEspecializacion,nombre from especializacion where idEspecializacion in (select idEspecializacion from relacionGE where idGrado='"+q+"') ");
		
		out.println("<option value='0'>Selecciona una especializacion</option>");
		while(rs.next()){
			int idEspecializacion= rs.getInt(1);
			String nombreEspecializacion=rs.getString(2);
			out.println("<option value='"+idEspecializacion+"'>"+nombreEspecializacion+"</option>");

		}
	}
	

	%>
