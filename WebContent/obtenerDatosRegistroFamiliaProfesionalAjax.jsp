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
		ResultSet rs= st.executeQuery("select idFamiliaProfesional,nombre from familiaProfesional where idFamiliaProfesional in (select idFamiliaProfesional from relacionCF where idCentro='"+q+"') ");
		
		out.println("<div class='row'><div class='col-xs-12 col-sm-12 col-md-12'><div class='form-group'>");
		out.println("<select name='familiaProfesional'  id='familiaProfesional' onchange='obtenerDatosFamiliaProfesional(this.value)'><option value='0'>Selecciona una familia profesional</option>");
		while(rs.next()){
			int idFamiliaProfesional= rs.getInt(1);
			String nombreFamiliaProfesional=rs.getString(2);
			out.println("<option value='"+idFamiliaProfesional+"'>"+nombreFamiliaProfesional+"</option>");
		}
		out.println("</select>");
	}
	

	%>
</body>
</html>