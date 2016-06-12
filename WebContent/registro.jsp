<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="packageConexion.*"%>
<%@page import="java.sql.*"%>
<%@page import="entities.*"%>
<%usuario = (Usuario)session.getAttribute("sesion");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
    <%@include file="./Bootstrap/css/bootstrap.min.css"%>
</style>
<link href="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet">
<title>Registro</title>
</head>
<style>
background-color:#4f1c4a;
}

.content {
    padding-top: 30px;
}

/* Testimonials */
.testimonials blockquote {
    background: #f8f8f8 none repeat scroll 0 0;
    border: medium none;
    color: #666;
    display: block;
    font-size: 14px;
    line-height: 20px;
    padding: 15px;
    position: relative;
}
.testimonials blockquote::before {
    width: 0; 
    height: 0;
	right: 0;
	bottom: 0;
	content: " "; 
	display: block; 
	position: absolute;
    border-bottom: 20px solid #fff;    
	border-right: 0 solid transparent;
	border-left: 15px solid transparent;
	border-left-style: inset; /*FF fixes*/
	border-bottom-style: inset; /*FF fixes*/
}
.testimonials blockquote::after {
    width: 0;
    height: 0;
    right: 0;
    bottom: 0;
    content: " ";
    display: block;
    position: absolute;
    border-style: solid;
    border-width: 20px 20px 0 0;
    border-color: #e63f0c transparent transparent transparent;
}
.testimonials .carousel-info img {
    border: 1px solid #f5f5f5;
    border-radius: 150px !important;
    height: 75px;
    padding: 3px;
    width: 75px;
}
.testimonials .carousel-info {
    overflow: hidden;
}
.testimonials .carousel-info img {
    margin-right: 15px;
}
.testimonials .carousel-info span {
    display: block;
}
.testimonials span.testimonials-name {
    color: #e6400c;
    font-size: 16px;
    font-weight: 300;
    margin: 23px 0 7px;
}
.testimonials span.testimonials-post {
    color: #656565;
    font-size: 12px;
}

.fullscreen-bg {
  opacity: 0.4;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  overflow: hidden;
  z-index: -100;
  -webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
       -moz-animation: fadein 2s; /* Firefox < 16 */
        -ms-animation: fadein 2s; /* Internet Explorer */
         -o-animation: fadein 2s; /* Opera < 12.1 */
            animation: fadein 2s;
}
@keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Firefox < 16 */
@-moz-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Safari, Chrome and Opera > 12.1 */
@-webkit-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Internet Explorer */
@-ms-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

/* Opera < 12.1 */
@-o-keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

.fullscreen-bg__video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

@media (min-aspect-ratio: 16/9) {
  .fullscreen-bg__video {
    height: 300%;
    top: -100%;
  }
}

@media (max-aspect-ratio: 16/9) {
  .fullscreen-bg__video {
    width: 300%;
    left: -100%;
  }
}

@media (max-width: 767px) {
  .fullscreen-bg {
    background: url('../img/videoframe.jpg') center center / cover no-repeat;
  }

  .fullscreen-bg__video {
    display: none;
  }
}
</style>
<body>
	<script type="text/javascript" src="http://www.clubdesign.at/floatlabels.js"></script>

<div class="container">
<div class="fullscreen-bg">
    <video loop muted autoplay poster="img/videoframe.jpg" class="fullscreen-bg__video">
        <source src="./video/portada.mp4" type="video/webm">
        <source src="./video/portada.mp4" type="video/mp4">
        <source src="./video/portada.mp4" type="video/ogg">
    </video>
</div>
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#7a2b24;color:white;'");}else{}%>>
			    		<center><h3 class="panel-title">Formulario de registro <small>te queremos en el equipo</small></h3><center>
			 			</div>
			 			<div class="panel-body" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>>
			    		<form name="formulario" id="formRegistro" role="form" method="post" action=".././validarRegistro.jsp">
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
			                			<select name='nombreCentro' id='centro' onchange="obtenerDatos(this.value)">
			                				<option value="0">-Seleccione un centro-</option>
			    							<% 
			    							Conexion conexion= new Conexion();
						    				Statement st= conexion.conectar().createStatement();
											int idCentro;
											String nombreCentro;
			    							ResultSet rs=st.executeQuery("select * from centro");
			    							while(rs.next()){
			    								idCentro= rs.getInt(1);
			    								nombreCentro= rs.getString(2);
			    								out.println("<option value='"+idCentro+"'>"+nombreCentro+"</option>");
			    							}
			    							%>
			    						</select>
			    					</div>
			    				</div>
			    			</div>
			    				<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group has-feedback has-success" id="groupFamilia">
			    				<select name='familiaProfesional'  id='familiaProfesional' onchange='obtenerDatosFamiliaProfesional(this.value)'>
			    					<option value='0'>-Seleccione una familia profesional-</option>
			    					<option value='-1'>No existen familias profesionales</option>
			    				</select>
			    				</div>
			    				</div>
			    				</div>
			    				
			    				<div class='row'>
			    					<div class='col-xs-12 col-sm-12 col-md-12'>
			    						<div class='form-group' id="groupGrado">
			    							<select name='grado' id="datosConsultasGrado" onchange='obtenerDatosGrado(this.value)'>
			    								<option value='0'>-Seleccione un grado-</option>
			    								<option value='-1'>No existen grados</option>
			    							</select>
			    					</div>
			    				</div>
			    				</div>
			    				
			    				<div class='row'>
			    					<div class='col-xs-12 col-sm-12 col-md-12'>
			    						<div class='form-group' id="groupEspecializacion">
			    							<select name='especializacion' id="datosConsultasEspecializacion">
			    								<option value='0'>-Seleccione un especializacion-</option>
			    								<option value='-1'>No existen especializacion</option>
			    							</select>
			    					</div>
			    				</div>
			    				</div>
			    				<div id="materiasProfesor"></div>
									

			    				
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
			    						<select id="tipoRegistro" name='tipoRegistro' onchange='obtenerTipoRegistro(this.value)'>
			    							<%
			    								if (usuario.getTipoUsuario().getIdTipoUsuario()==6){
			    									
			    									out.println("<option value='2'>alumno</option><option value='1'>profesor</option>");
			    								}
			    								else if (usuario.getTipoUsuario().getIdTipoUsuario()==1){
			    									
			    									out.println("<option value='2'>alumno</option>");
			    								}
												else {
			    									
			    									out.println("<option value='2'>alumno</option><option value='1'>profesor</option><option value='6'>director</option>");
			    								}
			    							%>
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
        <script src=".././js/jquery.min.js"></script>
<script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js">

</script>
<script src=".././js/validatorGrado.js" type="text/javascript"></script>
    <script>
function obtenerDatos(str) {
    if (str == 0) {
    	
       	document.getElementById("familiaProfesional").selectedIndex = "0";
       	document.getElementById("groupFamilia").className+="form-group has-feedback has-error";
       	document.getElementById("groupFamilia").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       	
       	document.getElementById("datosConsultasGrado").selectedIndex = "0";
       	document.getElementById("groupGrado").className+="form-group has-feedback has-error";
       	document.getElementById("groupGrado").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       	
       	document.getElementById("datosConsultasEspecializacion").selectedIndex = "0";
       	document.getElementById("groupEspecializacion").className+="form-group has-feedback has-error";
       	document.getElementById("groupEspecializacion").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       
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
                document.getElementById("familiaProfesional").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosRegistroFamiliaProfesionalAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
}

function obtenerDatosFamiliaProfesional(str) {
    if (str == 0) {
       
       	document.getElementById("grado").selectedIndex = "0";
       	document.getElementById("groupGrado").className+="form-group has-feedback has-error";
       	document.getElementById("groupGrado").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       	
       	document.getElementById("datosConsultasEspecializacion").selectedIndex = "0";
       	document.getElementById("groupEspecializacion").className+="form-group has-feedback has-error";
       	document.getElementById("groupEspecializacion").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       
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
}

function obtenerDatosGrado(str) {
    if (str == 0) {
    	document.getElementById("datosConsultasEspecializacion").selectedIndex = "0";
       	document.getElementById("groupEspecializacion").className+="form-group has-feedback has-error";
       	document.getElementById("groupEspecializacion").childNodes[2].className="form-control-feedback bv-no-label glyphicon glyphicon-remove";
       
        
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
<script src=".././js/jquery.min.js"></script>
<script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js">

</script>
<script src=".././js/validator.js" type="text/javascript">
</script>
</body>
</html>