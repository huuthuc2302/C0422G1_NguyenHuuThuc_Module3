<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 7/27/2022
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product Discount Calculator</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Product Discount Calculator</h2>
<form method="post" action="/display-discount">
  <label>Discount Price: </label><br/>
  <input type="number" name="PRICE" placeholder="0" value=""/><br/>
  <label>Discount Percent: </label><br/>
  <input type="number" name="PERCENT" placeholder="0" value=""/><br/>
  <input type = "submit" id = "submit" value = "Converter"/>
</form>
</body>
</html>
