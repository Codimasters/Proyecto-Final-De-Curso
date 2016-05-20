<%@ page language="java" import="utilidades.jdbc_utils" %>
<%@ page language="java" import="java.util.ArrayList" %>
<%@ page language="java" import="java.util.Arrays" %>
<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="entities.*" %>


<%
String nombre = (String)request.getParameter("nombreusuario");
String password = (String)request.getParameter("password");
Usuario comprobacion= OperacionesBd.login(nombre,password);


System.out.println(comprobacion.getIdUsuario());

if (comprobacion.getIdUsuario()!=null){
	session.setAttribute("usuario", comprobacion);
	out.println(comprobacion.getAlumno().getCentro().getNombreCentro());
	
			//out.println(url.url.redirigir("usuario.jsp"));
	

}
else{
	out.println("<script>alert('Se ha equivocado de contraseña o no está registrado')</script>");
	out.println(url.url.redirigir("index.jsp"));
}




/*
//-------------------------------------------------------------------------------
//--------------------------------CONSULTAS--------------------------------------
//-------------------------------------------------------------------------------
//-CONSULTA PARA SACAR LOS NOMBRES Y APELLIDOS (PARA LA PARTE VISUAL DEL OPTION)-
String consulta = jdbc_utils.jdbc_query("SELECT * FROM usuario", "idUsuario, idTipoUsuario");
String[] consultaza = consulta.split(",[ ]*");

//-CONSULTA PARA SACAR LOS ID'S (DATOS DEL VALUE DEL OPTION)-
String datos = jdbc_utils.jdbc_query("SELECT * FROM usuario", "idUsuario, idTipoUsuario");
String[] datazos = datos.split(",[ ]*");

//-EL SELECT DINAMICO CON LOS DATOS DE LA BD-
out.println("<select>");
for (int i = 0; i < datazos.length; i++){
    out.println("<option value="+datazos[i]+">"+consultaza[i]+"</option>");
}
out.println("</select>");

out.println(consulta);
*/
//--------------------------------INSERTAR----------------------------------------------------------
//jdbc_utils.jdbc_insert("INSERT INTO Usuarios values(NULL, 'Sergio', 'Lucena', 'Fernandez', 'IES Leopoldo Queipo', 'alumno')");

//jdbc_utils.jdbc_mysql_close();

//conect.consulta();
%>
