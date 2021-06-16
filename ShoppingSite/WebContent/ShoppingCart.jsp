
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<title>NSB - Shopping Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
 
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<p><font face="Verdana, Arial, Helvetica, sans-serif"><strong>Shopping Cart</strong></font></p>
<p><a href="website1.html">OrderPage</a> </p>
<table width="75%" border="1">
  <tr bgcolor="#CCCCCC">
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Model
      Description</font></strong></td>
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Quantity</font></strong></td>
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Unit
      Price</font></strong></td>
    <td><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Total</font></strong></td>
  </tr>
  <jsp:useBean id="cart" scope="session" class="in.techfreaks.shoppingcart.beans.CartBean" />
  <c:if test="${cart.lineItemCount==0}">
  <tr>
  <td colspan="4"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">- Cart is currently empty -</font><br/>
  </tr>
  </c:if>
  <c:forEach var="cartItem" items="${cart.cartItems}" varStatus="counter">
  <form name="item" method="POST" action="servlet/CartController">
  <tr>
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><c:out value="${cartItem.partNumber}"/></b><br/>
      <c:out value="${cartItem.modelDescription}"/></font></td>
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><input type='hidden' name='itemIndex' value='<c:out value="${counter.count}"/>'><input type='text' name="quantity" value='<c:out value="${cartItem.quantity}"/>' size='2'> <input type="submit" name="action" value="Update">
 <br/>         <input type="submit" name="action" value="Delete"></font></td>
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><i class="fa fa-inr"></i><c:out value="${cartItem.unitCost}"/></font></td>
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><i class="fa fa-inr"></i><c:out value="${cartItem.totalCost}"/></font></td>
  </tr>
  </form>
  </c:forEach>
  <tr>
    <td colspan="2"> </td>
    <td> </td>
    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Subtotal: <i class="fa fa-inr"></i><c:out value="${cart.orderTotal}"/></font></td>
  </tr>
</table>
</body>
</html>