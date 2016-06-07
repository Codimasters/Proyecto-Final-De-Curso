<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<%@page import="entities.*"%>
<% 
String nombreCentro =null;
String nombreGrado=null;
String nombreEspecializacion=null;
nombreGrado = (String)request.getParameter("grado");
nombreCentro = (String)request.getParameter("nombreCentro");
nombreEspecializacion = (String)request.getParameter("nombreEspecializacion");
String familiaProfesional =null;
familiaProfesional = (String)request.getParameter("familiaProfesional");
Conexion conexion= new Conexion();
Statement st= conexion.conectar().createStatement();

if(nombreCentro!=null && familiaProfesional==null && nombreGrado==null && nombreEspecializacion==null){
	ResultSet rs= st.executeQuery("SELECT nombreCentro from centro where nombreCentro='"+nombreCentro+"'");
	
	if(!rs.next()){
		st.executeUpdate("insert into centro(nombreCentro) values('"+nombreCentro+"')");
	}
	
}
else if(nombreCentro!=null && familiaProfesional!=null && nombreGrado==null && nombreEspecializacion==null){
	
	ResultSet rs= st.executeQuery("SELECT nombre from familiaProfesional where nombre='"+familiaProfesional+"'");
	if(!rs.next()){
		st.executeUpdate("insert into familiaProfesional(nombre) values('"+familiaProfesional+"')");
		st.executeUpdate("insert into relacionCF(idCentro,idFamiliaProfesional) values('"+nombreCentro+"',last_insert_id())");	
	}
	else{
		rs= st.executeQuery("SELECT idFamiliaProfesional from familiaProfesional where nombre='"+familiaProfesional+"'");
		if(rs.next()){
			int idFamiliaProfesional=rs.getInt(1);
			rs= st.executeQuery("SELECT idFamiliaProfesional from relacionCF where idFamiliaProfesional='"+idFamiliaProfesional+"' and idCentro='"+nombreCentro+"'");
			if(!rs.next()){
				st.executeUpdate("insert into relacionCF(idCentro,idFamiliaProfesional) values('"+nombreCentro+"','"+idFamiliaProfesional+"')");
			}
		}
	}	
}
else if(nombreCentro!=null && familiaProfesional!=null && nombreGrado != null && nombreEspecializacion==null){

	ResultSet rs= st.executeQuery("SELECT nombre from grado where nombre='"+nombreGrado+"'");
	if(!rs.next()){
		st.executeUpdate("insert into grado(nombre) values('"+nombreGrado+"')");
		st.executeUpdate("insert into relacionFG(idFamiliaProfesional,idGrado,idCentro) values('"+familiaProfesional+"',last_insert_id(),'"+nombreCentro+"')");
	}
	else{
		rs=st.executeQuery("select idGrado from grado where nombre='"+nombreGrado+"'");
		if(rs.next()){
			int idGrado=rs.getInt(1);
			rs= st.executeQuery("SELECT idGrado from relacionFG where idGrado='"+idGrado+"' and idCentro='"+nombreCentro+"'");
			if(!rs.next()){
				st.executeUpdate("insert into relacionFG(idFamiliaProfesional,idGrado,idCentro) values('"+familiaProfesional+"','"+idGrado+"','"+nombreCentro+"')");
			}
			
		}
		
		
	}
}
else if(nombreEspecializacion!=null && familiaProfesional!=null && nombreGrado!= null && nombreEspecializacion!= null){

	ResultSet rs= st.executeQuery("SELECT nombre from especializacion where nombre='"+nombreEspecializacion+"'");
	if(!rs.next()){
		st.executeUpdate("insert into especializacion(nombre) values('"+nombreEspecializacion+"')");
		st.executeUpdate("insert into relacionGE(idGrado,idEspecializacion,idCentro) values('"+nombreGrado+"',last_insert_id(),'"+nombreCentro+"')");
	}
	else{
		rs=st.executeQuery("select idEspecializacion from especializacion where nombre='"+nombreEspecializacion+"'");
		if(rs.next()){
			int idEspecializacion=rs.getInt(1);
			rs= st.executeQuery("SELECT idEspecializacion from relacionGE where idEspecializacion='"+idEspecializacion+"' and idCentro='"+nombreCentro+"'");
			if(!rs.next()){
				st.executeUpdate("insert into relacionGE(idEspecializacion,idGrado,idCentro) values('"+idEspecializacion+"','"+nombreGrado+"','"+nombreCentro+"')");	
			}
			
		}
	}
}
Usuario usuario = (Usuario)session.getAttribute("sesion");
if (usuario.getTipoUsuario().getIdTipoUsuario()==5){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");	
}
if (usuario.getTipoUsuario().getIdTipoUsuario()==6){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp#modificarUsuario');</script>");	
}

%>