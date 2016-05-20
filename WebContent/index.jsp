<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
    <%@include file="./Bootstrap/css/bootstrap.min.css"%>
    <%@include file="./css/css.css"%>
</style>
<title>Iniciar Sesi&oacuten</title>
</head>

<body>
<div class="container" style="margin-top:30px">

<div class="col-md-12"><hr>
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
                                <input type="submit" class="btn btn-sm btn-success">Inicia Sesi&oacuten</input>
                            </fieldset>
                        </form>
                    </div>
                </div>
    </div>
</div>
<hr>

</div>
	
</body>

</html>
<script type="text/javascript">
	<%@include file="./Bootstrap/js/bootstrap.min.js"%>
</script>

