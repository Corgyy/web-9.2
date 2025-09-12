<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.mycompany.Cart,com.mycompany.CartItem" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new com.mycompany.Cart();
        session.setAttribute("cart", cart);
    }
%>
<html>
<head>
    <title>Your cart</title>
</head>
<body>
<h2>Your cart</h2>

<% if (cart.isEmpty()) { %>
    <p>Cart is empty.</p>
    <p><a href="<%= request.getContextPath() %>/index.jsp">Continue Shopping</a></p>
<% } else { %>
<table border="1" cellpadding="6">
    <tr><th>Quantity</th><th>Description</th><th>Price</th><th>Amount</th><th></th></tr>
    <%
        for (CartItem it : cart.getItems()) {
    %>
    <tr>
        <td>
            <form action="<%= request.getContextPath() %>/cart" method="post" style="display:inline">
                <input type="number" name="quantity" value="<%= it.getQuantity() %>" min="0"/>
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="code" value="<%= it.getCd().getCode() %>"/>
                <input type="submit" value="Update"/>
            </form>
        </td>
        <td><%= it.getCd().getDescription() %></td>
        <td>$<%= String.format("%.2f", it.getCd().getPrice()) %></td>
        <td>$<%= String.format("%.2f", it.getTotal()) %></td>
        <td>
            <form action="<%= request.getContextPath() %>/cart" method="post" style="display:inline">
                <input type="hidden" name="action" value="remove"/>
                <input type="hidden" name="code" value="<%= it.getCd().getCode() %>"/>
                <input type="submit" value="Remove Item"/>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

<p>
    <a href="<%= request.getContextPath() %>/index.jsp">Continue Shopping</a>

    <!-- Nút Checkout dẫn tới checkout.jsp -->
    <form action="<%= request.getContextPath() %>/checkout.jsp" method="get" style="display:inline">
        <button type="submit">Checkout</button>
    </form>
</p>
<% } %>

</body>
</html>
