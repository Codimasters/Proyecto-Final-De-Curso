<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %>
  <%
  String idUsuario = (String)request.getParameter("idUsuario");
  String username = (String)request.getParameter("username");
  String password = (String)request.getParameter("password");
  String nombre = (String)request.getParameter("nombre");
  String apellido1 = (String)request.getParameter("apellido1");
  String apellido2 = (String)request.getParameter("apellido2");
  String dni = (String)request.getParameter("dni");
  String email = (String)request.getParameter("email");
  String telefono = (String)request.getParameter("telefono");

  int idTipoUsuario=(int)Integer.parseInt(request.getParameter("idTipoUsuario"));
 
  //                                    -TODOS LOS TIPOS DE USUARIO-
  System.out.println(idTipoUsuario);
  Conexion conexion= new Conexion();
  Statement st= conexion.conectar().createStatement();
  
  if(password!=""){		  
	  st.executeUpdate("UPDATE login SET username='"+username+"', password='"+md5.MD5(password)+"' WHERE idLogin='"+idUsuario+"'");  
  }
  else {
	  st.executeUpdate("UPDATE login SET username='"+username+"' WHERE idLogin='"+idUsuario+"'");
  }
  
  st.executeUpdate("UPDATE datosPersonales SET nombre='"+nombre+"', apellido1='"+apellido1+"', apellido2='"+apellido2+"', dni='"+dni+"' WHERE idUsuario='"+idUsuario+"'");
  st.executeUpdate("UPDATE datosContacto SET email='"+email+"', telefono='"+telefono+"' WHERE idUsuario='"+idUsuario+"'");

  
//----------------------------------------------------------------------------------------------------------------------
  //*****************************************************************************************************************
  //*********************      TIPOS        DE         USUARIOS       A         EDITAR      *************************
  //*****************************************************************************************************************
  
  
  //                                    -PROFESORES O DIRECTORES-
  if(idTipoUsuario==1 || idTipoUsuario==6){
	  String materia = (String)request.getParameter("materia");
	  
	  
	  st.executeUpdate("UPDATE profesor SET materia='"+materia+"' WHERE idUsuario='"+idUsuario+"'");
	  
  }
  //                                           -ALUMNOS-  
  else if(idTipoUsuario==2){
	  int expediente = (int)Integer.parseInt(request.getParameter("expediente"));	  
	  
	  st.executeUpdate("UPDATE alumno SET expediente='"+expediente+"' WHERE idUsuario='"+idUsuario+"'");
	  
  }
  
  //                                           -TUTORES-
  else if(idTipoUsuario==4){
	  int rmAlumnosACargo= (int)Integer.parseInt(request.getParameter("rmAlumnosACargo"));
	 // se usa 'getParameterValues' si te devuelve una lista de strings, si devuelve un String se usa 'request.getParameter'
	  String[] addAlumnosACargo= request.getParameterValues("addAlumnosACargo");
	  int rmProfesorTutor=(int)Integer.parseInt(request.getParameter("rmProfesorTutor"));
	  String[] addProfesorTutor= request.getParameterValues("addProfesorTutor");
	  
	  
	  st.executeUpdate("update alumno set idTutor=NULL where idUsuario='"+rmAlumnosACargo+"'");
	  
	  //                             1) Si la lista de alumnos no esta vacia y tiene elementos...
	  if (addAlumnosACargo != null && addAlumnosACargo.length != 0) {
	  	  //                             2) Por cada alumno en la lista..
		  for(int i = 0 ; i < addAlumnosACargo.length ; i++){
			  //                             3) Seteame mi tutor para cada alumno de la lista.
			  st.executeUpdate("UPDATE alumno SET idTutor='"+idUsuario+"' WHERE idUsuario='"+addAlumnosACargo[i]+"'");
		  }
	  }
	  
	  st.executeUpdate("DELETE FROM relacionPT WHERE idProfesor='"+rmProfesorTutor+"' AND idTutor='"+idUsuario+"'");
	  
//                                   1) Si la lista de profesores no esta vacia y tiene elementos...
		if (addProfesorTutor != null && addProfesorTutor.length != 0) {
			//                             2) Por cada profesor en la lista..
			for(int i = 0 ; i < addProfesorTutor.length ; i++){
				//                             3) Seteame mi tutor para cada profesor de la lista.
				st.executeUpdate("INSERT INTO relacionPT(idProfesor, idTutor) VALUES('"+addProfesorTutor[i]+"', '"+idUsuario+"') ");
			}
		}
	  
  }
  
  out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");
  
  %>