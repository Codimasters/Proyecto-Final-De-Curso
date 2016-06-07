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
		st.executeUpdate("DELETE FROM relacionPE WHERE idEspecializacion=(select idEspecializacion from relacionGE where idCentro='"+cambio+"')");
		  st.executeUpdate("DELETE FROM relacionPG WHERE idGrado=(select idGrado from relacionFG where idCentro='"+cambio+"')");
		  st.executeUpdate("DELETE FROM relacionPF WHERE idFamiliaProfesional=(select idFamiliaProfesional from relacionCF where idCentro='"+cambio+"')");
		  st.executeUpdate("DELETE FROM relacionGE WHERE idGrado=(select idGrado from relacionFG where idCentro='"+cambio+"')");
		  
		  st.executeUpdate("DELETE FROM relacionFG WHERE idCentro='"+cambio+"'");
		  
		  st.executeUpdate("DELETE FROM relacionCF WHERE idCentro='"+cambio+"'");
		  st.executeUpdate("DELETE FROM login where idLogin=(select idUsuario from alumno WHERE idCentroAlumno='"+cambio+"')");
		  st.executeUpdate("DELETE FROM login where idLogin=(select idUsuario from profesor WHERE idCentro='"+cambio+"')");
		  st.executeUpdate("DELETE FROM centro WHERE idCentro='"+cambio+"'");
		  

	}
 

  }
  %>