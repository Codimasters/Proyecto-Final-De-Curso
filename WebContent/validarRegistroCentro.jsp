<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<% 
String nombreCentro ="";
String nombreGrado="";
String nombreEspecializacion="";
nombreGrado = (String)request.getParameter("grado");
nombreCentro = (String)request.getParameter("nombreCentro");
nombreEspecializacion = (String)request.getParameter("nombreEspecializacion");
String familiaProfesional ="";
familiaProfesional = (String)request.getParameter("familiaProfesional");
Conexion conexion= new Conexion();
Statement st= conexion.conectar().createStatement();
System.out.println("AQUI JODER: "+nombreGrado);
System.out.println("AQUI JODER2: "+nombreCentro);

if(request.getParameter("nombreCentro")!="" && request.getParameter("familiaProfesional")=="" && request.getParameter("nombreGrado")=="" && request.getParameter("nombreEspecializacion")==""){
	System.out.println("AQUI");
	ResultSet rs= st.executeQuery("SELECT nombreCentro from centro where nombreCentro='"+nombreCentro+"'");
	
	if(!rs.next()){
		st.executeUpdate("insert into centro(nombreCentro) values('"+nombreCentro+"')");
	}
	
}
else if(request.getParameter("nombreCentro")!="" && request.getParameter("familiaProfesional")!="" && request.getParameter("nombreGrado")=="" && request.getParameter("nombreEspecializacion")==""){
	
	ResultSet rs= st.executeQuery("SELECT nombre from familiaProfesional where nombre='"+familiaProfesional+"'");
	if(!rs.next()){
		st.executeUpdate("insert into familiaProfesional(nombre) values('"+familiaProfesional+"')");
		st.executeUpdate("insert into relacionCF(idCentro,idFamiliaProfesional) values('"+nombreCentro+"',last_insert_id())");
	}
}
else if(request.getParameter("nombreCentro") !="" && request.getParameter("familiaProfesional")!="" && request.getParameter("nombreGrado") != "" && request.getParameter("nombreEspecializacion")==""){

	ResultSet rs= st.executeQuery("SELECT nombre from grado where nombre='"+nombreGrado+"'");
	if(!rs.next()){
		st.executeUpdate("insert into grado(nombre) values('"+nombreGrado+"')");
		st.executeUpdate("insert into relacionFG(idFamiliaProfesional,idGrado) values('"+familiaProfesional+"',last_insert_id())");
	}
}
else if(request.getParameter("nombreEspecializacion") !="" && request.getParameter("familiaProfesional")!="" && request.getParameter("nombreGrado") != "" && request.getParameter("nombreEspecializacion") != ""){

	ResultSet rs= st.executeQuery("SELECT nombre from especializacion where nombre='"+nombreEspecializacion+"'");
	if(!rs.next()){
		st.executeUpdate("insert into especializacion(nombre) values('"+nombreEspecializacion+"')");
		st.executeUpdate("insert into relacionGE(idGrado,idEspecializacion) values('"+nombreGrado+"',last_insert_id())");
	}
}

%>