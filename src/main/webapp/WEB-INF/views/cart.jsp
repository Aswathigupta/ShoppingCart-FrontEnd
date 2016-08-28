<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="<c:url value="resources/css/admin.css" />">

<html>
<head>
<title>Cart Page</title>

</head>
<body>

	<h3>Cart List</h3>
	<table>
		<tr>
			<th align="left" width="80">Cart ID</th>
			<th align="left" width="120">Product Name</th>
			<th align="left" width="100">Quantity</th>
			<th align="left" width="80">Price</th>
			<th align="left" width="60">Delete</th>
			

		</tr>
		<c:forEach items="${cartList}" var="cart">
			<tr>
				
				
				<td align="left">${cart.id}</td>
				<td align="left">${cart.product.name}</td>
				<td align="left">${cart.quantity}</td>
				<td align="left">${cart.price}</td>
				<td align="left"><a href="<c:url value='/myCart/remove/${cart.id}'  />">Delete</a></td>
				
			</tr>
		</c:forEach>

	</table></br>
	
	
	<h4>Total cost : ${totalAmount}</h4>
					<%-- <a href="<c:url value='/pay/${cart.userID}'/>">Proceed</a>  --%>
					<a href="<c:url value='/pay/${cart.id}'/>">Checkout</a></br>
				
	
	<h5><B>Mode of Payment</B></h5>
	<form action="">
 	 <input type="radio" name="payment" value="cash"> cash on Delivery<br>
  	<input type="radio" name="payment" value="net"> Net Banking<br>
 	 
</form>
</body>
</html>