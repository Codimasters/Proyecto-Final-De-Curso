
<%@ page import="entities.*" %>
<% Usuario usuario = (Usuario)session.getAttribute("sesion");%>
<%@ page language="java" import="packageConexion.*" %>
<%@ page language="java" import="panel.Admin.*" %>

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
    <link rel="stylesheet" href=".././css/jquery.fullpage.min.css">
</head>
<body class="tema<%out.println(session.getAttribute("tema"));%>">


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
        <li class="dropdown">
          <a href="#inicio" class="dropdown-toggle" data-toggle="dropdown">Gestionar Usuarios <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            
            
            <li class="dropdown-submenu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu">|Crear| <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
			<!--                                    MENU DE CREAR USUARIOS (INSERTAR LINKS FULLPAGE )                          -->
            <li><a href="#crearUsuario">&#183<u>Profesores/Alumnos</u></a></li>
            <li><a href="#crearTutor">&#183<u>Tutores</u></a>
            <li><a href="#crearResponsableEmpresa">&#183<u>Responsables</u></a>
        
          </ul></li>
            <li class="divider"></li>
			<!--                                    MENU DE MODIFICAR USUARIOS (INSERTAR LINKS FULLPAGE )                       -->
            <li><a href="#modificarUsuario">|Modificar|<span></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-pencil"></span></a></li>
            <li class="divider"></li>

           
          </ul></li>
          
          <li class="dropdown" id="centros">
         	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestionar Centros <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-education"></span></a>
       	  <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="#crearCentro">Crear centro<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>
            <li><a href="#crearFamiliaProfesional">Crear fam.Prof<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>
            <li><a href="#crearGrado">Crear grado<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>
            <li><a href="#crearEspecializacion">Crear espec.<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>
          </ul>
          </li> 
          
          <li class="dropdown" id="gestionarEmpresa">
         	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestionar Empresas <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plane"></span></a>
       	  <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="#crearEmpresa">|Crear|<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>
            <li><a href="#modificarEmpresa">|Modificar|<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-pencil"></span></a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
          </ul>
          </li> 
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
        <li ><a href="#">Cerrar Sesi&oacuten<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-off"></span></a></li>
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
                <h1><center>REGISTRAR NUEVO ALUMNO/PROFESOR</center></h1><hr>
                    <!--<div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">BUENA GESTI&OacuteN</h1>
                            <hr />
                            <p>Disfruta de una buena gesti&oacuten sobre la informaci&oacuten que nos facilitas. <br>&#161Nosotros nos encargamos de que no se pierda nada por el camino!</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">Learn more</a>
                        </div>
                    </div>-->
                 <%@include file=".././registro.jsp" %>
                </div>
                
                <div class="section" id="section2">
                <h1><center>REGISTRAR NUEVO TUTOR</center></h1><hr>
                    <!--<div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">BUENA GESTI&OacuteN</h1>
                            <hr />
                            <p>Disfruta de una buena gesti&oacuten sobre la informaci&oacuten que nos facilitas. <br>&#161Nosotros nos encargamos de que no se pierda nada por el camino!</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">Learn more</a>
                        </div>
                    </div>-->
                 <%@include file=".././registroTutor.jsp" %>
                </div>
                
                <div class="section" id="section3">
                <h1><center>EDITAR USUARIOS</center></h1><hr>
                 <%@include file=".././modificarUsuario.jsp" %>
                </div>
                
                <div class="section" id="section4">
                 	<div  >
                 		<%@include file=".././registroEmpresa.jsp" %>
                	</div>
            	</div> 
            	
            	<div class="section" id="section5">
                 	<div  >
                 		<%@include file=".././registroResponsableEmpresa.jsp" %>
                	</div>
            	</div>      
            	<div class="section" id="section6">
                 	<div  >
                 		<%@include file=".././modificarEmpresa.jsp" %>
                	</div>
            	</div>
            	<div class="section" id="section7">
                 	<div  >
                 		<%@include file=".././registroCentro.jsp" %>
                	</div>
            	</div>
            	<div class="section" id="section8">
                 	<div>
                 		<%@include file=".././registroFamiliaProfesional.jsp" %>
                	</div>
            	</div>
            	<div class="section" id="section9">
                 	<div>
                 		<%@include file=".././registroGrado.jsp" %>
                	</div>
            	</div>
            	<div class="section" id="section10">
                 	<div>
                 		<%@include file=".././registroEspecializacion.jsp" %>
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
                    anchors: ['inicio','crearUsuario','crearTutor', 'modificarUsuario','crearEmpresa', 'crearResponsableEmpresa','modificarEmpresa','crearCentro', 'crearFamiliaProfesional','crearGrado','crearEspecializacion'],
                    menu: '#menu',
                    loopTop: false,
                    loopBottom: false,
                    slidesNavigation: true,
                    scrollOverflow: true,
                    scrollingSpeed: 600
                });
            });
</script>
</html>
