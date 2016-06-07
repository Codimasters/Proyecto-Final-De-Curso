<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="packageConexion.*" %>
<%@page import="entities.*"%>
<%@page import="java.sql.*"%>

<%
	
	Usuario usuario = (Usuario)session.getAttribute("sesion");
	int idUsuario = usuario.getIdUsuario();
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
<title>Modificar Perfil - <%out.println(username);%></title>
<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href=".././css/css.css" rel="stylesheet">
<link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
</head>
<style>
body{
background-color: #4D3F58;
}
</style>
<body class="tema<%out.println(session.getAttribute("tema"));%>">

<!-- Centered Tabs -->

<form id="formModificarPerfil" method="POST" action=".././editarUsuario.jsp"> 
<div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info" >
            <div id="cabecera" class="panel-heading" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#c9e0e7;'");}else{}%>>
              <h3 class="panel-title"><%out.println(apellido1+" "+apellido2+", "+nombre);%></h3>
            </div>
            <div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;color:white;'");}else if((String)session.getAttribute("tema")=="2"){out.println("style='background:#96c261;'");}else{}%>>
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src=".././imagenes/iconos/perfilpic.png" class="img-circle img-responsive"> </div>
                
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
                        <td>
                        	<p><%out.println(tipoUsuario);%></p>
                        </td>
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
                        <td><div class="form-group"><input class="form-control" type="text" name="username" value="<%=username%>"></input></div></td>
                      	
                      </tr>
                      <tr>
                      	
                        <td><u>Nueva contraseña:</u></td>
                        <td><div class="form-group"><input class="form-control" name="password" type="text" placeholder="Dejar en blanco si no hay cambio"></input></div></td>
                        
                      </tr>
                      <tr>
                        <td>Cambiar nombre:</td>
                        <td><div class="form-group"><input class="form-control" name="nombre" type="text" value="<%out.println(nombre);%>"></input></div></td>
                      </tr>
                      <tr>
                        <td>Cambiar Primer Apellido:</td>
                        <td><div class="form-group"><input class="form-control" name="apellido1" type="text" value="<%out.println(apellido1);%>"></input></div></td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Cambiar Segundo Apellido:</td>
                        <td><div class="form-group"><input class="form-control" name="apellido2" type="text" value="<%out.println(apellido2);%>"></input></div></td>
                      </tr>
                        <tr>
                        <td>Cambiar DNI:</td>
                        <td><div class="form-group"><input class="form-control" name="dni" type="text" value="<%out.println(dni);%>"></input></div></td>
                      </tr>
                      <tr>
                        <td>Cambiar E-mail:</td>
                        <td><div class="form-group"><input class="form-control" name="email" type="text" value="<%out.println(email);%>"></input></div></td>
                      </tr>
                        <td>Cambiar Teléfono de contacto:</td>
                        <td><div class="form-group"><input  class="form-control" name="telefono" type="text" value="<%out.println(telefono);%>"></input></div><br><!--<br>555-4567-890(Mobile)-->
                        </td>
                           
                      </tr>
                      
                      <%
                      if (idTipoUsuario==1 || idTipoUsuario==6){
                    	    
                    		rs = st.executeQuery("SELECT * FROM profesor  WHERE idUsuario='"+idUsuario+"'");
                    		if (rs.next()){
                    			materia = rs.getString(3);
                    			out.println("<tr><td>Materia</td><td><div class='form-group'><input class='form-control' type='text' name='materia' value='"+materia+"'></input></div></td></tr>");
                    		}
              
                    		
                      }
                      else if(idTipoUsuario==2){
                    	  rs = st.executeQuery("SELECT expediente FROM alumno  WHERE idUsuario='"+idUsuario+"'");
                  		if (rs.next()){
                  			expediente = rs.getInt(1);
                  			out.println("<tr><td>expediente</td><td><div class='form-group'><input class='form-control' type='text' name='expediente' value='"+expediente+"'></input></div></td></tr>");
                  		}
                      }
                      else if(idTipoUsuario==4){
                    	  int idAlumnoTutor=0;
                    	  String nombreAlumnoTutor="";
                    	  String apellido1AlumnoTutor="";
                    	  String apellido2AlumnoTutor="";
                    	  rs = st.executeQuery("SELECT idUsuario,nombre,apellido1,apellido2 FROM datosPersonales  WHERE idUsuario in (select idUsuario from alumno where idTutor='"+idUsuario+"')");
                    	  out.println("<tr><td>Eliminar alumnos a cargo:</td><td><select name='rmAlumnosACargo'><option value='0'>-Selecciona un alumno-</option>");
                    	  while (rs.next()){
                    			idAlumnoTutor = rs.getInt(1);
                    			nombreAlumnoTutor=rs.getString(2);
                    			apellido1AlumnoTutor=rs.getString(3);
                    			apellido2AlumnoTutor=rs.getString(4);
                    			out.println("<option value='"+idAlumnoTutor+"'>"+nombreAlumnoTutor+" "+apellido1AlumnoTutor+" "+apellido2AlumnoTutor+"</option>");
                    		}
                    	  out.println("</select></tr>");
                    	  String addNombreAlumnoTutor="";
                    	  int addIdAlumnoTutor=0;
                    	  String addApellido1AlumnoTutor;
                    	  String addApellido2AlumnoTutor;
                    	  rs = st.executeQuery("SELECT idUsuario,nombre,apellido1,apellido2 FROM datosPersonales where idUsuario in (SELECT idUsuario from alumno where idTutor!='"+idUsuario+"' OR  idTutor is NULL)");
                    	  out.println("<tr><td>Añadir alumnos a cargo:</td><td><select name='addAlumnosACargo' multiple>");
                    	  while (rs.next()){
                    			addIdAlumnoTutor = rs.getInt(1);
                    			addNombreAlumnoTutor=rs.getString(2);
                    			addApellido1AlumnoTutor=rs.getString(3);
                    			addApellido2AlumnoTutor=rs.getString(4);
                    			out.println("<option value='"+addIdAlumnoTutor+"'>"+addNombreAlumnoTutor+" "+addApellido1AlumnoTutor+" "+addApellido2AlumnoTutor+"</option>");
                    		}
                    	  out.println("</select></tr>");
                    	  
                    	  int idProfesorTutor=0;
                    	  String nombreProfesorTutor="";
                    	  String apellido1ProfesorTutor="";
                    	  String apellido2ProfesorTutor="";
                    	  rs = st.executeQuery("SELECT idUsuario,nombre,apellido1,apellido2 FROM datosPersonales  WHERE idUsuario in (select idProfesor from relacionPT where idTutor='"+idUsuario+"')");
                    	  out.println("<tr><td>Eliminar profesor a cargo:</td><td><select name='rmProfesorTutor'><option value='0'>-Selecciona un profesor-</option>");
                    	  while (rs.next()){
                    			idProfesorTutor = rs.getInt(1);
                    			nombreProfesorTutor=rs.getString(2);
                    			apellido1ProfesorTutor=rs.getString(3);
                    			apellido2ProfesorTutor=rs.getString(4);
                    			out.println("<option value='"+idProfesorTutor+"'>"+nombreProfesorTutor+" "+apellido1ProfesorTutor+" "+apellido2ProfesorTutor+"</option>");
                    		}
                    	  out.println("</select></tr>");
                    	  String addNombreProfesorTutor="";
                    	  int addIdProfesorTutor=0;
                    	  String addApellido1ProfesorTutor;
                    	  String addApellido2ProfesorTutor;
                    	  rs = st.executeQuery("select idUsuario, nombre, apellido1, apellido2 from datosPersonales where idUsuario in (SELECT idUsuario FROM profesor WHERE idUsuario not in(SELECT idProfesor FROM relacionPT WHERE idTutor = '"+idUsuario+"' OR idProfesor IS NULL))");
                    	  out.println("<tr><td>Añadir profesores a cargo:</td><td><select name='addProfesorTutor' multiple>");
                    	  while (rs.next()){
                    			addIdAlumnoTutor = rs.getInt(1);
                    			addNombreAlumnoTutor=rs.getString(2);
                    			addApellido1AlumnoTutor=rs.getString(3);
                    			addApellido2AlumnoTutor=rs.getString(4);
                    			out.println("<option value='"+addIdAlumnoTutor+"'>"+addNombreAlumnoTutor+" "+addApellido1AlumnoTutor+" "+addApellido2AlumnoTutor+"</option>");
                    		}
                    	  out.println("</select></tr>");
                    	  
                    	  
                    	  
                      }
                      
                      
                      %>
                      </tr>
                      <tr>
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
            
                 <div class="panel-footer" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#4d3f58;'");}else if((String)session.getAttribute("tema")=="2"){out.println("style='background:#99366a;'");} else{}%>>
                        
                        
                            <input value="Modificar" data-original-title="Editar este usuario" data-toggle="tooltip" type="submit" class="btn btn-sm btn-warning"></input>
                        
                    </div>
            
          </div>
          <center><a onclick="window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp');" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> Volver al panel</a></center>
        </div>
      </div>
    </div>
    </form>
    <script src=".././js/jquery.min.js"></script>
<script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js">

</script> 
<script src=".././js/validatorModificarPerfil.js" type="text/javascript"></script>  
</body>
</html>
