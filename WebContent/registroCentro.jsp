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
			    		<center><h3 class="panel-title">Formulario de registro <small>de centros</small></h3><center>
			 			</div>
			 			<div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>>
			    		<form id="formRegistro" role="form" method="post" action=".././validarRegistro.jsp">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                <input type="text" name="nombre" id="nombre" class="form-control input-sm floatlabel" placeholder="Nombre del centro">
			    					</div>
			    				</div>
			    			</div>
			    			
			    			<input type="submit" value="Crear Centro" class="btn btn-info btn-block" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#70322b;'");}else{}%>>
			    		
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
			document.getElementById("materiasProfesor").innerHTML = "";
			document.getElementById("materiasProfesor").innerHTML = '<div class="form-group"><input type="text" name="materia" id="materia" class="form-control input-sm" placeholder="Inserta la materia que impartes"></div>';
			break;
		case 2:
			document.getElementById("materiasProfesor").innerHTML = "";
			break;
		case 6:
			document.getElementById("materiasProfesor").innerHTML = "";
			document.getElementById("materiasProfesor").innerHTML = '<div class="form-group"><input type="text" name="materia" id="materia" class="form-control input-sm" placeholder="Inserta la materia que impartes"></div>';
			break;
	}
    
}



</script>
</body>
</html>