<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
 <%@ page import="entities.*" %>
<%
// usuario = (Usuario)session.getAttribute("sesion");
if(usuario!=null){
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=5){
		if(usuario.getTipoUsuario().getIdTipoUsuario()!=6){
			out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando registroEspecializacion')</script>");
			out.println(url.url.redirigir("index.jsp"));	
		}
		
	}
}
else{
	out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando registroEspecializacion')</script>");
	out.println(url.url.redirigir("index.jsp"));	
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
    <%@include file="./Bootstrap/css/bootstrap.min.css"%>
    <link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
</style>
<title></title>
</head>
<body>

	<script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>

<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#7a2b24;color:white;'");}else{}%>>
			    		<center><h3 class="panel-title">Formulario de registro <small>de especializacion</small></h3><center>
			 			</div>
			 			<div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>>
			    		<form id="formRegistroEspecializacion" role="form" method="post" action=".././validarRegistroCentro.jsp">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                <input type="text" name="nombreEspecializacion" id="nombre" class="form-control input-sm floatlabel" placeholder="Nombre de la especializacion">
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<select name='nombreCentro' id='centroRegistro2' onchange="obtenerDatosRegistro2(this.value)">
			                				<option value="0">-Seleccione un centro-</option>
			    							<% 
			    							Conexion conexion4= new Conexion();
						    				Statement st4= conexion4.conectar().createStatement();
											int idCentro4;
											String nombreCentro4;
			    							ResultSet rs4=st4.executeQuery("select * from centro");
			    							while(rs4.next()){
			    								idCentro4= rs4.getInt(1);
			    								nombreCentro4= rs4.getString(2);
			    								out.println("<option value='"+idCentro4+"'>"+nombreCentro4+"</option>");
			    							}
			    							%>
			    						</select>
			    					</div>
			    				</div>
			    			</div>
			    				<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group has-feedback has-success" id="groupFamilia2">
			    				<select name='familiaProfesional'  id='familiaProfesional2' onchange='obtenerDatosFamiliaProfesionalRegistro2(this.value)'>
			    					<option value='0'>-Seleccione una familia profesional-</option>
			    					<option value='-1'>No existen familias profesionales</option>
			    				</select>
			    				</div>
			    				</div>
			    				</div>
			    				
			    				<div class='row'>
			    					<div class='col-xs-12 col-sm-12 col-md-12'>
			    						<div class='form-group' id="groupGrado2">
			    							<select name='grado' id="datosConsultasGrado2">
			    								<option value='0'>-Seleccione un grado-</option>
			    								<option value='-1'>No existen grados</option>
			    							</select>
			    					</div>
			    				</div>
			    				</div>
			    			
			    			<input type="submit" value="Crear nueva especializacion" class="btn btn-info btn-block" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#70322b;'");}else{}%>>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    <script src=".././js/jquery.min.js"></script>
<script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js">

</script>
<script src=".././js/validatorEspecializacion.js" type="text/javascript"></script>    
    <script>
function obtenerDatosRegistro2(str) {
    if (str == 0) {
    	document.getElementById("familiaProfesional2").selectedIndex = "0";
       	document.getElementById("groupFamilia2").className+="form-group has-feedback has-error";
       	document.getElementById("groupFamilia2").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       	
       	document.getElementById("datosConsultasGrado2").selectedIndex = "0";
       	document.getElementById("groupGrado2").className+="form-group has-feedback has-error";
       	document.getElementById("groupGrado2").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
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
                document.getElementById("familiaProfesional2").innerHTML = xmlhttp.responseText;
                document.getElementById("familiaProfesional2").setAttribute("onchange", "obtenerDatosFamiliaProfesionalRegistro2(this.value)")
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroFamiliaProfesionalAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
}

function obtenerDatosFamiliaProfesionalRegistro2(str) {
    if (str == 0) {
    	document.getElementById("datosConsultasGrado2").selectedIndex = "0";
       	document.getElementById("groupGrado2").className+="form-group has-feedback has-error";
       	document.getElementById("groupGrado2").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
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
                document.getElementById("datosConsultasGrado2").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroGradoAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
}




</script>
</body>
</html>