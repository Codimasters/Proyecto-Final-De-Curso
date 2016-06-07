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
		ResultSet rs= st.executeQuery("SELECT * FROM centro");
		Statement st2 = conexion.conectar().createStatement();
		 while(rs.next()){
		   		int idCentro2=rs.getInt(1);
		   		System.out.println(idCentro2);
		   		String nombreCentro2=rs.getString(2);
		   		int cuentaFamilia=0;
		   		ResultSet rs2=st2.executeQuery("select count(*) from relacionCF WHERE idCentro='"+idCentro2+"'");
		   		if(rs2.next()){
		   			cuentaFamilia=rs2.getInt(1);
		   		}
		   		
		   		int cuentaGrado = 0;
		   		rs2=st2.executeQuery("select count(*) from relacionFG WHERE idCentro='"+idCentro2+"'");
		   		if(rs2.next()){
		   			cuentaGrado=rs2.getInt(1);
		   		}
		   		
		   		int cuentaEspecializacion = 0;
		   		rs2=st2.executeQuery("select count(*) from relacionGE WHERE idCentro='"+idCentro2+"'");
		   		if(rs2.next()){
		   			cuentaEspecializacion=rs2.getInt(1);
		   		}
		   		
					out.println("<div> <tr id='centro"+idCentro2+"'><td>"+nombreCentro2+"</td><td>"+cuentaFamilia+"</td><td>"+cuentaGrado+"</td><td>"+cuentaEspecializacion+"<a value='"+idCentro2+"' href='./panelModificarCentro.jsp?a="+idCentro2+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarCentro' onclick='eliminarCentro(this.id)' id='"+idCentro2+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
		 }
	}
	else{
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		ResultSet rs= st.executeQuery("SELECT * from centro where nombreCentro like '%"+q+"%'");
		Statement st2 = conexion.conectar().createStatement();
		while(rs.next()){
		   		int idCentro2=rs.getInt(1);
		   		System.out.println(idCentro2);
		   		String nombreCentro2=rs.getString(2);
		   		int cuentaFamilia=0;
		   		ResultSet rs2=st2.executeQuery("select count(*) from relacionCF WHERE idCentro='"+idCentro2+"'");
		   		if(rs2.next()){
		   			cuentaFamilia=rs2.getInt(1);
		   		}
		   		
		   		int cuentaGrado = 0;
		   		rs2=st2.executeQuery("select count(*) from relacionFG WHERE idCentro='"+idCentro2+"'");
		   		if(rs2.next()){
		   			cuentaGrado=rs2.getInt(1);
		   		}
		   		
		   		int cuentaEspecializacion = 0;
		   		rs2=st2.executeQuery("select count(*) from relacionGE WHERE idCentro='"+idCentro2+"'");
		   		if(rs2.next()){
		   			cuentaEspecializacion=rs2.getInt(1);
		   		}
		   		
					out.println("<div> <tr id='centro"+idCentro2+"'><td>"+nombreCentro2+"</td><td>"+cuentaFamilia+"</td><td>"+cuentaGrado+"</td><td>"+cuentaEspecializacion+"<a value='"+idCentro2+"' href='./panelModificarCentro.jsp?a="+idCentro2+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarCentro' onclick='eliminarCentro(this.id)' id='"+idCentro2+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");

	}
	
	}

%>
</body>
</html>