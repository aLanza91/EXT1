<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage='errores.jsp?pagOrigen=controlador.jsp'%>      
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
String action = request.getParameter("action");
if(action==null){
	%>
		<jsp:forward page="index.jsp"></jsp:forward>
	<%
}
String nombre = request.getParameter("nombre");
String apellidos = request.getParameter("apellidos");
String email = request.getParameter("email");
int edad =0;
if(request.getParameter("edad")!=null){
edad = Integer.parseInt(request.getParameter("edad"));}
Archivo archivo = (Archivo)session.getAttribute("Archivo");
ArrayList<Persona> listaPersonas = archivo.leeListaPersonas();

switch (action){
	case "index":
		%>
		<jsp:setProperty property="nombre" name="persona" value="<%=nombre%>"/>
		<jsp:setProperty property="apellidos" name="persona" value="<%=apellidos%>"/>
		<% 
		if (Comprueba.compruebaFormatoEmail(email)){
				%>
		<jsp:forward page="index.jsp">
		<jsp:param value="formatoEmail" name="error" />
		</jsp:forward>
		<%
		}
		if (Comprueba.compruebaEmailRepetido(email,archivo)){
		%>
		<jsp:forward page="index.jsp">
		<jsp:param value="emailRepetido" name="error" />
		</jsp:forward>
		<%
		}
		%>
		<jsp:setProperty property="email" name="persona" value="<%=email%>"/>
		<%
		if (!Comprueba.compruebaMayorDeEdad(edad)){
			%>
		<jsp:forward page="index.jsp">
		<jsp:param value="edad" name="error" />
		</jsp:forward>
		<%
		}
		%>
		<jsp:setProperty property="edad" name="persona" value="<%=edad%>"/>
		Todas las propiedades han sido añadidas con éxito.
		<% 
		listaPersonas.add(persona);
		archivo.grabaListaPersonas(listaPersonas);
		session.invalidate();
		%>
			<form method="post" action="index.jsp">
			<input type="submit" value="Volver">
			</form>
		<%
	break;
	case "lista":
		%>
		<jsp:forward page="WEB-INF/listaEdades.jsp"></jsp:forward>
		<%
	break;
	default:
		%>
		<p>Debe pasar por el index y rellenar correctamente el formulario</p>
		<%

}
 %>
</body>
</html>