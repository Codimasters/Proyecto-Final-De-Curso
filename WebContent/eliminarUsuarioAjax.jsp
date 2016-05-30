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
		int tipoUsuario=0;
		int idCentro=0;
		ResultSet rs= st.executeQuery("SELECT idTipoUsuario FROM usuario where idUsuario='"+q+"'");
		  
     	 if(rs.next()){
     		tipoUsuario= rs.getInt(1);
     	}
     	 
     	 if(tipoUsuario==6){
     		rs= st.executeQuery("SELECT idCentro FROM profesor where idUsuario='"+q+"'");
  		  
        	 if(rs.next()){
        		idCentro= rs.getInt(1);
        		st.executeUpdate("delete from centro where idCentro='"+idCentro+"'");
        	}	 
     	 }
		
		//st.executeUpdate("delete from login where idLogin='"+cambio+"'");
		
		
	}
%>
</body>
</html>