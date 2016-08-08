<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register/Sign in</title>
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
			</tr>
			<tr>
				<td><form:label path="name">
						<spring:message text="name" />
					</form:label></td>

				<td><form:input path="name" required="true"
						title="name should not be empty" /></td>
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input path="password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td>
			</tr>
			
			<tr>
				<td><form:label path="emailID">
						<spring:message text="emailID" />
					</form:label></td>

				<td><form:input type="emailID" path="emailID" /></td>
			</tr>

			<tr>
				<td><form:label path="address">
						<spring:message text="address" />
					</form:label></td>

				<td><form:input path="address" required="true" /></td>
			</tr>

<tr>
				<td><form:label path="contactNumber">
						<spring:message text="contactNumber" />
					</form:label></td>

				<td><form:input path="contactNumber" required="true" /></td>
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
</html>