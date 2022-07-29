<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/28/2022
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Converter</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
  <label>Rate: </label><br/>
  <input type="text" name="rate" placeholder="RATE" value=""/><br/>
  <label>USD: </label><br/>
  <input type="text" name="usd" placeholder="USD" value=""/><br/>
  <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>