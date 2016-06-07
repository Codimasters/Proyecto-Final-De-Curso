<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

//usuario = (Usuario)session.getAttribute("sesion");
comprobar= false;
if(usuario.getTipoUsuario().getIdTipoUsuario()!=5 ){
	if(usuario.getTipoUsuario().getIdTipoUsuario()!=6){
		out.println("<script>alert('Se ha intentado acceder a una zona restringida, redireccionando')</script>");
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
		<input type="text" class="form-control" id="buscador2" placeholder="Busqueda de centros" onkeyup='buscadorCentro(this.value)'></input>
	</div>
</div>


<div class="well" <% if ((String)session.getAttribute("temaCaja")== "box-inverse"){out.println("style='color:white; background:#272222; height: 75%;overflow: auto;'");}else{out.println("style='height: 75%;overflow: auto;'");}%>>
      <table class="table">
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Familia Profesionales</th>
          <th>Grados</th>
          <th>Especializaciones</th>

          <th style="width: 36px;"></th>
        </tr>
      </thead>
      <tbody id="datosCentro">
      	 <%
      	rs= st.executeQuery("SELECT * FROM centro");
      	Statement st2 = conexion.conectar().createStatement();
  
      	 while(rs.next()){
      		int idCentro2=rs.getInt(1);
      		String nombreCentro2=rs.getString(2);
      		int cuentaFamilia=0;
      		ResultSet rs2=st2.executeQuery("select count(*) from relacionCF WHERE idCentro='"+idCentro2+"'");
      		if(rs2.next()){
      			cuentaFamilia=rs2.getInt(1);
      		}
      		
      		int cuentaGrado = 0;
      		rs2=st2.executeQuery("select count(*) from relacionFG WHERE idCentro='"+idCentro2+"'");
      		if(rs2.next()){
      			cuentaGrado=rs2.getInt(1);
      		}
      		
      		int cuentaEspecializacion = 0;
      		rs2=st2.executeQuery("select count(*) from relacionGE WHERE idCentro='"+idCentro2+"'");
      		if(rs2.next()){
      			cuentaEspecializacion=rs2.getInt(1);
      		}
      		
 			out.println("<div> <tr id='centro"+idCentro2+"'><td>"+nombreCentro2+"</td><td>"+cuentaFamilia+"</td><td>"+cuentaGrado+"</td><td>"+cuentaEspecializacion+"<a value='"+idCentro2+"' href='./panelModificarCentro.jsp?a="+idCentro2+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-pencil'></span></a></td><td>  <a href='#modificarCentro' onclick='eliminarCentro(this.id)' id='"+idCentro2+"'><span style='font-size:16px;' class='pull-right hidden-xs showopacity glyphicon glyphicon-remove'></span></a></td></tr>");
      		
 		}
      	 %>
      </tbody>
    </table>
</div>
</body>
<script>
function eliminarCentro(str) { 

		document.getElementById("centro"+str).innerHTML="";
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
        
        xmlhttp.open("GET",".././eliminarCentroAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
    
function buscadorCentro(str) {

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("datosCentro").innerHTML = xmlhttp.responseText;
            }
        };
        
        xmlhttp.open("GET",".././obtenerDatosBuscadorCentroAjax.jsp?q="+str,true);
        xmlhttp.send();
    }
</script>
</html>