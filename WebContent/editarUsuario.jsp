<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controladoresConexion.md5" %>
<%@ page import="packageConexion.*" %>    
<%@ page import="java.sql.*" %>
<%@ page import="entities.*" %>
  <%
 
  String idUsuario = (String)request.getParameter("idUsuario");
  Usuario usuario = (Usuario)session.getAttribute("sesion");
  boolean comprobar1= false;
  
  int idCentro=0;
  Conexion conexion= new Conexion();
  Statement st= conexion.conectar().createStatement();

  int idTipoUsuario=(int)Integer.parseInt(request.getParameter("idTipoUsuario"));
  if (idTipoUsuario==1){
		  ResultSet rs= st.executeQuery("SELECT idCentro FROM profesor WHERE idUsuario = '"+idUsuario+"'");
			while(rs.next()){
				idCentro=rs.getInt(1);
	
	 	 }
	
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){

		 	comprobar1=true;
	  
  	 }
	  else if(usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
	  else if(usuario.getProfesor()!=null){
		  if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
			  if(usuario.getProfesor().getCentro().getIdCentro()==idCentro){
				  comprobar1=true;  
			  }
			  
		  }
	  }
  }
  else if(idTipoUsuario==2){
	  ResultSet rs= st.executeQuery("SELECT idCentroAlumno FROM alumno WHERE idUsuario = '"+idUsuario+"'");
		while(rs.next()){
			idCentro=rs.getInt(1);

 	 }

  		if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
	 			comprobar1=true;
  
	 	}
  		else if(usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
  			comprobar1=true;
  		}
  		
  		else if(usuario.getProfesor().getCentro()!=null){
  			
	  		if(usuario.getProfesor().getCentro().getIdCentro()==idCentro ){
		  		comprobar1=true;
		  		
	  		}
	  		else if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
	  			comprobar1=true;
	  		}
  		}	  
  }
  else if(idTipoUsuario==3){
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  comprobar1=true;
	  }
	  else if(usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
  }
  
  else if(idTipoUsuario==4){
	  ResultSet rs= st.executeQuery("SELECT idEmpresa FROM tutor WHERE idUsuario = '"+idUsuario+"'");
	  int idEmpresa=0;
		while(rs.next()){
			idEmpresa=rs.getInt(1);

	 }

	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  comprobar1=true;
	  }
	  else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
		  comprobar1=true;
	  }
	  else if(usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
	  
	  else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
		  if(usuario.getResponsableEmpresa().getEmpresa().getIdEmpresa()==idEmpresa){
			  comprobar1=true;
		  }
	  }
	  else if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
			  comprobar1=true;
	  }
  }
  else if(idTipoUsuario==5){
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  comprobar1=true;
	  }
  }
  else if(idTipoUsuario==6){
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  comprobar1=true;
	  }
	  else if(usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
  }
  
  
  if(comprobar1==true){
	  
  
 
  String username = (String)request.getParameter("username");
  String password = (String)request.getParameter("password");
  String nombre = (String)request.getParameter("nombre");
  String apellido1 = (String)request.getParameter("apellido1");
  String apellido2 = (String)request.getParameter("apellido2");
  String dni = (String)request.getParameter("dni");
  String email = (String)request.getParameter("email");
  String telefono = (String)request.getParameter("telefono");

  
  

 
  //                                    -TODOS LOS TIPOS DE USUARIO-

  
  if(password!=""){
	  if (password!=null){
	  	st.executeUpdate("UPDATE login SET username='"+username+"', password='"+md5.MD5(password)+"' WHERE idLogin='"+idUsuario+"'");
	  }
  }
  else {
	  st.executeUpdate("UPDATE login SET username='"+username+"' WHERE idLogin='"+idUsuario+"'");
  }
  if (nombre!=null && apellido1!=null && apellido2!=null && dni!=null && idUsuario!=null && email!=null && telefono!=null){
	if (nombre!=null && apellido1!=null && apellido2!=null && dni!=null){
  		st.executeUpdate("UPDATE datosPersonales SET nombre='"+nombre+"', apellido1='"+apellido1+"', apellido2='"+apellido2+"', dni='"+dni+"' WHERE idUsuario='"+idUsuario+"'");
	}
  	st.executeUpdate("UPDATE datosContacto SET email='"+email+"', telefono='"+telefono+"' WHERE idUsuario='"+idUsuario+"'");
  }	
  
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
	  String[] addAlumnosACargo=null;
	  int rmAlumnosACargo=0;
	  rmAlumnosACargo= (int)Integer.parseInt(request.getParameter("rmAlumnosACargo"));
	 // se usa 'getParameterValues' si te devuelve una lista de strings, si devuelve un String se usa 'request.getParameter'
	   addAlumnosACargo= request.getParameterValues("addAlumnosACargo");
	  int rmProfesorTutor=0;
	  if (request.getParameter("rmProfesorTutor")!=null){
	  	rmProfesorTutor=(int)Integer.parseInt(request.getParameter("rmProfesorTutor"));
	  }
	  String[] addProfesorTutor=null;
	  if (request.getParameterValues("addProfesorTutor") != null){
	  	addProfesorTutor= request.getParameterValues("addProfesorTutor");
	  }
	  
	  
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
  
if(usuario.getTipoUsuario().getIdTipoUsuario()==1){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioProfesor.jsp#observarTusDatos');</script>");
}
else if(usuario.getTipoUsuario().getIdTipoUsuario()==2){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioAlumno.jsp#modificarUsuario');</script>");
}
else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioResponsableEmpresa.jsp#modificarUsuario');</script>");
}
else if(usuario.getTipoUsuario().getIdTipoUsuario()==4){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioTutor.jsp#modificarUsuario');</script>");
}
else if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');</script>");
}
else if(usuario.getTipoUsuario().getIdTipoUsuario()==6){
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/paneles/inicioDirector.jsp#modificarUsuario');</script>");
}
else{
	out.println("<script>window.location.replace('/proyecto_final_curso/faces/');</script>");
}
  
  }
  %>