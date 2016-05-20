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
int telefono = Integer.parseInt(request.getParameter("telefono"));
String nombreCentro = (String)request.getParameter("nombreCentro");
String especializacion = (String)request.getParameter("especializacion");
System.out.println("IDEspecializacion mal: "+especializacion);
String familiaProfesional = (String)request.getParameter("familiaProfesional");
String grado = (String)request.getParameter("grado");
String username = (String)request.getParameter("username");
String password = (String)request.getParameter("password");
String tipoRegistro = (String)request.getParameter("tipoRegistro");



//OperacionesBd.login(nombre,password);

//out.println(url.url.redirigir("usuario.jsp"));
out.println("Tu nombre: "+nombre);
out.println("Tu primer apellido: "+apellido1);
out.println("Tu segundo apellido: "+apellido2);
out.println("Tu email: "+email);
out.println("Tu telefono: "+telefono);
out.println("Tu centro es: "+nombreCentro);
out.println("Tu especializacion: "+especializacion);
out.println("Tu familia profesional: "+familiaProfesional);
out.println("Tu grado: "+grado);
out.println("Tu nombre de usuario: "+username);
out.println("Tu contrasenia: "+password);

switch(Integer.parseInt(tipoRegistro)){
	case 1:
		String materia = (String)request.getParameter("materia");
		OperacionesBd.registrarProfesor(nombre, apellido1, apellido2, email, telefono, nombreCentro, especializacion, familiaProfesional, grado, username, password, tipoRegistro, dni, materia);
		break;
	case 2:
		OperacionesBd.registrarAlumno(nombre, apellido1, apellido2, email, telefono, nombreCentro, especializacion, familiaProfesional, grado, username, password, tipoRegistro, dni);
		break;
		
	case 4:
		String idEmpresa = (String)request.getParameter("idEmpresa");

		OperacionesBd.registrarTutor(nombre, apellido1, apellido2,email, telefono, username,password,tipoRegistro,dni,idEmpresa);
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
