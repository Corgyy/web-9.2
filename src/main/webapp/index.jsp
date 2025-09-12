<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,com.mycompany.CD" %>
<%
    // Danh sách CD mẫu
    List<CD> cds = new ArrayList<CD>();
    cds.add(new CD("cd1","86 (the band) - True Life Songs and Pictures",14.95));
    cds.add(new CD("cd2","Paddlefoot - The first CD",12.95));
    cds.add(new CD("cd3","Paddlefoot - The second CD",14.95));
    cds.add(new CD("cd4","Joe Rut - Genuine Wood Grained Finish",14.95));
%>
<html>
<head>
    <title>CD list</title>
</head>
<body>
<h2>CD list</h2>

<table border="1" cellpadding="6">
    <tr><th>Description</th><th>Price</th><th></th></tr>
    <%
        for (CD cd : cds) {
    %>
    <tr>
        <td><%= cd.getDescription() %></td>
        <td>$<%= String.format("%.2f", cd.getPrice()) %></td>
        <td>
            <form action="<%= request.getContextPath() %>/cart" method="post" style="display:inline">
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="code"  value="<%= cd.getCode() %>"/>
                <input type="hidden" name="desc"  value="<%= cd.getDescription() %>"/>
                <input type="hidden" name="price" value="<%= cd.getPrice() %>"/>
                <input type="submit" value="Add To Cart"/>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

<p><a href="<%= request.getContextPath() %>/cart">Go to cart</a></p>
</body>
</html>
