
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
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=2){
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
          <a href="#inicio" class="dropdown-toggle" data-toggle="dropdown">Informaciones <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-search"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            
            
            <li class="dropdown-submenu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown-submenu">|Observar Usuarios| <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
			<!--                                    MENU DE CREAR USUARIOS (INSERTAR LINKS FULLPAGE )                          -->
            <li><a href="#observarProfesores">&#183<u>Profesores</u></a></li>
            <li><a href="#observarTutores">&#183<u>Tutores</u></a>
            <li><a href="#observarAlumnos">&#183<u>Alumnos del centro</u></a>
        
          </ul></li>
          <li id="centros">
           	  
            <li><a href="#observarCentros">Observar Centros<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>   
         
          </li> 
          
          <li id="empresa">
            <li><a href="#observarEmpresas">|Observar Empresas|<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-plus"></span></a></li>
          <li class="divider"></li>
            
          </ul>
          </li> 
     
           

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
                <h1><center>OBSERVAR PROFESORES DE TU CENTRO</center></h1><hr>
                
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
		
		
						
						ResultSet rs= st.executeQuery("SELECT nombre, apellido1, apellido2 from datosPersonales where idUsuario in (select idUsuario from profesor where idCentro='"+usuario.getAlumno().getCentro().getIdCentro()+"') ");
						while(rs.next()){
							String nombreProfe= rs.getString(1);
							String apellido1Profe= rs.getString(2);
							String apellido2Profe= rs.getString(3);
							out.println("<tr><td>"+nombreProfe+"</td><td>"+apellido1Profe+"</td><td>"+apellido2Profe+"</td></tr>");
						}
			      	 %>
			      </tbody>
			    </table>
			</div>
			</div>
			
         			
             
                
                <div class="section" id="section2">
                <h1><center>DATOS DE TU TUTOR</center></h1><hr>
         			
         			
         			
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
				      <tbody id="datosTutor">
				      	 <%
				     	st= conexion.conectar().createStatement();
				 		
				 		
							
							rs= st.executeQuery("SELECT nombre, apellido1, apellido2 from datosPersonales where idUsuario=(select idTutor from alumno where idUsuario='"+usuario.getAlumno().getCentro().getIdCentro()+"') ");
							while(rs.next()){
								String nombreTutor= rs.getString(1);
								String apellido1Tutor= rs.getString(2);
								String apellido2Tutor= rs.getString(3);
								out.println("<tr><td>"+nombreTutor+"</td><td>"+apellido1Tutor+"</td><td>"+apellido2Tutor+"</td></tr>");
							}
							
				      	 %>
			      		</tbody>
			   		 </table>
					</div>
       
                </div>
                
                
                <div class="section" id="section3">
                <h1><center>DATOS DE ALUMNOS DE TU CENTRO</center></h1><hr>
         			
         			
         			
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
				      <tbody id="datosAlumno">
				      	 <%
				     	st= conexion.conectar().createStatement();
				 		
				 		
							rs= st.executeQuery("SELECT nombre, apellido1, apellido2 from datosPersonales where idUsuario in(select idUsuario from alumno where idCentroAlumno='"+usuario.getAlumno().getCentro().getIdCentro()+"') ");
							while(rs.next()){
								String nombreAlumnos= rs.getString(1);
								String apellido1Alumnos= rs.getString(2);
								String apellido2Alumnos= rs.getString(3);
								out.println("<tr><td>"+nombreAlumnos+"</td><td>"+apellido1Alumnos+"</td><td>"+apellido2Alumnos+"</td></tr>");
							}
							
				      	 %>
			      		</tbody>
			   		 </table>
					</div>
       
                </div>
                   <div class="section" id="section4">
                <h1><center>CENTROS DEL PROGRAMA</center></h1><hr>
         			
         			
         			
                <div class="well" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='color:white; background:#272222; height: 75%;overflow: auto;'");}else{out.println("style='height: 75%;overflow: auto;'");}%>>
			      <table class="table">
			      <thead>
			        <tr>
			          <th>Nombre</th>
			          <th style="width: 36px;"></th>
			        </tr>
				      </thead>
				      <tbody id="datosAlumno">
				      	 <%
				     	st= conexion.conectar().createStatement();
				 		
				 		
							rs= st.executeQuery("SELECT nombreCentro from centro");
							while(rs.next()){
								String nombreCentro= rs.getString(1);
								
								out.println("<tr><td>"+nombreCentro+"</td></tr>");
							}
							
				      	 %>
			      		</tbody>
			   		 </table>
					</div>
       
                </div>
				
				              <div class="section" id="section4">
                <h1><center>EMPRESAS DEL PROGRAMA</center></h1><hr>
         			
         			
         			
                <div class="well" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='color:white; background:#272222; height: 75%;overflow: auto;'");}else{out.println("style='height: 75%;overflow: auto;'");}%>>
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
				      <tbody id="datosAlumno">
				      	 <%
				     	st= conexion.conectar().createStatement();
				 		
				 		
							rs= st.executeQuery("SELECT * from empresa");
							while(rs.next()){
								String nombreEmpresa= rs.getString(1);
								String acronimo= rs.getString(2);
								String rubro= rs.getString(3);
								String direccionFiscal= rs.getString(4);
								String region= rs.getString(5);
								String ciudad= rs.getString(6);
								String telefono= rs.getString(7);
								String email= rs.getString(8);
								
								out.println("<tr><td>"+nombreEmpresa+"</td><td>"+acronimo+"</td><td>"+rubro+"</td><td>"+direccionFiscal+"</td><td>"+region+"</td><td>"+ciudad+"</td><td>"+telefono+"</td><td>"+email+"</td></tr>");
							}
							
				      	 %>
			      		</tbody>
			   		 </table>
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
                    anchors: ['inicio','observarProfesores','observarTutores', 'observarAlumnos','observarCentros', 'observarEmpresas'],
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
