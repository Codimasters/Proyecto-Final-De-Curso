<%@page import="url.*"%>
<%@ page language="java" import="entities.*" %>
<html>
<head>
</head>
<body>
	<%
	
	Usuario usuario= (Usuario)session.getAttribute("usuario");
	out.println("<h1>Se encuentra logeado con un usuario de tipo "+usuario.getTipoUsuario().getNombre()+"<h1>");	

	
	%>
</body>
</html>