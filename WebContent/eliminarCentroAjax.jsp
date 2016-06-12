<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %>
<%@ page import="entities.*" %>
  <%
  Usuario usuario = (Usuario)session.getAttribute("sesion");
  String q = request.getParameter("q");
	int cambio= Integer.parseInt(q);
  boolean comprobar=false;
  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
	  comprobar=true;
  }
  else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
	  if(usuario.getProfesor().getCentro().getIdCentro()==cambio){
		  comprobar=true;
	  }
  }
  
  
  if(comprobar==true){
	if(cambio!=0){
				
		Conexion conexion= new Conexion();
		Statement st= conexion.conectar().createStatement();
		  st.executeUpdate("DELETE FROM login where idLogin in(select idUsuario from alumno WHERE idCentroAlumno='"+cambio+"')");
		  st.executeUpdate("DELETE FROM login where idLogin in (select idUsuario from profesor WHERE idCentro='"+cambio+"')");
		  st.executeUpdate("DELETE FROM centro WHERE idCentro='"+cambio+"'");
		  
		  if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			   session.invalidate();
			   response.sendRedirect("http://localhost:8080/proyecto_final_curso/faces/");
		  }
		  
		 
		  

	}
 

  }
  %>