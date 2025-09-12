<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.Cart,com.mycompany.CartItem" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout Page</title>
</head>
<body>
    <h2>Checkout</h2>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p>Your cart is empty. <a href="<%= request.getContextPath() %>/index.jsp">Continue shopping</a></p>
<%
    } else {
%>
    <h3>Your Cart:</h3>
    <ul>
<%
        for (CartItem it : cart.getItems()) {
%>
        <li>
            <%= it.getCd().getDescription() %> - Qty: <%= it.getQuantity() %> - $
            <%= String.format("%.2f", it.getTotal()) %>
        </li>
<%
        }
%>
    </ul>

    <p>
        <strong>Total: $
            <%= String.format("%.2f", cart.getItems().stream()
                    .mapToDouble(CartItem::getTotal).sum()) %>
        </strong>
    </p>
<%
    }
%>

</body>
</html>
