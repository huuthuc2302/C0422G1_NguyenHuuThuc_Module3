<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="" width="60" height="80">
        </a>
        <span>Nguyễn Hữu Thức</span>
    </div>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-success sticky-top">
    <div class="container-fluid ">
        <a class="navbar-brand font-weight-bold text-white" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                <li class="nav-item">
                    <a class="nav-link  font-weight-bold text-white" href="view/employee/list_employee.jsp">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold text-white " href="/customers?action=default">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold text-white" href="/facility?action=deauft">Facility</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font-weight-bold text-white" href="view/contract/list_contract.jsp">Contract</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light border-3" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
</body>
</html>
