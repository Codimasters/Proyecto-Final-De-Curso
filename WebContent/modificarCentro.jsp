<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link href=".././Bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<input type="text" class="form-control" id="buscador2" placeholder="Busqueda de centros" onkeyup='buscadorEmpresa(this.value)'></input>
	</div>
</div>


<div class="well" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='color:white; background:#272222; height: 75%;overflow: auto;'");}else{out.println("style='height: 75%;overflow: auto;'");}%>>
      <table class="table">
      <thead>
        <tr>
          <th>Nombre</th>

          <th style="width: 36px;"></th>
        </tr>
      </thead>
      <tbody id="datosCentro">
      	 <%
      	rs= st.executeQuery("SELECT * FROM centro");
  
      	 while(rs.next()){
      		
 			out.println("<div> <tr id='centro"+rs.getInt(1)+"'><td>"+rs.getString(2)+"<a value='"+rs.getInt(1)+"' href='./panelModificarCentro.jsp?a="+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarCentro' onclick='eliminarCentro(this.id)' id='"+rs.getInt(1)+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
      		
 		}
      	 %>
      </tbody>
    </table>
</div>
</body>
<script>
function eliminarCentro(str) { 

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