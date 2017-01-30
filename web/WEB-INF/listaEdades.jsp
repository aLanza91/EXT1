<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*, util.*,java.util.*,java.io.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>Lista de los usuarios actualmente registrados ordenada por edad: </p>
<%
Archivo archivo = (Archivo) session.getAttribute("Archivo");
ArrayList<Persona> listaPersonas = archivo.leeListaPersonas();
if(listaPersonas.isEmpty()){
%>
No hay ningun usuario actualmente registrado
		<form method="post" action="index.jsp">
		<input type="submit" value="Volver">
		</form>
<%
}else{
	Collections.sort(listaPersonas);
		int i=1;
	for (Persona p:listaPersonas){
		String s;
		s=i+". "+p.getNombre()+" "+p.getApellidos()+", email: "+p.getEmail()+", edad: "+p.getEdad();
		out.print(s+"<br>");
		i++;
	}
	
	%>
		<form method="post" action="index.jsp">
		<input type="submit" value="Volver">
		</form>
	<%

}
 %>
</body>
</html>