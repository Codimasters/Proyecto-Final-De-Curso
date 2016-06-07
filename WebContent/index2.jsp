<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    <%@include file="./Bootstrap/css/bootstrap.min.css"%>
</style>
<title>Iniciar Sesi&oacuten</title>
</head>
<style>
body{
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
<div class="fullscreen-bg">
    <video loop muted autoplay poster="img/videoframe.jpg" class="fullscreen-bg__video">
        <source src="./video/portada.mp4" type="video/webm">
        <source src="./video/portada.mp4" type="video/mp4">
        <source src="./video/portada.mp4" type="video/ogg">
    </video>
</div>
<div class="container" style="margin-top:30px">

<div class="col-md-12">
    <div class="modal-dialog" style="margin-bottom:0">
        <div class="modal-content">
                    <div class="panel-heading">
                        <h3 class="panel-title">Iniciar Sesi&oacuten</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="comparacionLogin.jsp" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Nombre de usuario" name="nombreusuario" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Contrase&ntilde;a" name="password" type="password" value="">
                                </div>
                                <center><input type="submit" class="btn btn-sm btn-success" value="Inicia Sesion"></input></center>
                            </fieldset>
                        </form>
                    </div>
                </div>
    </div>
</div>
<hr>

</div>

<div class="container content">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="testimonials">
            	<div class="active item">
                  <blockquote><p>Un proyecto bastante bonito e intuitivo, han merecido la pena los paquetes de tabaco consumidos.</p></blockquote>
                  <div class="carousel-info">
                    <img alt="" src="./imagenes/sergio.jpg" class="pull-left">
                    <div class="pull-left">
                      <span class="testimonials-name" style="color:#cdff8f">Sergio Lucena</span>
                      <span class="testimonials-post" style="color:white;">Desarrollador de la App</span>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
<script type="text/javascript">
	<%@include file="./Bootstrap/js/bootstrap.min.js"%>
</script>

