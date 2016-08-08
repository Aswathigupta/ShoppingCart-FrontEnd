<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href=C:\Users\hp\workspace\TestProject\src\main\webapp\WEB-INF\resources\css\log.css
	rel=stylesheet>

<title>Shopping cart</title>
</head>
<body>
	<h2 align="center">Welcome to shopping Cart</h2>
	<div class="container">
		<div class="flat-form">

			<ul class="tabs">

				<li><a href>SHOPPING CART</a></li>
				<c:choose>
					<c:when test="${empty loggedInUser}">


						<li><a href="home">LOGIN</a></li>
						<li><a href="register">REGISTER</a></li>
					</c:when>
					<c:when test="${not empty loggedInUser}">

						<li><a href="logout">LOGOUT</a></li>
					</c:when>
				</c:choose>
			</ul>


			<div id="loginHere">
				<c:if test="${ishome==true}">
					<%@ include file="home.jsp"%>

				</c:if>
			</div>

			<div id="registerHere">
				<c:if test="${isregister==true}">
					<%@ include file="register.jsp"%>

				</c:if>
			</div>



		</div>
	</div>

	<div id="loginHere">
		<c:if test="${islogin==true || invalidCredentials==true}">
			<div id="error">${errorMessage}</div>
			<%@ include file="home.jsp"%>

		</c:if>
	</div>

	<div id="welcome">
		<c:if test="${not empty loggedInUser}">
			<td>Welcome ${loggedInUser},</td>
		</c:if>
	</div>

	<div id="logout">
		<c:if test="${ empty loggedInUser}">
			<td>Successfully logged out,</td>
		</c:if>
	</div>

	<div id="admin">

		<c:if test="${isAdmin==true}">

			<%@ include file="adminHome.jsp"%>

		</c:if>

		<div id="categories">
			<c:if test="${isAdminClickedCategories==true}">
				<%@ include file="adminHome.jsp"%>
				<%@ include file="category.jsp"%>
			</c:if>
		</div>

		<div id="products">
			<c:if test="${isAdminClickedProducts==true}">
				<%@ include file="adminHome.jsp"%>
				<%@ include file="product.jsp"%>
			</c:if>
		</div>

		<div id="suppliers">
			<c:if test="${isAdminClickedSuppliers==true}">
				<%@ include file="adminHome.jsp"%>
				<%@ include file="Supplier.jsp"%>
			</c:if>
		</div>
		
</body>
</html>