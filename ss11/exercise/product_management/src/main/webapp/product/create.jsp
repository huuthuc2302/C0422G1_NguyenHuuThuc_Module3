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
    <title>Create new product</title>
</head>
<body>
<h1>Trang thêm mới sản phẩm</h1>
<p> <a href="/products">Back to products list</a></p>
<c:if test="${message!=null}">
    <p>${message}</p>
</c:if>

<form action="/products?action=create" method="post">
    <table>
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
                <button type="submit">Lưu</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
