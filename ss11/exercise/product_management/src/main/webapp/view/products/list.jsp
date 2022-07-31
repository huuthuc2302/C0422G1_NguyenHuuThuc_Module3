<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products List</title>
</head>
<body>
<a href="/products?action=create">Thêm mới sản phẩm</a>
<div class="Title">
    <form action="/products?action=find" method="post">
        <input type="text" placeholder="Nhập tên sản phẩm" name="name">
        <button>Tìm</button>
    </form>
    <h1>Danh Sách Sản Phẩm</h1>
</div>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên Sản Phẩm</th>
        <th>Giá Sản Phẩm</th>
        <th>Mô Tả Của Sản phẩm</th>
        <th>Nhà Sản Xuất</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>View</th>
    </tr>
    <c:forEach var="product" items="${productsList}" varStatus="status">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td><a href="/products?action=update&id=${product.id}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.id}">delete</a></td>
            <td><a href="/products?action=view&id=${product.id}">view</a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>