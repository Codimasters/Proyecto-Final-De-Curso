<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<input type="text" class="form-control" placeholder="Busqueda de usuarios"></input>
	</div>
</div>


<div class="well" style="height: 2px;
    height: 41%;
    overflow: auto;">
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
      <tbody>
      	 <%
      	rs= st.executeQuery("SELECT * FROM datosPersonales");
 		while(rs.next()){
 			out.println("<div> <tr id='"+rs.getInt(1)+"'><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td><td><a value='"+rs.getInt(1)+"' href='#'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarUsuario' onclick='eliminarUsuario(this.id)' id='"+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
 		}
      	 %>
      </tbody>
    </table>
</div>
</body>
<script>
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