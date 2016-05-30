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
			    		<center><h3 class="panel-title">Formulario de registro <small>de especializacion</small></h3><center>
			 			</div>
			 			<div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>>
			    		<form id="formRegistro" role="form" method="post" action=".././validarRegistroCentro.jsp">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                <input type="text" name="nombreEspecializacion" id="nombre" class="form-control input-sm floatlabel" placeholder="Nombre de la familia profesional">
			    					</div>
			    				</div>
			    			</div>
			    			<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                			<select name='nombreCentro' id='centroRegistro2' onchange="obtenerDatosRegistro2(this.value)">
			                				<option value="0">Seleccione un centro</option>
			    							<% 
			    							rs=st.executeQuery("select * from centro");
			    							while(rs.next()){
			    								idCentro= rs.getInt(1);
			    								nombreCentro= rs.getString(2);
			    								out.println("<option value='"+idCentro+"'>"+nombreCentro+"</option>");
			    							}
			    							%>
			    						</select>
			    					</div>
			    				
			    				</div>
			    				<div id="datosConsultasFamiliaProfesionalRegistro2"></div>
			    				<div id="datosConsultasGradoRegistro2"></div>
			    			
			    			<input type="submit" value="Crear nueva especializacion" class="btn btn-info btn-block" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#70322b;'");}else{}%>>
			    		
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    
    <script>
function obtenerDatosRegistro2(str) {
    if (str == "") {
        document.getElementById("centroRegistro2").innerHTML = "";
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
                document.getElementById("datosConsultasFamiliaProfesionalRegistro2").innerHTML = xmlhttp.responseText;
                document.getElementById("familiaProfesional").setAttribute("onchange", "obtenerDatosFamiliaProfesionalRegistro2(this.value)")
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroFamiliaProfesionalAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    if(document.getElementById("familiaProfesionalRegistro")){
    	document.getElementById("familiaProfesionalRegistro").innerHTML="";
    }
 
    if(document.getElementById("especializacionRegistro")){
    	document.getElementById("datosConsultasEspecializacion").innerHTML="";
    }
    if(document.getElementById("centroRegistro2").value==0){
    	document.getElementById("datosConsultasGradoRegistro2").innerHTML="";
    }

}

function obtenerDatosFamiliaProfesionalRegistro2(str) {
    if (str == "") {
        document.getElementById("centroRegistro2").innerHTML = "";
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
                document.getElementById("datosConsultasGradoRegistro2").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroGradoAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    if(document.getElementById("gradoRegistro2")){
    	document.getElementById("datosConsultasGradoRegistro2").innerHTML="";
    }
 
    
}




</script>
</body>
</html>