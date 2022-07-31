<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Xóa Sản Phẩm</h1>
<p>
    <a href="/products">Back to products list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
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
            <td>Mô Tả Của Sản Phẩm</td>
            <td>${product.description}</td>
        </tr>
        <tr>
            <td>Nhà Sản Xuất</td>
            <td>${product.manufacturer}</td>
        </tr>
        <tr>
            <td>
                <button type="submit">Delete</button>
            </td>
            <td><a href="/products">Back to customer list</a></td>
        </tr>
    </table>
</form>
</body>
</html>
