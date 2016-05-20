

<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="packageConexion.*" %>

<%
String nombre = (String)request.getParameter("nombreusuario");
String password = (String)request.getParameter("password");
System.out.println(nombre);
System.out.println(password);
Conexion conect= new Conexion();
OperacionesBd operaciones= new OperacionesBd();
//operaciones.consulta();
//String apellido = "Carlos";
operaciones.login(nombre,password);
conect.desconectar();


//conect.consulta();
%>
<html>
<body>
<h2>Hello World!</h2>
</body>
</html>