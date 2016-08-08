<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Shopping chart</title>
<meta charset="utf-8">

<link href="resources/css/log.css" rel="stylesheet">

</head>
<body>

	Please login with your credentials
	<br> ${message}
	<c:url var="action" value="/login"></c:url>


	<form:form action="${action}" method="post">
		<table>
			<tr>
				<td>User Name:</td>
				<td><input type="name" name="name" placeholder="name"></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"
					placeholder="password" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Login"></td>
			</tr>

		</table>



	</form:form>



</body>
</html>