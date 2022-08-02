<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/1/2022
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>QUẢN LÝ NGƯỜI DÙNG</h1>
    <h2>
        <a href="/users?action=create">Thêm người dùng mới</a>
    </h2>
    <h2>
        <a href="/users?action=sort">Sắp xếp</a>
    </h2>
    <form action="/users?action=find" method="post">
        <input type="text" name="country" placeholder="Quốc gia cần tìm">
        <button name="action" type="submit">Tìm</button>
    </form>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>Danh sách người dùng</h2></caption>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Quốc Gia</th>
            <th>Chức năng</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Sửa</a>
                    <a href="/users?action=delete&id=${user.id}">Xoá</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
