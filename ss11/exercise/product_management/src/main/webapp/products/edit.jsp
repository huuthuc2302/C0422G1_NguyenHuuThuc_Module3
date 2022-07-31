<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/29/2022
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Chỉnh Sửa Sản Phẩm</h1>
<p>
    <c:if test='${message != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to customer list</a>
</p>
<form method="post">
    <table border="1">
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" placeholder="Nhâp ID sản phẩm"></td>
        </tr>
        <tr>
            <td>Tên Sản Phẩm</td>
            <td><input type="text" name="name" placeholder="Nhâp tên sản phẩm"></td>
        </tr>
        <tr>
            <td>Giá Sản Phẩm</td>
            <td><input type="text" name="price" placeholder="Nhâp giá sản phẩm"></td>
        </tr>
        <tr>
            <td>Mô Tả Sản Phẩm</td>
            <td><input type="text" name="description" placeholder="Nhập mô tả sản phẩm"></td>
        </tr>
        <tr>
            <td>Nhà Sản Xuất</td>
            <td><input type="text" name="manufacturer" placeholder="Nhâp nhà sản xuất"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Update</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
