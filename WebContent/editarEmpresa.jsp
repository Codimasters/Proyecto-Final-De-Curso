<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %> 
<%@ page import="entities.*" %>
  <%
  Usuario usuario = (Usuario)session.getAttribute("sesion");
  String idEmpresa=(String)request.getParameter("idEmpresa");
  boolean comprobar=false;
  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
	  comprobar=true;
  }
  else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
	  if(usuario.getResponsableEmpresa().getEmpresa().getIdEmpresa()==(int)Integer.parseInt(idEmpresa)){
		  comprobar=true;
	  }
  }
  
  if(comprobar==true){
	  String acronimo=(String)request.getParameter("acronimo");
		String rubro=(String)request.getParameter("rubro");
		String direccionFiscal=(String)request.getParameter("direccionFiscal");
		String region=(String)request.getParameter("region");
		String ciudad=(String)request.getParameter("ciudad");
		int telefono=(int)Integer.parseInt((String)request.getParameter("telefono"));
		String email=(String)request.getParameter("email");
	 
	  //                                    -TODOS LOS TIPOS DE USUARIO-
	 ;
	  Conexion conexion= new Conexion();
	  Statement st= conexion.conectar().createStatement();
	  
		  st.executeUpdate("UPDATE empresa SET acronimo='"+acronimo+"', rubro='"+rubro+"', direccionFiscal='"+direccionFiscal+"', region='"+region+"', ciudad='"+ciudad+"', telefono='"+telefono+"', email='"+email+"' WHERE idEmpresa='"+idEmpresa+"'");  
	  
		  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			  out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarCentro');</script>");
			    
		  }
		  else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			  if(usuario.getProfesor().getCentro().getIdCentro()==(int)Integer.parseInt(idEmpresa)){
				  out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp#modificarCentro');</script>");
				    
			  }
		  }
	    
  }
	
  %>