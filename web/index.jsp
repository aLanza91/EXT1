<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage='errores.jsp?pagOrigen=index.jsp'%>  
<%@ page import="beans.*, util.*,java.util.*,java.io.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="persona" scope="session" class="beans.Persona"></jsp:useBean>
<%
if(session.isNew()){
Archivo archivo = new Archivo(request.getServletContext());
session.setAttribute("Archivo", archivo);
}
Archivo archivo = (Archivo) session.getAttribute("Archivo");

 %>
<%@include file="header.jsp"%>
		<%
		String error = request.getParameter("error");
		String errorFormatoMail = "none";
		String errorRepetidoMail = "none";
		String errorEdad = "none";
		if (error!=null){
		switch (error){
			case "formatoEmail":
				errorFormatoMail="inline";
				break;
			case "emailRepetido":
				errorRepetidoMail="inline";
				break;
			case "edad":
				errorEdad = "inline";
				break;
		}
		}
		%>	
			<p>Introduzca sus datos personales :</p>
			<form method="post" action="controlador.jsp">
				<label for="nombre">Nombre: </label><input id="nombre" value="<jsp:getProperty property='nombre' name='persona'/>" name="nombre" required="required"><br />
				<label for="apellidos">Apellidos: </label><input id="apellidos" value="<jsp:getProperty property='apellidos' name='persona'/>" name="apellidos" required="required"><br />
				<label for="email">Email: </label><input id="email" value="<jsp:getProperty property='email' name='persona'/>" name="email" required="required">
				<div style="display:<%=errorFormatoMail%>">Debe tener @ para ser un email válido</div>
				<div style="display:<%=errorRepetidoMail%>">El email está repetido</div><br />
				<label for="edad">Edad: </label><input type="number" id="edad" value="<jsp:getProperty property='edad' name='persona'/>" name="edad" required="required">
				<div style="display:<%=errorEdad%>">Debe ser mayor de edad</div><br />
				<input type="hidden" name="action" value="index">
				<input name="enviar" type="submit" value="enviar">
			</form>
			<br />
			<br />
			<br />
			<form method="post" action="controlador.jsp">
				<input type="hidden" name="action" value="lista">
				<input name="enviar" type="submit" value="Ver una lista de los usuarios registrados ordenados por edad">
			</form>
</body>
</html>