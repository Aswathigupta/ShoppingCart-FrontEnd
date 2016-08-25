<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<h2>Please fill the details</h2>

	<form:form action="here/home" method="post" commandName="user">
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="id" />
					</form:label></td>

				<td><form:input path="id" pattern=".{4,7}" required="true"
						title="id should contains 4 to 7 characters" /></td>

				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('id')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>
				</br>
			</tr>
			<tr>
				<td><form:label path="name">
						<spring:message text="name" />
					</form:label></td>

				<td><form:input path="name" required="true"
						title="name should not be empty" /></td>

				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('name')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>
				<br />
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input path="password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td>

				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('password')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>
				<br />
			</tr>

			<tr>
				<td><form:label path="emailID">
						<spring:message text="emailID" />
					</form:label></td>

				<td><form:input type="emailID" path="emailID" /></td>

				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('emailID')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>
				<br />
			</tr>

			<tr>
				<td><form:label path="address">
						<spring:message text="address" />
					</form:label></td>

				<td><form:input path="address" required="true" /></td>

				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>
				<br />
			</tr>

			<tr>
				<td><form:label path="contactNumber">
						<spring:message text="contactNumber" />
					</form:label></td>

				<td><form:input path="contactNumber" required="true" /></td>

				<c:forEach
					items="${flowRequestContext.messageContext.getMessagesBySource('contactNumber')}"
					var="err">
					<div>
						<span>${err.text}</span>
					</div>
				</c:forEach>
				<br />
			</tr>

			<tr>

				<td><input type="submit"
					value="<spring:message text="Register"/>" /></td>
				<td><input type="reset" value="<spring:message text="Reset"/>" />
				</td>
			</tr>

		</table>

	</form:form>




</body>
</html>-->