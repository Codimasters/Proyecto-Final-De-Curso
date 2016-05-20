<%@page import="url.*"%>
<html>
<head>
</head>
<body>
	<h1>SEGUNDA PAGINA</h1>
	<%
	url nuevaurl = new url();
		String url2 = nuevaurl.redirigir("./index");
		out.println("<a href="+url2+">Volver</a>");
		System.out.println("--La url del objeto es: "+url2+"--");
	%>
</body>
</html>