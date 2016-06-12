<%@ page language="java" import="utilidades.jdbc_utils" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.util.Arrays" %>
<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="entities.*" %>


<%
String nombre = (String)request.getParameter("nombreusuario");
String password = (String)request.getParameter("password");
Usuario comprobacion= OperacionesBd.login(nombre,password);

session.setAttribute("sesion", comprobacion);




if (comprobacion.getIdUsuario()!=null){
	session.setAttribute("usuario", comprobacion);
			//out.println(url.url.redirigir("usuario.jsp"));
	if (comprobacion.getTipoUsuario().getIdTipoUsuario() == 5){
		session.setAttribute("temaNav", "navbar-inverse");
		out.println(url.url.redirigir("./paneles/inicio.jsp"));

	}
	else if (comprobacion.getTipoUsuario().getIdTipoUsuario() == 1){
		session.setAttribute("temaNav", "navbar-inverse");
		out.println(url.url.redirigir("./paneles/inicioProfesor.jsp"));
		Usuario usuario = (Usuario)session.getAttribute("sesion");

	}
	else if (comprobacion.getTipoUsuario().getIdTipoUsuario() == 2){
		session.setAttribute("temaNav", "navbar-inverse");
		out.println(url.url.redirigir("./paneles/inicioAlumno.jsp"));
		Usuario usuario = (Usuario)session.getAttribute("sesion");

	}
	else if (comprobacion.getTipoUsuario().getIdTipoUsuario() == 3){
		session.setAttribute("temaNav", "navbar-inverse");
		out.println(url.url.redirigir("./paneles/inicioResponsableEmpresa.jsp"));
		Usuario usuario = (Usuario)session.getAttribute("sesion");

	}
	else if (comprobacion.getTipoUsuario().getIdTipoUsuario() == 4){
		session.setAttribute("temaNav", "navbar-inverse");
		out.println(url.url.redirigir("./paneles/inicioTutor.jsp"));
		Usuario usuario = (Usuario)session.getAttribute("sesion");

	}
	else if (comprobacion.getTipoUsuario().getIdTipoUsuario() == 6){
		session.setAttribute("temaNav", "navbar-inverse");
		out.println(url.url.redirigir("./paneles/inicioDirector.jsp"));
		Usuario usuario = (Usuario)session.getAttribute("sesion");

	}
	
}

else{
	out.println("<script>alert('Se ha equivocado de contraseña o no está registrado')</script>");
	out.println(url.url.redirigir("index.jsp"));
}


%>
