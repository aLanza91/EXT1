<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*, util.*,java.util.*,java.io.*"%>  
<div Style="border-style: solid;">
<p>Lista de usuarios registrados: </p>
<%
Archivo archiv = (Archivo) session.getAttribute("Archivo");
ArrayList<Persona> listaPersona = archiv.leeListaPersonas();
if (listaPersona.isEmpty()){
	out.print("no hay ninguna persona registrada");
}else{
	int i=1;
	for (Persona p:listaPersona){
		String s;
		s=i+". "+p.getNombre()+" "+p.getApellidos()+", email: "+p.getEmail()+", edad: "+p.getEdad();
		out.print(s+"<br>");
		i++;
	}
}
 %>
<br>
</div>