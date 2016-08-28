<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register/Sign in</title>
<link href="resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/memenu.css" rel="stylesheet" type="text/css"
	media="all" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="resources/js/bootstarp.js"></script>
<script src="resources/js/bootstarp.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/simpleCart.min.js"></script>

<script type="text/javascript" src="resources/js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
</head>
<body>
	<h2>Please fill the details</h2>

	<form:form modelAttribute="user">
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="id" />
					</form:label></td>

				<td><form:input path="id" pattern=".{4,7}"
						title="id should contains 4 to 7 characters" placeholder="ID" />
					/></td>
			</tr>

			<c:forEach
				items="${flowRequestContext.messageContext.getMessagesBySource('id')}"
				var="err">
				<div>
					<span>${err.text}</span>
				</div>
			</c:forEach>
			<br />

			<tr>
				<td><form:label path="name">
						<spring:message text="name" />
					</form:label></td>

				<td><form:input path="name" required="true"
						title="name should not be empty" /></td>
			</tr>
			<c:forEach
				items="${flowRequestContext.messageContext.getMessagesBySource('name')}"
				var="err">
				<div>
					<span>${err.text}</span>
				</div>
			</c:forEach>
			<br />
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input path="password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td>
			</tr>

			<c:forEach
				items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
				var="err">
				<div>
					<span>${err.text}</span>
				</div>
			</c:forEach>
			<br />

			<tr>
				<td><form:label path="emailID">
						<spring:message text="emailID" />
					</form:label></td>

				<td><form:input type="emailID" path="emailID" /></td>
			</tr>

			<c:forEach
				items="${flowRequestContext.messageContext.getMessagesBySource('emailID')}"
				var="err">
				<div>
					<span>${err.text}</span>
				</div>
			</c:forEach>
			<br />

			<tr>
				<td><form:label path="address">
						<spring:message text="address" />
					</form:label></td>

				<td><form:input path="address" required="true" /></td>
			</tr>
			<c:forEach
				items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
				var="err">
				<div>
					<span>${err.text}</span>
				</div>
			</c:forEach>
			<br />

			<tr>
				<td><form:label path="contactNumber">
						<spring:message text="contactNumber" />
					</form:label></td>

				<td><form:input path="contactNumber" pattern="^\d{10}$"
						required="true" title="contactnumber  should contains 10 numberss" /></td>
			</tr>

			<c:forEach
				items="${flowRequestContext.messageContext.getMessagesBySource('contactNumber')}"
				var="err">
				<div>
					<span>${err.text}</span>
				</div>
			</c:forEach>
			<br />

			<tr>
			 <button name="_eventId_submit" type="submit" class="btn btn-default">Register</button>
			</tr>

		</table>

	</form:form>



</body>
</html>