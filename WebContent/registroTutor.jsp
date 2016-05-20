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
    <%@include file="./css/css.css"%>
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
			    		<center><h3 class="panel-title">Formulario de registro de tutores<small><br>siempre responsables</small></h3><center>
			 			</div>
			 			<div class="panel-body">
			    		<form id="formRegistro" role="form" method="post" action="validarRegistro.jsp">
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
			                				<option value="0">Seleccione una empresa</option>
			    							<%
			    							Conexion conexion= new Conexion();
						    				Statement st= conexion.conectar().createStatement();
						    				int idEmpresa;
											String nombre;
											ResultSet rs=st.executeQuery("select idEmpresa, nombre from empresa");
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
			    							<option value="4">alumno</option>
			    						</select>
			    					</div>
			    				</div>
			    			</div>
			    			
			    			<input type="submit" value="Register" class="btn btn-info btn-block">
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    
    <script>/*
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
        
        xmlhttp.open("GET","obtenerDatosRegistroFamiliaProfesionalAjax.jsp?q="+str,true);
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
        
        xmlhttp.open("GET","obtenerDatosRegistroGradoAjax.jsp?q="+str,true);
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
        
        xmlhttp.open("GET","obtenerDatosRegistroEspecializacionAjax.jsp?q="+str,true);
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
    
}*/



</script>
</body>
</html>