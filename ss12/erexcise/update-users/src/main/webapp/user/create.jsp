<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/1/2022
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        h3{
            color: red;
        }
        a{
            text-decoration: none
        }
    </style>
</head>
<body>
<center>
    <h1>QUẢN LÝ NGƯỜI DÙNG</h1>
    <h2>
        <a href="users?action=users">Danh sách tất cả người dùng</a>
    </h2>
    <h3>
        <c:if test="${message!=null}">
            <p>${message}</p>
        </c:if>
    </h3>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Thêm người dùng mới</h2>
            </caption>
            <tr>
                <th>Tên:</th>
                <td>
                    <input required type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input required type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th> Quốc Gia:</th>
                <td>
                    <input required type="text" name="country" id="country" size="15"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Lưu"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
