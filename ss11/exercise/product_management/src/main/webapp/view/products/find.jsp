<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Product</title>
</head>
<body>
<h1>Tìm Sản Phẩm</h1>
<p>
    <c:if test='${message != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>

<form action="/products?action=find" method="post">
    <input type="text" name="name" placeholder="Nhập tên sản phẩm">
    <button type="submit">Submit</button>
    <button type="button" onclick="location.href='/product';">Home</button>
</form>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá Sản Phẩm</th>
        <th>Mô Tả Sản Phẩm</th>
        <th>Nhà Sản Xuất</th>
    </tr>
    <c:forEach var="product" items="${productsList}" varStatus="status">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
