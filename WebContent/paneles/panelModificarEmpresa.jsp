<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page language="java" import="controladoresConexion.*" %>
<%@ page language="java" import="packageConexion.*" %>
<%@page import="java.sql.*"%>

<%
	String idEmpresa = (String)request.getParameter("a");
	String.valueOf(idEmpresa);
//CAMBIAR idUsuario por el valor del GET//
	Conexion conexion = new Conexion();
	Statement st = conexion.conectar().createStatement();
	String nombre="";
	String acronimo="";
	String rubro="";
	String direccionFiscal="";
	String region="";
	String ciudad="";
	int telefono=0;
	String email="";
	String nombreResponsable="";
	String apellido1="";
	String apellido2="";
	int idResponsableEmpresa=0;
	
	
	
	//-------------------------------------------DATOS PERSONALES DEL USUARIO------------------------------------
	ResultSet rs = st.executeQuery("SELECT * FROM empresa WHERE idEmpresa='"+idEmpresa+"'");
	if (rs.next()){
		nombre = rs.getString(2);
		acronimo = rs.getString(3);
		rubro = rs.getString(4);
		direccionFiscal = rs.getString(5);
		region = rs.getString(6);
		ciudad = rs.getString(7);
		telefono = rs.getInt(8);
		email = rs.getString(9);
	}
	rs = st.executeQuery("SELECT nombre,apellido1,apellido2,idUsuario FROM datosPersonales WHERE idUsuario=(SELECT idUsuario FROM responsableEmpresa WHERE idEmpresa='"+idEmpresa+"')");
	if (rs.next()){
		nombreResponsable=rs.getString(1);
		apellido1=rs.getString(2);
		apellido2=rs.getString(3);
		idResponsableEmpresa=rs.getInt(4);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Empresa - <%out.println(nombre);%></title>
<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href=".././css/css.css" rel="stylesheet">
</head>
<body class="tema<%out.println(session.getAttribute("tema"));%>">
<form method="POST" action=".././editarEmpresa.jsp"> 
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
                        <td>Empresa:</td>
                        <td><%out.println(nombre); %></td>
                        
                      </tr>
                      <tr>
                      	<td>Acr&oacutenimo:</td>
                        <td><input name="acronimo" type="text" value="<%out.println(acronimo);%>"></input></td>
                      </tr>
                      <tr>
                      <input type="text" name="idEmpresa" value="<%out.println(idEmpresa);%>" hidden>
                        <td><u>Empresario:</u></td>
                        <td><%out.println(nombreResponsable+" "+apellido1+" "+apellido2);%></td>
                      </tr>
                      
                      <tr>
                        <td>Rubro:</td>
                        <td><input name="rubro" type="text" value="<%out.println(rubro);%>"></input></td>
                      </tr>
                      <tr>
                        <td>Direcci&oacuten Fiscal:</td>
                        <td><input name="direccionFiscal" type="text" value="<%out.println(direccionFiscal);%>"></input></td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td>Region:</td>
                        <td><input name="region" type="text" value="<%out.println(region);%>"></input></td>
                      </tr>
                        <tr>
                        <td>Ciudad:</td>
                        <td><input name="ciudad" type="text" value="<%out.println(ciudad);%>"></input></td>
                      </tr>
                      
                      <tr>
                        <td>E-mail:</td>
                        <td><input name="email" type="text" value="<%out.println(email);%>"></input></a></td>
                      </tr>
                        <td>Teléfono de empresa:</td>
                        <td><input name="telefono" type="text" value="<%out.println(telefono);%>"></input><br><!--<br>555-4567-890(Mobile)-->
                        </td>
                           
                    	
                      <tr>
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
            
                 <div class="panel-footer" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#4d3f58;'");}else if((String)session.getAttribute("tema")=="2"){out.println("style='background:#99366a;'");} else{}%>>
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                        <span class="pull-right">
                            <input value="Modificar" data-original-title="Editar este usuario" data-toggle="tooltip" type="submit" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></input>
                            <% out.println("<a href='panelModificarUsuario.jsp?a="+idResponsableEmpresa+"'><input value='Modificar responsable' data-original-title='Editar responsable' data-toggle='tooltip' type='buttom' class='btn btn-sm btn-warning'><i class='glyphicon glyphicon-edit'></i></input></a>");%>
                            <a data-original-title="Eliminar este usuario" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
          <center><a onclick="window.location.replace('/proyecto_final_curso/faces/paneles/inicio.jsp#modificarUsuario');" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span> Volver al panel</a></center>
        </div>
      </div>
    </div>
    </form>
</body>
</html>