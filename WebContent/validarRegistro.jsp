<%@ page language="java" import="utilidades.jdbc_utils" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.util.Arrays" %>
<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="entities.*" %>


<%
String nombre = (String)request.getParameter("nombre");
String apellido1 = (String)request.getParameter("apellido1");
String apellido2 = (String)request.getParameter("apellido2");
String dni = (String)request.getParameter("dni");
String email = (String)request.getParameter("email");
int telefono = (int)Integer.parseInt(request.getParameter("telefono"));
String nombreCentro = (String)request.getParameter("nombreCentro");
String especializacion = (String)request.getParameter("especializacion");
System.out.println("IDEspecializacion mal: "+especializacion);
String familiaProfesional = (String)request.getParameter("familiaProfesional");
String grado = (String)request.getParameter("grado");
String username = (String)request.getParameter("username");
String password = (String)request.getParameter("password");
String tipoRegistro = (String)request.getParameter("tipoRegistro");
String idEmpresa = "";
Usuario usuario = (Usuario)session.getAttribute("sesion");
switch(Integer.parseInt(tipoRegistro)){
	case 1:
		String materia = (String)request.getParameter("materia");
		OperacionesBd.registrarProfesor(nombre, apellido1, apellido2, email, telefono, nombreCentro, especializacion, familiaProfesional, grado, username, password, tipoRegistro, dni, materia,0);
		
		if (usuario!=null){
			if (usuario.getTipoUsuario().getIdTipoUsuario()==5){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");	
			}
			if (usuario.getTipoUsuario().getIdTipoUsuario()==6){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp#modificarUsuario');</script>");	
			}
			
			
		}
		else{
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}

		break;
	case 2:
		OperacionesBd.registrarAlumno(nombre, apellido1, apellido2, email, telefono, nombreCentro, especializacion, familiaProfesional, grado, username, password, tipoRegistro, dni);
		
		if (usuario!=null){
			if (usuario.getTipoUsuario().getIdTipoUsuario()==5){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");	
			}
			if (usuario.getTipoUsuario().getIdTipoUsuario()==6){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp#modificarUsuario');</script>");	
			}
			
			
		}
		else{
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp#modificarUsuario');</script>");
		}

		break;
	case 3:
		idEmpresa = (String)request.getParameter("idEmpresa");
		OperacionesBd.registrarResponsableEmpresa(nombre,apellido1,apellido2,email,telefono,username,tipoRegistro,dni,idEmpresa);
		
		if (usuario!=null){
			if (usuario.getTipoUsuario().getIdTipoUsuario()==5){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");	
			}
			
			
		}
		break;
	case 4:
		idEmpresa = (String)request.getParameter("idEmpresa");
		OperacionesBd.registrarTutor(nombre, apellido1, apellido2,email, telefono, username,password,tipoRegistro,dni,idEmpresa);
		
		if (usuario!=null){
			if (usuario.getTipoUsuario().getIdTipoUsuario()==5){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");	
			}
			
			if (usuario.getTipoUsuario().getIdTipoUsuario()==3){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp#modificarUsuario');</script>");	
			}
			
			
		}

		break;
	case 6:
		materia = (String)request.getParameter("materia");
		OperacionesBd.registrarProfesor(nombre, apellido1, apellido2, email, telefono, nombreCentro, especializacion, familiaProfesional, grado, username, password, tipoRegistro, dni, materia,1);
		if (usuario!=null){
			if (usuario.getTipoUsuario().getIdTipoUsuario()==5){
				out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");	
			}
			
			
		}

		break;
}





%>
