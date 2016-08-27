<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shopping Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register/Sign in</title>
<link href="../resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="../resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="../resources/css/memenu.css" rel="stylesheet" type="text/css"
	media="all" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="resources/js/bootstarp.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
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

	<div class="col-sm-1">
		<h2 class="or">Register</h2>
	</div>
	<div class="col-sm-4">
		<div class="signup-form">
			<!--sign up form-->
			
			<form:form modelAttribute="user">
							${user.id}
							
								<br />
							${user.name}
							
							<br />
							${user.password}	
							
							<br />
							${user.emailID}
								 
						    <br />
						    ${user.address}		
							
							<br />
							${user.contactNumber}
							
							<br />

				<button name="_eventId_edit" type="submit" class="btn btn-default">Edit</button>
				<br />
				<button name="_eventId_submit" type="submit" class="btn btn-default">Confirm
					Details</button>

			</form:form>
		</div>
		<!--/sign up form-->
	</div>
	<!--/form

</body>
</html>-->