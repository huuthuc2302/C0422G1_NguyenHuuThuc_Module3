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
                <h2>
                    Sửa thông tin
                </h2>
            </caption>
            <c:if test="${user != null}">
                <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
            </c:if>
            <tr>
                <th>Tên:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${user.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${user.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Quốc Gia:</th>
                <td>
                    <input type="text" name="country" size="15"
                           value="<c:out value='${user.country}' />"
                    />
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
