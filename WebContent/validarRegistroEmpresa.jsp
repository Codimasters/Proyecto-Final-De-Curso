<%@ page language="java" import="utilidades.jdbc_utils" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.util.Arrays" %>
<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="entities.*" %>


<%
String nombre = (String)request.getParameter("nombre");
String acronimo = (String)request.getParameter("acronimo");
String rubro = (String)request.getParameter("rubro");
String direccionFiscal = (String)request.getParameter("direccionFiscal");
String region = (String)request.getParameter("region");
String ciudad = (String)request.getParameter("ciudad");
int telefono = Integer.parseInt(request.getParameter("telefono"));

String email = (String)request.getParameter("email");



OperacionesBd.registrarEmpresa(nombre, acronimo, rubro,direccionFiscal,region,ciudad,telefono,email);
%>