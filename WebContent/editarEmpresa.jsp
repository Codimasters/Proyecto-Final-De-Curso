<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %>
  <% 
  	String idEmpresa=(String)request.getParameter("idEmpresa");
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
  
  out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarEmpresa');</script>");
  
  %>