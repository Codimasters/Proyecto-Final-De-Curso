<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="url.url.*" %>
    
   <%
   session.invalidate();
   out.println("<script>window.location.href='http://localhost:8080/proyecto_final_curso/faces/'</script>");
   %>