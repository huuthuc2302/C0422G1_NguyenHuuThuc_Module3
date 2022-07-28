<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/28/2022
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

    <style>
        h1 {
            text-align: center;
        }
        table {
            border: blanchedalmond;
            width: 1000px;
            height: 400px;
            margin: 0 auto;
            background-color: aqua;
        }
        td {
            text-align: center;
        }
        img {
            height: 100px;
            width: 100px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<h1>Danh Sách Khách Hàng</h1>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
<c:forEach var="customer" items="${customerList}">
    <tr>
        <td>${customer.getName()}</td>
        <td>${customer.getBirthday()}</td>
        <td>${customer.getAddress()}</td>
        <td><img src="${customer.getPhoto()}" alt=""></td>
    </tr>
</c:forEach>
</table>
</body>
</html>