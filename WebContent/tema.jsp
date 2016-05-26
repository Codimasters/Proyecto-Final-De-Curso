<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int temita = (int)Integer.parseInt(request.getParameter("tema"));
System.out.println("tema: "+temita);
/*if (temita == 1){
	session.removeAttribute("tema");
	session.setAttribute("tema", 1);
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
}
else if(temita == 2){
	session.removeAttribute("tema");
	session.setAttribute("tema", "2");
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
}
else if(temita == 3){
	session.removeAttribute("tema");
	session.setAttribute("tema", 3);
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
}
else if(temita == 4){
	session.removeAttribute("tema");
	session.setAttribute("tema", 4);
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
}

else{
	session.removeAttribute("tema");
	session.setAttribute("tema", 1);
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
}*/

switch(temita){
	case 1:
		session.removeAttribute("tema");
		session.setAttribute("tema", 1);
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box");
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
	case 2:
		session.removeAttribute("tema");
		session.setAttribute("tema", "2");
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-minimalista");
		session.setAttribute("temaCaja", "box");
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
	case 3:
		session.removeAttribute("tema");
		session.setAttribute("tema", 3);
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box-inverse");
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
	case 4:
		session.removeAttribute("tema");
		session.setAttribute("tema", 4);
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box");
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
	case 5:
		session.removeAttribute("tema");
		session.setAttribute("tema", 5);
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-inverse");
		session.setAttribute("temaCaja", "box");
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
	case 6:
		session.removeAttribute("tema");
		session.setAttribute("tema", 6);
		session.removeAttribute("temaNav");
		session.removeAttribute("temaCaja");
		session.setAttribute("temaNav", "navbar-default");
		session.setAttribute("temaCaja", "box");
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
	default:
		session.removeAttribute("tema");
		session.removeAttribute("temaNav");
		session.setAttribute("tema", 1);
		out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');</script>");
		break;
}
;
%>