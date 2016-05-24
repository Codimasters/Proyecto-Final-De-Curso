<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %>

  <%
  String idUsuario = (String)request.getParameter("idUsuario");
  String username = (String)request.getParameter("username");
  String password = (String)request.getParameter("password");
  String nombre = (String)request.getParameter("nombre");
  String apellido1 = (String)request.getParameter("apellido1");
  String apellido2 = (String)request.getParameter("apellido2");
  String dni = (String)request.getParameter("dni");
  String email = (String)request.getParameter("email");
  String telefono = (String)request.getParameter("telefono");

  int idTipoUsuario=(int)Integer.parseInt(request.getParameter("idTipoUsuario"));
  System.out.println(idTipoUsuario);
  Conexion conexion= new Conexion();
  Statement st= conexion.conectar().createStatement();
  
  if(password!=""){		  
	  st.executeUpdate("UPDATE login SET username='"+username+"', password='"+md5.MD5(password)+"' WHERE idLogin='"+idUsuario+"'");  
  }
  else{
	  st.executeUpdate("UPDATE login SET username='"+username+"' WHERE idLogin='"+idUsuario+"'");
  }
  
  st.executeUpdate("UPDATE datosPersonales SET nombre='"+nombre+"', apellido1='"+apellido1+"', apellido2='"+apellido2+"', dni='"+dni+"' WHERE idUsuario='"+idUsuario+"'");
  st.executeUpdate("UPDATE datosContacto SET email='"+email+"', telefono='"+telefono+"' WHERE idUsuario='"+idUsuario+"'");
  
  if(idTipoUsuario==1 || idTipoUsuario==6){
	  String materia = (String)request.getParameter("materia");
	  
	  
	  st.executeUpdate("UPDATE profesor SET materia='"+materia+"' WHERE idUsuario='"+idUsuario+"'");
	  
  }
  
  else if(idTipoUsuario==2){
	  int expediente = (int)Integer.parseInt(request.getParameter("expediente"));	  
	  if(password!=""){
		  st.executeUpdate("UPDATE login SET username='"+username+"', password='"+md5.MD5(password)+"' WHERE idLogin='"+idUsuario+"'");  
	  }
	  else{
		  st.executeUpdate("UPDATE login SET username='"+username+"' WHERE idLogin='"+idUsuario+"'");
	  }
	  
	  st.executeUpdate("UPDATE alumno SET expediente='"+expediente+"' WHERE idUsuario='"+idUsuario+"'");
	  
  }
  
  
  
  %>