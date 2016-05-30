<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<%@ page import="entities.*" %>
<% Usuario usuario = (Usuario)session.getAttribute("sesion");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String q = request.getParameter("q");

	if(q.length()<=3){
		
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT * FROM empresa");
		  
     	 while(rs.next()){
     		
     		out.println("<div> <tr id='empresa"+rs.getInt(1)+"'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td><a value='"+rs.getInt(1)+"' href='./panelModificarUsuario.jsp?a="+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarEmpresa' onclick='eliminarEmpresa(this.id)' id='"+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
     		
	  }
	}
	else{
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT * FROM empresa where nombre like '%"+q+"%' OR acronimo LIKE '%"+q+"%' OR rubro LIKE '%"+q+"%' OR direccionFiscal LIKE '%"+q+"%' OR region LIKE '%"+q+"%' OR ciudad LIKE '%"+q+"%' OR telefono LIKE '%"+q+"%' OR email LIKE '%"+q+"%'");
		  
     	 while(rs.next()){
     		
				out.println("<div> <tr id='"+rs.getInt(1)+"'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td><a value='"+rs.getInt(1)+"' href='./panelModificarUsuario.jsp?a="+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarUsuario' onclick='eliminarUsuario(this.id)' id='"+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
     		
		}
	}
	

	%>
</body>
</html>