<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Chi Tiết Sản Phẩm</h1>
<table border="1">
    <tr>
        <td>ID</td>
        <td>${product.id}</td>
    </tr>
    <tr>
        <td>Tên Sản Phẩm</td>
        <td>${product.name}</td>
    </tr>
    <tr>
        <td>Giá Sản Phẩm</td>
        <td>${product.price}</td>
    </tr>
    <tr>
        <td>Mô Tả Sản Phẩm</td>
        <td>${product.description}</td>
    </tr>
    <tr>
        <td>Nhà Sản Xuất</td>
        <td>${product.manufacturer}</td>
    </tr>
    <tr>
        <td><a href="/products">Back to Product list</a></td>
    </tr>
</table>
</body>
</html>
