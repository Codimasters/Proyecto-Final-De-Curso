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
		st.executeUpdate("delete from empresa where idEmpresa='"+cambio+"'");
		st.executeUpdate("delete from login where idUsuario=(select idUsuario from responsableEmpresa where idEmpresa='"+cambio+"')");
		st.executeUpdate("delete from relacionPT where idTutor=(select idUsuario from tutor where idEmpresa='"+cambio+"')");
		st.executeUpdate("delete from login where idUsuario=(select idUsuario from tutor where idEmpresa='"+cambio+"')");

	}
%>
</body>
</html>