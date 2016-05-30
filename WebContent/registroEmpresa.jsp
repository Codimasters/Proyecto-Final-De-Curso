<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
    <%@include file="./Bootstrap/css/bootstrap.min.css"%>
</style>
<title>Registrese Weyy</title>
</head>
<body>
	<script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>

<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#7a2b24;color:white;'");}else{}%>>
			    		<center><h3 class="panel-title">Registro <small>de empresas</small></h3><center>
			 			</div>
			 			<div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>>
			    		<form id="formRegistro" role="form" method="post" action=".././validarRegistroEmpresa.jsp">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                <input type="text" name="nombre" id="nombre" class="form-control input-sm floatlabel" placeholder="Nombre de la empresa">
			    					</div>
			    				</div>
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			    						<input type="text" name="acronimo" id="acronimo" class="form-control input-sm" placeholder="Acrónimo de la empresa">
			    					</div>
			    				</div>
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			    						<input type="text" name="rubro" id="rubro" class="form-control input-sm" placeholder="Rubro de la empresa">
			    					</div>
			    				</div>
			    			</div>
			    			<div class="form-group">
			    				<input type="text" name="direccionFiscal" id="direccionFiscal" class="form-control input-sm" placeholder="Direccion Fiscal de la empresa">
			    			</div>

			    			<div class="form-group">
			    				<input type="text" name="region" id="region" class="form-control input-sm" placeholder="Region de la empresa">
			    			</div>
			    			
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<input type="text" name="ciudad" id="ciudad" class="form-control input-sm floatlabel" placeholder="Ciudad de la empresa">
			    					</div>
			    				</div>
			    			</div>
			    			
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<input type="text" name="telefono" id="telefono" class="form-control input-sm floatlabel" placeholder="Telefono de la empresa">
			    					</div>
			    				</div>
			    			</div>

			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<input type="email" name="email" id="email" class="form-control input-sm floatlabel" placeholder="E-mail de la empresa">
			    					</div>
			    				</div>
			    			</div>
			    			
			    			<input type="submit" value="Crear Empresa" class="btn btn-info btn-block" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#70322b;'");}else{}%>>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    

</body>
</html>