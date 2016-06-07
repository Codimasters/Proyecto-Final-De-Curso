<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
// usuario = (Usuario)session.getAttribute("sesion");
comprobar= false;
if(usuario.getTipoUsuario().getIdTipoUsuario()!=5 ){
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=3){
		out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando modificarEmpresa')</script>");
		out.println(url.url.redirigir("index.jsp"));
	}
}

%>
<html>
<head>
<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<input type="text" class="form-control" id="buscador" placeholder="Busqueda de usuarios" onkeyup='buscadorEmpresa(this.value)'></input>
	</div>
</div>


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
      <tbody id="datosEmpresa">
      	 <%
      	rs= st.executeQuery("SELECT * FROM empresa");
  
      	 while(rs.next()){
      		
 			out.println("<div> <tr id='empresa"+rs.getInt(1)+"'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td><a value='"+rs.getInt(1)+"' href='./panelModificarEmpresa.jsp?a="+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarEmpresa' onclick='eliminarEmpresa(this.id)' id='"+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
      		
 		}
      	 %>
      </tbody>
    </table>
</div>
</body>
<script>
function eliminarEmpresa(str) { 

		document.getElementById("empresa"+str).innerHTML="";
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
        
        xmlhttp.open("GET",".././eliminarEmpresaAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    
function buscadorEmpresa(str) {

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("datosEmpresa").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosBuscadorEmpresaAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
</script>
</html>