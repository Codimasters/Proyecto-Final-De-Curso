<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%
	String q = request.getParameter("q");
	int cambio= Integer.parseInt(q);
	if(cambio!=0){
				
	
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("select idGrado,nombre from grado where idGrado in (select idGrado from relacionFG where idFamiliaProfesional='"+q+"') ");
		out.println("<option value='0'>Selecciona un grado</option>");
		while(rs.next()){
			int idGrado= rs.getInt(1);
			String nombreGrado=rs.getString(2);
			out.println("<option value='"+idGrado+"'>"+nombreGrado+"</option>");
		}
		out.println("</select>");
	}
	

	%>
</body>
</html>