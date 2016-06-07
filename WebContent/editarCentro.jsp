<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %>
<%@ page import="entities.*" %>
  <%
 
  String idCentro = (String)request.getParameter("idCentro");
  Usuario usuario = (Usuario)session.getAttribute("sesion");
  boolean comprobar= false;
  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
	  comprobar=true;
  }
  else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
	  if(usuario.getProfesor().getCentro().getIdCentro()==(int)Integer.parseInt(idCentro)){
		  comprobar=true;
	  }
  }
  else{
	  out.println("<script>window.location.replace('/proyecto_final_curso/faces/cerrarSesion.jsp');</script>");
  }
  
  if (comprobar==true){
	  String nombreCentro = (String)request.getParameter("nombreCentro");
	  int rmFamiliaProfesional= (int)Integer.parseInt(request.getParameter("rmFamiliaProfesional"));


	  Conexion conexion= new Conexion();
	  Statement st= conexion.conectar().createStatement();
	  st.executeUpdate("UPDATE centro SET nombreCentro='"+nombreCentro+"' WHERE idCentro='"+idCentro+"'");  
	  //                             1) Si la lista de alumnos no esta vacia y tiene elementos...
	  if(rmFamiliaProfesional!=0){
		  st.executeUpdate("DELETE FROM relacionPE WHERE idEspecializacion=(select idEspecializacion from relacionGE where idGrado=(select idGrado from relacionFG where idFamiliaProfesional='"+rmFamiliaProfesional+"'))");
		  st.executeUpdate("DELETE FROM relacionPG WHERE idGrado=(select idGrado from relacionFG where idFamiliaProfesional='"+rmFamiliaProfesional+"')");
		  st.executeUpdate("DELETE FROM relacionPF WHERE idFamiliaProfesional='"+rmFamiliaProfesional+"'");
		  st.executeUpdate("DELETE FROM relacionGE WHERE idGrado=(select idGrado from relacionFG where idFamiliaProfesional='"+rmFamiliaProfesional+"')");
		  
		  st.executeUpdate("DELETE FROM relacionFG WHERE idCentro='"+idCentro+"' AND idFamiliaProfesional='"+rmFamiliaProfesional+"'");
		  
		  st.executeUpdate("DELETE FROM relacionCF WHERE idCentro='"+idCentro+"' AND idFamiliaProfesional='"+rmFamiliaProfesional+"'");
		  
		  
		    
	  }

	  
//	                                   1) Si la lista de profesores no esta vacia y tiene elementos...
	
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarCentro');</script>");
		    
	  }
	  else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
		  if(usuario.getProfesor().getCentro().getIdCentro()==(int)Integer.parseInt(idCentro)){
			  out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp#modificarCentro');</script>");
			    
		  }
	  }
	  
  }
  
  %>