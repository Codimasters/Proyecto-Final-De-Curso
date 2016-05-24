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
        		<div class="panel-heading">
			    		<center><h3 class="panel-title">Registro <small>de empresas</small></h3><center>
			 			</div>
			 			<div class="panel-body">
			    		<form id="formRegistro" role="form" method="post" action="./validarRegistro.jsp">
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
			    			
			    				<div id="datosConsultasFamiliaProfesional"></div>
			    				<div id="datosConsultasGrado"></div>
			    				<div id="datosConsultasEspecializacion"></div>
			    				<div id="materiasProfesor"></div>
									

			    				
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<input type="email" name="email" id="email" class="form-control input-sm floatlabel" placeholder="E-mail de la empresa">
			    					</div>
			    				</div>
			    			</div>
			    			
			    			<input type="submit" value="Crear Empresa" class="btn btn-info btn-block" disabled>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    
    <script>
function obtenerDatos(str) {
    if (str == "") {
        document.getElementById("centro").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("datosConsultasFamiliaProfesional").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroFamiliaProfesionalAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    if(document.getElementById("familiaProfesional")){
    	document.getElementById("familiaProfesional").innerHTML="";
    }
    if(document.getElementById("grado")){
    	document.getElementById("datosConsultasGrado").innerHTML="";
    }
    if(document.getElementById("especializacion")){
    	document.getElementById("datosConsultasEspecializacion").innerHTML="";
    }

}

function obtenerDatosFamiliaProfesional(str) {
    if (str == "") {
        document.getElementById("centro").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("datosConsultasGrado").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroGradoAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    if(document.getElementById("grado")){
    	document.getElementById("datosConsultasGrado").innerHTML="";
    }
    if(document.getElementById("especializacion")){
    	document.getElementById("datosConsultasEspecializacion").innerHTML="";
    }
    
}

function obtenerDatosGrado(str) {
    if (str == "") {
        document.getElementById("familiaProfesional").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("datosConsultasEspecializacion").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroEspecializacionAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    
    if(document.getElementById("especializacion")){
    	document.getElementById("datosConsultasEspecializacion").innerHTML="";
    }
}
function obtenerTipoRegistro(str) {
	switch(parseInt(str)){
		case 1:
			document.getElementById("materiasProfesor").innerHTML = '<div class="form-group"><input type="text" name="materia" id="materia" class="form-control input-sm" placeholder="Inserta la materia que impartes"></div>';
			break;
		case 2:
			document.getElementById("materiasProfesor").innerHTML = "";
			break;
	}
    
}



</script>
</body>
</html>