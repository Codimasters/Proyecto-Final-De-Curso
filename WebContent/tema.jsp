<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="entities.*" %>    
<%
Usuario usuario = (Usuario)session.getAttribute("sesion");

int temita = (int)Integer.parseInt(request.getParameter("tema"));


switch(temita){
	case 1:
		session.removeAttribute("tema");
		session.setAttribute("tema", "1");
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box");
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
	case 2:
		session.removeAttribute("tema");
		session.setAttribute("tema", "2");
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-minimalista");
		session.setAttribute("temaCaja", "box");
		
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
	case 3:
		session.removeAttribute("tema");
		session.setAttribute("tema", "3");
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box-inverse");
		
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
	case 4:
		session.removeAttribute("tema");
		session.setAttribute("tema", "4");
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box");
		
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
	case 5:
		session.removeAttribute("tema");
		session.setAttribute("tema", "5");
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box");
		
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
	case 6:
		session.removeAttribute("tema");
		session.setAttribute("tema", 6);
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-default");
		session.setAttribute("temaCaja", "box");
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
	default:
		session.removeAttribute("tema");
		session.removeAttribute("temaNav");
		session.setAttribute("tema", 1);
		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp');</script>");
		}
		else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp');</script>");
		}
		break;
}
System.out.println("tema"+usuario.getTipoUsuario().getIdTipoUsuario());
%>