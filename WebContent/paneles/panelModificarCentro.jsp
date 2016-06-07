<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="packageConexion.*" %>
<%@page import="java.sql.*"%>
<%@page import="entities.*"%>

<%
	String idCentro = (String)request.getParameter("a");
	String.valueOf(idCentro);
	String nombre="";
	
	Usuario usuario = (Usuario)session.getAttribute("sesion");
	boolean comprobar= false;
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=5){
		if(usuario.getTipoUsuario().getIdTipoUsuario()!=6){
			out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando panelModificarCentro')</script>");
			out.println(url.url.redirigir("index.jsp"));
		}
	}
//CAMBIAR idUsuario por el valor del GET//
	Conexion conexion = new Conexion();
	Statement st = conexion.conectar().createStatement();
	
	
	
	
	ResultSet rs = st.executeQuery("SELECT nombreCentro FROM centro WHERE idCentro='"+idCentro+"'");
	if (rs.next()){
		nombre=rs.getString(1);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Centro - <%out.println(nombre);%></title>
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
<form id="formModificarCentro" method="POST" action=".././editarCentro.jsp"> 
<div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>">
              <h3 class="panel-title" ><%out.println(nombre);%></h3>
            </div>
            <div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;color:white;'");}else if((String)session.getAttribute("tema")=="2"){out.println("style='background:#96c261;'");}else{}%>">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src=".././imagenes/iconos/perfilpic.png" class="img-circle img-responsive"> </div>
                
                <div class=" col-md-9 col-lg-9 ">
                
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Centro:</td>
                        <td><%out.println("<div class='form-group'><input class='form-control' type='text' name='nombreCentro' value='"+nombre+"'/></div>"); %></td>
                        
                      </tr>
                      <%
                      rs = st.executeQuery("SELECT idFamiliaProfesional,nombre FROM familiaProfesional WHERE idFamiliaProfesional IN (SELECT idFamiliaProfesional FROM relacionCF WHERE idCentro='"+idCentro+"')");
                      out.println("<tr><td>Eliminar Familias Profesionales:</td><td><select name='rmFamiliaProfesional'><option value='0'>-Selecciona una Familia Profesional-</option>");
                    	  while (rs.next()){
                    			int idFamiliaProfesional = rs.getInt(1);
                    			String nombreFamiliaProfesional = rs.getString(2);
                    			out.println("<option value='"+idFamiliaProfesional+"'>"+nombreFamiliaProfesional+"</option>");
                    		}
                    	  out.println("</select></tr>");
                   	  %>
                      <input type='text' value='<%=idCentro%>' name='idCentro' hidden />
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
            
                 <div class="panel-footer" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#4d3f58;'");}else if((String)session.getAttribute("tema")=="2"){out.println("style='background:#99366a;'");} else{}%>>
                        
                        
                            <input value="Modificar" data-original-title="Editar este usuario" data-toggle="tooltip" type="submit" class="btn btn-sm btn-warning"></input>
                            <a data-original-title="Eliminar este usuario" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        
                    </div>
            
          </div>
          <center><a onclick="window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarCentro');" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> Volver al panel</a></center>
        </div>
      </div>
    </div>
    </form>
    <script src=".././js/jquery.min.js"></script>
	<script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
	<script src=".././js/validatorModificarCentro.js" type="text/javascript">
	</script>
</body>
</html>