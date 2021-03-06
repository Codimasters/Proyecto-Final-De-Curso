<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<%@page import="entities.*" %>
<%
usuario = (Usuario)session.getAttribute("sesion");
if(usuario!=null){
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=5){
		if(usuario.getTipoUsuario().getIdTipoUsuario()!=3){
			out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando registroEspecializacion')</script>");
			out.println(url.url.redirigir("index.jsp"));	
		}
		
	}
	
}
else{
	out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando registroEspecializacion')</script>");
	out.println(url.url.redirigir(".././index.jsp"));	

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
    <%@include file="./Bootstrap/css/bootstrap.min.css"%>
</style>
<link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
</head>
<body>
	<script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>

<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#7a2b24;color:white;'");}else{}%>>
			    		<center><h3 class="panel-title">Formulario de registro de tutores<small><br>siempre responsables</small></h3><center>
			 			</div>
			 			<div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>>
			    		<form id="formRegistroTutor" role="form" method="post" action=".././validarRegistro.jsp">
			    			<div class="row">
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			                <input type="text" name="nombre" id="nombre" class="form-control input-sm floatlabel" placeholder="nombre">
			    					</div>
			    				</div>
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<input type="text" name="apellido1" id="apellido1" class="form-control input-sm" placeholder="apellido1">
			    					</div>
			    				</div>
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">
			    						<input type="text" name="apellido2" id="apellido2" class="form-control input-sm" placeholder="apellido2">
			    					</div>
			    				</div>
			    			</div>
			    			<div class="form-group">
			    				<input type="dni" name="dni" id="dni" class="form-control input-sm" placeholder="Inserta el DNI">
			    			</div>

			    			<div class="form-group">
			    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
			    			</div>
			    			
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<input type="text" name="telefono" id="telefono" class="form-control input-sm floatlabel" placeholder="Telefono">
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<select name='idEmpresa' id='idEmpresa' onchange="obtenerDatos(this.value)">
			                				<option value="0">-Seleccione una empresa-</option>
			    							<%
			    						/*	Conexion conexion= new Conexion();
						    				Statement st= conexion.conectar().createStatement();*/
						    				int idEmpresa;
											String nombre;
											/*ResultSet*/ rs=st.executeQuery("select idEmpresa, nombre from empresa WHERE idEmpresa IN (SELECT idEmpresa FROM responsableEmpresa)");
											if (usuario.getTipoUsuario().getIdTipoUsuario()==3){
												rs=st.executeQuery("select idEmpresa, nombre from empresa WHERE idEmpresa='"+usuario.getResponsableEmpresa().getEmpresa().getIdEmpresa()+"'");
											}
			    							while(rs.next()){
			    								idEmpresa= rs.getInt(1);
			    								nombre= rs.getString(2);
			    								out.println("<option value='"+idEmpresa+"'>"+nombre+"</option>");
			    							}
			    							
			    							%>
			    						</select>
			    					</div>
			    				</div>
			    			</div>	
	
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<input type="text" name="username" id="username" class="form-control input-sm floatlabel" placeholder="nombre de usuario">
			    					</div>
			    				</div>
			    			</div>
			
			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<select id="tipoRegistro" name='tipoRegistro' onchange='obtenerTipoRegistro(this.value)' hidden>
			    							<option value="4">tutor</option>
			    						</select>
			    					</div>
			    				</div>
			    			</div>
			    			
			    			<input type="submit" value="Registrar Usuario" class="btn btn-info btn-block" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#70322b;'");}else{}%>>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    </body>
    <script src=".././js/jquery.min.js"></script>
<script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js">

</script>
<script src=".././js/validatorTutor.js" type="text/javascript"></script>
</html>