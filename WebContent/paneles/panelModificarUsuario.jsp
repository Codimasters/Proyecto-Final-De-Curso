<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="packageConexion.*" %>
<%@page import="java.sql.*"%>

<%
	String idUsuario = (String)request.getParameter("a");
	String.valueOf(idUsuario);
//CAMBIAR idUsuario por el valor del GET//
	Conexion conexion = new Conexion();
	Statement st = conexion.conectar().createStatement();
	String nombre="";
	String apellido1="";
	String apellido2="";
	String rutaFoto="";
	String dni="";
	String email="";
	String username="";
	String password="";
	
	String materia="";
	
	int telefono=0;
	int idTipoUsuario=0;
	int expediente=0;
	
	
	
	//-------------------------------------------DATOS PERSONALES DEL USUARIO------------------------------------
	ResultSet rs = st.executeQuery("SELECT * FROM datosPersonales WHERE idUsuario='"+idUsuario+"'");
	if (rs.next()){
		nombre = rs.getString(2);
		apellido1 = rs.getString(3);
		apellido2 = rs.getString(4);
		rutaFoto = rs.getString(5);
		dni = rs.getString(6);
	}
	//-------------------------------------------DATOS DEL LOGIN DEL USUARIO------------------------------------
		rs = st.executeQuery("SELECT * FROM login WHERE idLogin='"+idUsuario+"'");
		if (rs.next()){
			username = rs.getString(2);
			
		}
	//-------------------------------------------DATOS DE CONTACTO DEL USUARIO------------------------------------
	rs = st.executeQuery("SELECT * FROM datosContacto WHERE idUsuario='"+idUsuario+"'");
	if (rs.next()){
		telefono = rs.getInt(2);
		email = rs.getString(3);
	}
	

	//---------------------------------------------TIPOS DE USUARIO------------------------------------------------
	rs = st.executeQuery("SELECT * FROM usuario WHERE idUsuario='"+idUsuario+"'");
	String tipoUsuario = "";
	if (rs.next()){
		idTipoUsuario = rs.getInt(2);
		switch(idTipoUsuario){
			case 1:
				tipoUsuario = "Profesor";
				break;
			case 2:
				tipoUsuario = "Alumno";
				break;
			case 3:
				tipoUsuario = "Responsable de Empresa";
				break;
			case 4:
				tipoUsuario = "Tutor";
				break;
			case 5:
				tipoUsuario = "Administrador de la Aplicacion";
				break;
			case 6:
				tipoUsuario = "Director";
				break;
			default:
				tipoUsuario = "Sin Asignar";
				break;
		}
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Usuario - <%out.println(username);%></title>
<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href=".././css/css.css" rel="stylesheet">
</head>
<body>
<form method="POST" action=".././editarUsuario.jsp"> 
<div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title"><%out.println(apellido1+" "+apellido2+", "+nombre);%></h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>
                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-9 col-lg-9 ">
                
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Tipo de Usuario:</td>
                        <td><select name='idTipoUsuario' hidden>
                        	<option value='1' <%if (idTipoUsuario == 1){out.println("selected");} %>>Profesor</option>
                        	<option value='2' <%if (idTipoUsuario == 2){out.println("selected");} %>>Alumno</option>
                        	<option value='3' <%if (idTipoUsuario == 3){out.println("selected");} %>>Responsable Empresa</option>
                        	<option value='4' <%if (idTipoUsuario == 4){out.println("selected");} %>>Tutor</option>
                        	<option value='5' <%if (idTipoUsuario == 5){out.println("selected");} %>>Admin</option>
                        	<option value='6' <%if (idTipoUsuario == 6){out.println("selected");} %>>Director</option>
                        </select></td>
                      </tr>
                      <tr>
                      <input type="text" name="idUsuario" value="<%out.println(idUsuario);%>" hidden>
                        <td><u>Cuenta:</u></td>
                        <td><input name="username" type="text" value="<%out.println(username);%>"></input></td>
                      </tr>
                      <tr>
                        <td><u>Contraseña:</u></td>
                        <td><input name="password" type="text" placeholder="Dejar en blanco si no hay cambio"></input></td>
                      </tr>
                      <tr>
                        <td>Nombre:</td>
                        <td><input name="nombre" type="text" value="<%out.println(nombre);%>"></input></td>
                      </tr>
                      <tr>
                        <td>Primer Apellido:</td>
                        <td><input name="apellido1" type="text" value="<%out.println(apellido1);%>"></input></td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Segundo Apellido:</td>
                        <td><input name="apellido2" type="text" value="<%out.println(apellido2);%>"></input></td>
                      </tr>
                        <tr>
                        <td>DNI</td>
                        <td><input name="dni" type="text" value="<%out.println(dni);%>"></input></td>
                      </tr>
                      <tr>
                        <td>E-mail</td>
                        <td><input name="email" type="text" value="<%out.println(email);%>"></input></a></td>
                      </tr>
                        <td>Teléfono de contacto</td>
                        <td><input name="telefono" type="text" value="<%out.println(telefono);%>"></input><br><!--<br>555-4567-890(Mobile)-->
                        </td>
                           
                      </tr>
                      
                      <%
                      if (idTipoUsuario==1 || idTipoUsuario==6){
                    	    
                    		rs = st.executeQuery("SELECT * FROM profesor  WHERE idUsuario='"+idUsuario+"'");
                    		if (rs.next()){
                    			materia = rs.getString(3);
                    			out.println("<tr><td>Materia</td><td><input type='text' name='materia' value='"+materia+"'></input></td></tr>");
                    		}
              
                    		
                      }
                      else if(idTipoUsuario==2){
                    	  rs = st.executeQuery("SELECT expediente FROM alumno  WHERE idUsuario='"+idUsuario+"'");
                  		if (rs.next()){
                  			expediente = rs.getInt(1);
                  			out.println("<tr><td>expediente</td><td><input type='text' name='expediente' value='"+expediente+"'></input></td></tr>");
                  		}
                      }
                      %>
                      </tr>
                      <tr>
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
            
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <input value="Modificar" data-original-title="Editar este usuario" data-toggle="tooltip" type="submit" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></input>
                            <a data-original-title="Eliminar este usuario" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
          <center><a href="" onclick="window.history.go(-1); return false;" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> Volver al panel</a></center>
        </div>
      </div>
    </div>
    </form>
</body>
</html>