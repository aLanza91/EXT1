<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String pagOrigenError = (String) request.getParameter("pagOrigen");
	%>
	<P>
		Ha ocurrido un error en la p&aacute;gina:<%=pagOrigenError%></P>
	<P>Descripci&oacute;n de la excepci&oacute;n:</P>
	<P>&nbsp;</P>
	<%=exception.toString()%>
</body>
</html>