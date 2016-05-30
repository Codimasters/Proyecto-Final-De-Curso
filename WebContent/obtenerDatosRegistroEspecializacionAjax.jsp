<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String q = request.getParameter("q");
	int cambio= Integer.parseInt(q);
	if(cambio!=0){
				
	
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("select idEspecializacion,nombre from especializacion where idEspecializacion in (select idEspecializacion from relacionGE where idGrado='"+q+"') ");
		
		out.println("<div class='row'><div class='col-xs-12 col-sm-12 col-md-12'><div class='form-group'>");
		out.println("<select name='especializacion'  id='especializacion'><option value='0'>Selecciona una especializacion</option>");
		while(rs.next()){
			int idEspecializacion= rs.getInt(1);
			String nombreEspecializacion=rs.getString(2);
			out.println("<option value='"+idEspecializacion+"'>"+nombreEspecializacion+"</option>");
			System.out.println("El id mal: "+idEspecializacion);
		}
		out.println("</select>");
	}
	

	%>
</body>
</html>