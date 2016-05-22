

<%@ page language="java" import="packageConexion.*" %>
<%@ page language="java" import="panel.Admin.*" %>
<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head lang="es">
	<meta charset="utf-8">
	<!--Importacion de diferentes archivos necesarios para la utilizacion de bootstrap, css y bootstrap validator -->
	<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="../.././Bootstrap/js/bootstrap.js"></script>
	<title>Portada</title>
</head>
<body>
<!-- Menu de navegacion-->
	<nav  class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse" >
				<span class="sr-only">Menú de navegación</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="index.html" class="navbar-brand">WikiWars</a>
		</div>
		<div id="navbarCollapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
<!-- Lista del menu de navegación con todo el contenido de la pagina-->
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#personajes">Personajes <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="personajes.html#obi">Obi Wan</a></li>
						<li><a href="personajes.html#quigon">Qui Gon Jinn</a></li>
						<li><a href='personajes.html#yoda'>Yoda</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#planetas">Planetas <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="planetas.html#alderaan">Alderaan</a></li>
						<li><a href="planetas.html#tatooine">Tatooine</a></li>
						<li><a href='planetas.html#coruscant'>coruscant</a></li>
					</ul>
				</li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#naves">Naves <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="naves.html#cuervo">Cuervo Oxidado</a></li>
						<li><a href="naves.html#eclipse">Eclipse</a></li>
						<li><a href='naves.html#tie'>TIE</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<!--Cabecera del documento -->
	<header>
		<figure>
	<!-- Imagen de la cabecera-->
			<img src="recursos/fotos/rsz_1rsz_headerstarwars.gif" class="img-responsive"></img>
		</figure>
	</header>
	<!--Div que engloba todo el contenido de la página para aplicarle un background-->
	<div class='fondo'>
		<section >
		<!--Primer articulo con la introduccion-->
			<article class='row'>
				<div class="col-md-6 col-md-offset-3 section contenedor">
					<h1 class='fuente'>Bienvenido a WikiWars!!</h1>
					<p class='fuente'>Hola, esta página web, con temática de <span><cite>Star Wars</cite></span> está diseñada por Alejandro Oses Armentas, un alumno del grado superior "<span><cite>Desarrollo de aplicaciones web</cite></span>". </p>
					<p class='fuente'>En esta página, nos encontraremos con información acerca de diferentes <span><strong>naves, planetas y personajes</strong></span> que salen en las películas o los videojuegos.</p>
					<p class='fuente'> A continuacion se mostrará un <span><strong>trailer</strong></span> de una de las películas.</p>
		<!--Video de youtube-->
					<figure>
						<iframe width="560" height="315" src="https://www.youtube.com/embed/sGbxmsDFVnE" frameborder="0" allowfullscreen></iframe>
					</figure>
				</div>

			</article>
		</section>

		<section>
			<article class='row formulario'>
		<!--Formulario para enviar un correo a la web-->
				<form class="col-md-6 col-md-offset-3 contenedor" role="form" id="formulario" data-toggle="validator">
					<h1 class="fuente">Contacto</h1>
					<div class="form-group">
						<label class="control-label fuente">Nombre</label>
						<input type="text" class="form-control" name="nombre" placeholder="Nombre">
					</div>
					<div class="form-group">
						<label class="control-label fuente">Email</label>
						<input type="email" class="form-control" name="email" placeholder="Email">
					</div>
					<div class="form-group">
						<label class="control-label fuente">Asunto</label>
						<input type="text" class="form-control" name="asunto" placeholder="Asunto">
					</div>

					<div class="form-group">
						<label class="control-label fuente">Mensaje</label>
						<textarea class="form-control"rows="3" name="mensaje"></textarea>
					</div>
					<div class="row">
						<button type="submit" class="btn btn-default col-md-6 col-md-offset-3">Enviar</button>
					</div>
				</form>
			</article>
		</section>
		<footer class ="row contenedor2">
			<div class="col-md-3 col-md-offset-5">
				<small class="fuente">Powered by <a href="http://getbootstrap.com/">Bootstrap</a> Diseñado por Alejandro Oses Armentas</small>
			</div>
		</footer>
	</div>
</body>
</html>
