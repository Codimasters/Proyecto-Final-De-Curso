<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<%@page import="entities.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

Usuario usuario = (Usuario)session.getAttribute("sesion");
boolean comprobar1= false;
String q = request.getParameter("q");
String idUsuario=q;
int idCentro=0;
int idTipoUsuario=0;
Conexion conexion= new Conexion();
Statement st= conexion.conectar().createStatement();
ResultSet rs=st.executeQuery("SELECT idTipoUsuario FROM usuario WHERE idUsuario='"+q+"'");
if (rs.next()){
	idTipoUsuario=rs.getInt(1);	
}
if (idTipoUsuario==1){
		  rs= st.executeQuery("SELECT idCentro FROM profesor WHERE idUsuario = '"+idUsuario+"'");
			while(rs.next()){
				idCentro=rs.getInt(1);
	
	 	 }
	
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5 || usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		 	comprobar1=true;
	  
	 }
	  else if(usuario.getProfesor()!=null){
		  if(usuario.getTipoUsuario().getIdTipoUsuario()==6 && usuario.getProfesor().getCentro().getIdCentro()==idCentro){
			  comprobar1=true;
		  }
	  }
}
else if(idTipoUsuario==2){
	  rs= st.executeQuery("SELECT idCentroAlumno FROM alumno WHERE idUsuario = '"+idUsuario+"'");
		while(rs.next()){
			idCentro=rs.getInt(1);

	 }

		if(usuario.getTipoUsuario().getIdTipoUsuario()==5 || usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
	 			comprobar1=true;

	 	}
		
		else if(usuario.getProfesor().getCentro()!=null){
			
	  		if(usuario.getProfesor().getCentro().getIdCentro()==idCentro || usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  		comprobar1=true;
		  		
	  		}
		}	  
}
else if(idTipoUsuario==3){
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5 || usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
}

else if(idTipoUsuario==4){
	  rs= st.executeQuery("SELECT idEmpresa FROM tutor WHERE idUsuario = '"+idUsuario+"'");
	  int idEmpresa=0;
		while(rs.next()){
			idEmpresa=rs.getInt(1);

	 }

	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5 || usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
	  else if(usuario.getTipoUsuario().getIdTipoUsuario()==3){
		  if(usuario.getResponsableEmpresa().getEmpresa().getIdEmpresa()==idEmpresa){
			  comprobar1=true;
		  }
	  }
}
else if(idTipoUsuario==5){
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5){
		  comprobar1=true;
	  }
}
else if(idTipoUsuario==6){
	  if(usuario.getTipoUsuario().getIdTipoUsuario()==5|| usuario.getIdUsuario()==(int)Integer.parseInt(idUsuario)){
		  comprobar1=true;
	  }
}


if(comprobar1==true){


	int cambio= Integer.parseInt(q);
	if(cambio!=0){
		conexion= new Conexion();
		st= conexion.conectar().createStatement();
		int tipoUsuario=0;
		 idCentro=0;
		rs= st.executeQuery("SELECT idTipoUsuario FROM usuario where idUsuario='"+q+"'");
		  
     	 if(rs.next()){
     		tipoUsuario= rs.getInt(1);
     	}
     	 
     	 if(tipoUsuario==6){
     		rs= st.executeQuery("SELECT idCentro FROM profesor where idUsuario='"+q+"'");
  		  
        	 if(rs.next()){
        		idCentro= rs.getInt(1);
        		st.executeUpdate("delete from login where idLogin in ('select idUsuario from alumno where idCentroAlumno="+idCentro+"')");
        		st.executeUpdate("delete from login where idLogin in ('select idUsuario from profesor where idCentro="+idCentro+"')");
        		st.executeUpdate("delete from centro where idCentro='"+idCentro+"'");
        	}	 
     	 }
		
		st.executeUpdate("delete from login where idLogin='"+cambio+"'");
		
		
	}
}
%>
</body>
</html>