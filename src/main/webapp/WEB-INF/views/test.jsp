<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>shopping cart</title>
<link href="resources/css/menu.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/memenu.css" rel="stylesheet" type="text/css"
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
<style>
	body{
	background-image:url(resources/img/back.jpg);
	background-size:cover;
	background-repeat:no repeat;
	}
</style>
<!-- /start menu -->
</head>
<body>
	<!--header-->
	<div class="top_bg">
		<div class="container">
			<div class="header_top-sec">
				<div class="top_right">
					<ul>
						<li><a href="#"></a>About</li>|

						<c:choose>
							<c:when test="${empty loggedInUser}">


								<li><a href="home">LOGIN</a></li>|
						<li><a href="member.obj">REGISTER</a></li>
							</c:when>
							<c:when test="${not empty loggedInUser}">

								<li><a href="logout">LOGOUT</a></li>

							</c:when>
						</c:choose>
					</ul>
					<!-- 
						<c:if test="${not empty cartSize}">
							<li><a href="myCart"> My Cart</a>( ${cartSize} )</li>
						</c:if>
						 -->

				</div>
				<div class="top_left">
					<ul>
						<li class="top_link"><span
							class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span><a
							href="myCart">My cart</a>( ${cartSize} )</li>|
						<li class="top_link"><a href="#">Help</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="header-top">
		<div class="header-bottom">
			<div class="container">
				<div class="logo">
					<a href="#"><h1>Wedding Store</h1></a>
				</div>
				<!---->

				<div class="top-nav">
					<ul class="memenu skyblue">
						<li class="active"><a href="#">Home</a></li>
						<li class="grid"><a href="#">Wedding</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>Style Zone</h4>
										<ul>
											<li><a href="#">Women</a></li>
											<li><a href="#">Jewellery</a></li>
											<li><a href="#">Featured</a></li>
											<li><a href="#">Accessories</a></li>
											<li><a href="#">Looks and Trends</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Others</h4>
										<ul>
											<li><a href="#">New Arrivals</a></li>
											<li><a href="#">Shoes</a></li>
											<li><a href="#">Flowers</a></li>
											<li><a href="#">Style Videos</a></li>
											<li><a href="#">Cakes</a></li>
											<li><a href="#">My Shopping Bag</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Popular Brands</h4>
										<ul>
											<li><a href="#">Persol</a></li>
											<li><a href="#">Nike</a></li>
											<li><a href="#">Edwin</a></li>
											<li><a href="#">Ray-Ban</a></li>
											<li><a href="#">Efilla</a></li>

										</ul>
									</div>
								</div>
							</div></li>
						<li class="grid"><a href="#">Bride Style</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1 me-one">
										<h4>Style Zone</h4>
										<ul>
											<li><a href="#">Women</a></li>
											<li><a href="#">Jewellery</a></li>
											<li><a href="#">Featured</a></li>
											<li><a href="#">Accessories</a></li>
											<li><a href="#">Looks and Trends</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Others</h4>
										<ul>
											<li><a href="#">New Arrivals</a></li>
											<li><a href="#">Shoes</a></li>
											<li><a href="#">Flowers</a></li>
											<li><a href="#">Style Videos</a></li>
											<li><a href="#">Cakes</a></li>
											<li><a href="#">My Shopping Bag</a></li>
										</ul>
									</div>
									<div class="col1 me-one">
										<h4>Popular Brands</h4>
										<ul>
											
											<li><a href="#">Persol</a></li>
											<li><a href="#">Nike</a></li>
											<li><a href="#">Edwin</a></li>
											<li><a href="#">Ray-Ban</a></li>
											<li><a href="#">Efilla</a></li>
										</ul>
									</div>
								</div>
							</div></li>

					</ul>
					<div class="clearfix"></div>
				</div>
				<!---->

				<!---->

				<div id="welcome">
					<c:if test="${not empty loggedInUser}">
						<td><b>Welcome ${loggedInUser},</b></td>
					</c:if>

					<div class="banner">
						<img src="resources/img/ban2.jpg" alt="" />
						<div class="container"></div>
					</div>
					<!---->
					
					<div data-role="main" class="ui-content">

			<hr color="red" size="5">

			<ul id="menu">
				<c:if test="${not empty categoryList}">
					<c:forEach items="${categoryList}" var="category">
						<li><a href=${category.name}>${category.name}</a>
							<ul>
								<c:forEach items="${category.products}" var="product">

									<li><a href="<c:url value='product/get/${product.id}' />">${product.name}</a></li>

								</c:forEach>

							</ul></li>
					</c:forEach>
				</c:if>

			</ul>
			<hr color="red" size="5">
			<br> <br> <br>
			 <div>
				<c:if test="${!empty selectedProduct.name}">
				
					<c:url var="addAction" value="myCart/add"></c:url>

					<form:form action="${addAction}" commandName="cart">
	
					<table align="center">
					 <!--   <tr>
							<th align="left" width="80">Product ID</th>
							<th align="left" width="120">Product Name</th>
							<th align="left" width="200">Product Description</th>
							<th align="left" width="80">Price</th>
							<th align="left" width="200">Product Category</th>
							<th align="left" width="200">Product Supplier</th>
							<th align="left" width="200">Cart list</th>

						</tr>-->
						<tr>
							<img src="<c:url value = 'C:\Users\hp\workspace\MFU\img\s${selectedProduct.id}.jpg' />" alt="" />
							<tr><th> Product ID : ${selectedProduct.id}</tr></th></br>
							<tr><th>Product Name : ${selectedProduct.name}</tr></th></br>							
							<tr><th> Product Description :${selectedProduct.description}</td>
							<tr><th> Price : ${selectedProduct.price}</tr></th></br>	
							<tr><th> Product Category : ${selectedProduct.category.name}</tr></th></br>	
							<tr><th> Product Supplier : ${selectedProduct.supplier.name}</tr></th></br>	
							 <tr><th><a href="<c:url value='myCart/add/${selectedProduct.id}' />">Add to Cart</a></tr></th>
							<!-- <tr><th><input class="btn btn-warning" type="submit" value="Add to Cart"></a></tr></th> -->
						</tr>
					</table>
					</form:form>
				</c:if>
			</div>
					
			<!---->		

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

			<!--  <div id="welcome">
			<c:if test="${not empty loggedInUser}">
				<td>Welcome ${loggedInUser},</td>
			</c:if>-->
		</div>

		<div id="logout">
			<c:if test="${loggedOut==true}">
				<td>Successfully logged out ${loggedInUser},</td>
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

			<div id="suppliers">
				<c:if test="${isAdminClickedSuppliers==true}">
					<%@ include file="adminHome.jsp"%>
					<%@ include file="supplier.jsp"%>
				</c:if>
			</div>

			<div id="products">
				<c:if test="${isAdminClickedProducts==true}">
					<%@ include file="adminHome.jsp"%>
					<%@ include file="product.jsp"%>
				</c:if>
			</div>


			<div id="displayCart">
				<c:if test="${isdisplayCart==true}">
					<%@ include file="cart.jsp"%>
				</c:if>
			</div>

			<div class="arrivals">
				<div class="container">
					<h3>New Arrivals</h3>
					<div class="arrival-grids">
						<ul id="flexiselDemo1">
							<li><a href="product.html"><img
									src="resources/img/a1.jpg" alt="" />
									<div class="arrival-info">
										<h4>Fusion Black Polyester Suits</h4>
										<p>Rs 12000</p>
										<span class="pric1"><del>Rs 18000</del></span> <span
											class="disc">[12% Off]</span>
									</div>
									<div class="viw">
										<a href="#"><span class="glyphicon glyphicon-eye-open"
											aria-hidden="true"></span>Quick View</a>
									</div>
									<div class="shrt">
										<a href="#"><span class="glyphicon glyphicon-star"
											aria-hidden="true"></span>Shortlist</a>
									</div></a></li>
							<li><a href="product.html"><img
									src="resources/img/a2.jpg" alt="" />
									<div class="arrival-info">
										<h4>Vogue4All White Net Gowns</h4>
										<p>Rs 14000</p>
										<span class="pric1"><del>Rs 15000</del></span> <span
											class="disc">[10% Off]</span>
									</div>
									<div class="viw">
										<a href="#"><span class="glyphicon glyphicon-eye-open"
											aria-hidden="true"></span>Quick View</a>
									</div>
									<div class="shrt">
										<a href="#"><span class="glyphicon glyphicon-star"
											aria-hidden="true"></span>Shortlist</a>
									</div></a></li>
							<li><a href="product.html"><img
									src="resources/img/a3.jpg" alt="" />
									<div class="arrival-info">
										<h4>Platinum Waist Coat Set Navy</h4>
										<p>Rs 4000</p>
										<span class="pric1"><del>Rs 8500</del></span> <span
											class="disc">[45% Off]</span>
									</div>
									<div class="viw">
										<a href="#"><span class="glyphicon glyphicon-eye-open"
											aria-hidden="true"></span>Quick View</a>
									</div>
									<div class="shrt">
										<a href="#"><span class="glyphicon glyphicon-star"
											aria-hidden="true"></span>Shortlist</a>
									</div></a></li>
							<li><a href="product.html"> <img
									src="resources/img/a4.jpg" alt="" />
									<div class="arrival-info">
										<h4>La Fanatise White Net Gowns</h4>
										<p>Rs 18000</p>
										<span class="pric1"><del>Rs 21000</del></span> <span
											class="disc">[8% Off]</span>
									</div>
									<div class="viw">
										<a href="#"><span class="glyphicon glyphicon-eye-open"
											aria-hidden="true"></span>Quick View</a>
									</div>
									<div class="shrt">
										<a href="#"><span class="glyphicon glyphicon-star"
											aria-hidden="true"></span>Shortlist</a>
									</div></a></li>
						</ul>
						<script type="text/javascript">
							$(window).load(function() {
								$("#flexiselDemo1").flexisel({
									visibleItems : 4,
									animationSpeed : 1000,
									autoPlay : true,
									autoPlaySpeed : 3000,
									pauseOnHover : true,
									enableResponsiveBreakpoints : true,
									responsiveBreakpoints : {
										portrait : {
											changePoint : 480,
											visibleItems : 1
										},
										landscape : {
											changePoint : 640,
											visibleItems : 2
										},
										tablet : {
											changePoint : 768,
											visibleItems : 3
										}
									}
								});
							});
						</script>
						<script type="text/javascript"
							src="resources/js/jquery.flexisel.js"></script>
					</div>
				</div>
			</div>
			<!-- -->

			<!--  -->
			<!--  -->
			<div class="copywrite">
				<div class="container">
					<p>Copyright © 2016 Wedding Store. All Rights Reserved</p>
				</div>
			</div>
</body>
</html>
