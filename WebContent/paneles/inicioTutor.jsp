<%@ page import="entities.*" %>
<%@ page language="java" import="packageConexion.*" %>
<%@ page language="java" import="url.url.*" %>
<%@ page language="java" import="java.sql.*" %>

<%
Usuario usuario = (Usuario)session.getAttribute("sesion");
if (usuario == null){
	out.println("<script>alert('Intentando acceder a un area restringida.')</script>");
	out.println(url.url.redirigir(".././index.jsp"));
}

else if(usuario.getTipoUsuario().getIdTipoUsuario()!=5){
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=4){
		out.println("<script>alert('Intentando acceder a un area restringida.')</script>");
		out.println(url.url.redirigir(".././index.jsp"));	
	}
	
}
%>

<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head lang="es">
	<meta charset="utf-8">
	<!--Importacion de diferentes archivos necesarios para la utilizacion de bootstrap, css y bootstrap validator -->
	<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href=".././css/navs/admin.css" rel="stylesheet">
	<link href=".././css/inicio.css" rel="stylesheet">
	<title>Portada</title>
	<link rel='shortcut icon' type='image/x-icon' href='.././favicon.ico' />
	<link rel="stylesheet" href=".././css/jquery.fullpage.min.css">
</head>
<body class="tema<%if (session.getAttribute("tema")!=null){ out.println(session.getAttribute("tema"));} else{out.println("1");}%>">


<!--                                                             NAV VERTICAL                                                                      -->
<nav id="menu" class="navbar <%=(String)session.getAttribute("temaNav") %> sidebar navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#inicio">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
        <li><a href="#observarAlumnosACargo">Observar tus alumnos<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon glyphicon-th-list"></span></a></li> 
        <li><a href="#observarTusDatos">Observar tus datos<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon glyphicon-th-list"></span></a></li> 
          
            
          </ul>
          
        <ul class="nav navbar-nav navbar-bottom">         
        <li ><a href="./perfil.jsp">Ajustes<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a></li>
        
        <li class="dropdown" id="temas">
         	<a href="" class="dropdown-toggle" data-toggle="dropdown">Temas<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tint"></span></a>
       	  <ul class="dropdown-menu forAnimate" role="menu">
	            <li class="enlace"><a id="1" href=".././tema.jsp?tema=1">Por defecto<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-pushpin"></span></a></li>
	            <li class="enlace"><a id="2" href=".././tema.jsp?tema=2">Minimalista<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-unchecked"></span></a></li>
	            <li class="enlace"><a id="3" href=".././tema.jsp?tema=3">Incandescente<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-fire"></span></a></li>
	            <li class="enlace"><a id="4" href=".././tema.jsp?tema=4">Hexagono<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-large"></span></a></li>
	            <li class="enlace"><a id="5" href=".././tema.jsp?tema=5">Miop&iacutea<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-eye-open"></span></a></li>
	            <li class="enlace"><a id="6" href=".././tema.jsp?tema=6">Alto contraste<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-adjust"></span></a></li>
          </ul>
          </li>        
        <li ><a href=".././cerrarSesion.jsp">Cerrar Sesi&oacuten<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-off"></span></a></li>
      	</ul>
      </ul>
      
      
    </div>
  </div>
</nav>

<!--                                                             SERVICIOS                                                                      -->
<section id="fullpage">
<div class="container">
	
       
                <div class="section" id="section0">
                <h1 class="text-center">SERVICIOS QUE OFRECE NUESTRA PLATAFORMA</h1><hr>
                    <div class="box" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='background:#272222;'");}else{}%>">
                    
                        <div class="box-content">
                        	
                            <h2 class="tag-title">DISE&NtildeO RESPONSIVE</h2>
                            <hr>
                            <p>
                            Disfruta del dise&ntildeo responsive de la aplicaci&oacuten, deja que nosotros hagamos lo duro por ti, navega sin quebraderos de cabeza.
                            </p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">Learn more</a>
                        </div>
                    </div>
                </div>
                
                <div class="section" id="section1">
                <h1><center>OBSERVAR ALUMNOS A CARGO</center></h1><hr>
                
                <div class="well" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='color:white; background:#272222; height: 75%;overflow: auto;'");}else{out.println("style='height: 75%;overflow: auto;'");}%>>
			      <table class="table">
			      <thead>
			        <tr>
			          <th>Nombre</th>
			          <th>Apellido1</th>
			          <th>Apellido2</th>
			          <th style="width: 36px;"></th>
			        </tr>
			      </thead>
			      <tbody id="datosProfe">
			      	 <%
			      	Conexion conexion= new Conexion();
         			 Statement st= conexion.conectar().createStatement();
					 ResultSet rs= st.executeQuery("SELECT idUsuario, nombre, apellido1, apellido2 from datosPersonales where idUsuario in (select idUsuario from alumno where idTutor='"+usuario.getIdUsuario()+"') ");
					 while(rs.next()){
					 	String nombreAlumno= rs.getString(2);
					 	String apellido1Alumno= rs.getString(3);
					 	String apellido2Alumno= rs.getString(4);
					 	out.println("<tr id='"+rs.getInt(1)+"'><td>"+nombreAlumno+"</td><td>"+apellido1Alumno+"</td><td>"+apellido2Alumno+"</td></tr>");
					 }	
						
						
						
			      	 %>
			      </tbody>
			    </table>
			</div>
			</div>
			
             <div class="section" id="section2">
        <div class="well" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='color:white; background:#272222; height: 75%;overflow: auto;'");}else{out.println("style='height: 75%;overflow: auto;'");}%>>
        <h1><center>PROFESORES ASIGNADOS</center></h1><hr>
           
			<table class="table">
		      <thead>
		        <tr>
		          <th>Nombre</th>
		          <th>Apellido 1</th>
		          <th>Apellido 2</th>
		          <th>DNI</th>
		          <th style="width: 36px;"></th>
		        </tr>
		      </thead>
		      <tbody id="datos">	
		      		<%
					
		      		
		      			rs= st.executeQuery("SELECT * FROM datosPersonales where idUsuario in (select idProfesor from relacionPT where idTutor='"+usuario.getIdUsuario()+"')");
				      	 while(rs.next()){
				      		 if (usuario!=null){
				      			if (rs.getInt(1) != usuario.getIdUsuario()){
				     				out.println("<div> <tr id='"+rs.getInt(1)+"'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td><a value='"+rs.getInt(1)+"' href='./panelModificarUsuario.jsp?a="+rs.getInt(1)+"'></td></tr>");
				          		}	 
				      		 }
				      		
				 		}	
		      		
		      		
		              %>  
            </tbody>
    </table>
    
                  <h1><center>TU EMPRESA </center></h1><hr>
                   
			<table class="table">
		      <thead>
		        <tr>
		           <th>Nombre</th>
		          <th>Acronimo</th>
		          <th>Rubro</th>
		          <th>Direccion Fiscal</th>
		          <th>Region</th>
		          <th>Ciudad</th>
		          <th>Telefono</th>
		          <th>Email</th>
		          <th style="width: 36px;"></th>
		        </tr>
		      </thead>
		      <tbody id="datos">	
		      		<%
		      		
		     		out.println("<div> <tr><td>"+usuario.getTutor().getEmpresa().getNombre()+"</td><td>"+usuario.getTutor().getEmpresa().getAcronimo()+"</td><td>"+usuario.getTutor().getEmpresa().getRubro()+"</td><td>"+usuario.getTutor().getEmpresa().getDireccionFiscal()+"</td><td>"+usuario.getTutor().getEmpresa().getRegion()+"</td><td>"+usuario.getTutor().getEmpresa().getCiudad()+"</td><td>"+usuario.getTutor().getEmpresa().getTelefono()+"</td><td>"+usuario.getTutor().getEmpresa().getEmail()+"</td></tr>");
		          			 
		      		 
		      		
		 		
		              %>  
            </tbody>
	    </table>           
                </div>
             </div>
          </div>
				
                
</section>
    
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="../.././Bootstrap/js/bootstrap.js"></script>
<script src=".././js/jquery.min.js"></script>
        <script src=".././js/jquery-ui-min.js"></script>
        <script src=".././js/jquery.fullpage.min.js"></script>
        <script src=".././js/jquery.slimscroll.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                $('#fullpage').fullpage({
                    anchors: ['inicio', 'observarAlumnosACargo', 'observarTusDatos'],
                    menu: '#menu',
                    loopTop: false,
                    loopBottom: false,
                    slidesNavigation: true,
                    scrollOverflow: true,
                    scrollingSpeed: 600
                });
            });
</script>
<script type="text/javascript">
function eliminarUsuario(str) { 

	document.getElementById(str).innerHTML="";
    if (window.XMLHttpRequest) {
        // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {
        // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		
        }
    };
    
    xmlhttp.open("GET",".././eliminarUsuarioAjax.jsp?q="+str,true);
    xmlhttp.send();
}
</script>
</html>
