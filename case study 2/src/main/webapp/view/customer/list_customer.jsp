
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DANH SÁCH KHÁCH HÀNG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%@include file="/include/header.jsp"%>
    <center>
        <h1>DANH SÁCH KHÁCH HÀNG</h1>
        <h3>
            <a class="btn btn-outline-primary" href="/customers?action=create&id=${customer.customerId}">Thêm mới khách hàng</a>
        </h3>
    </center>
    <div class="container ">
        <div class="row">
            <table class="table table-striped">
                <tr>
                    <th>ID khách </th>
                    <th>Loại khách</th>
                    <th>Họ tên</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>Số CMND</th>
                    <th>Số Điện Thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th colspan="2">Chức năng</th>
                </tr>
                <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td>${customer.customerId}</td>
                    <td>${customer.customerTypeId}</td>
                    <td>${customer.customerName}</td>
                    <td>${customer.customerBirth}</td>
                    <td>${customer.customerGender}</td>
                    <td>${customer.customerIdCard}</td>
                    <td>${customer.customerPhone}</td>
                    <td>${customer.customerEmail}</td>
                    <td>${customer.customerAddress}</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="/customers?action=update&id=${customer.customerId}">
                            Sửa
                        </a></td>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="showInfoDelete('${customer.customerId}','${customer.customerName}')">
                            Xóa
                        </button>
                    </td>
                </tr>
                </c:forEach>
            </table>

            <form action="/customers?action=delete" method="post">
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input hidden type="text" name="customerId" id="deleteId">
                                <span>Bạn có muốn xóa : </span><span id="deleteName"></span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ĐÓNG</button>
                                <button type="submit" class="btn btn-primary">XOÁ</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <script>
                function showInfoDelete(id,name) {
                    document.getElementById("deleteId").value= id;
                    document.getElementById("deleteName").innerText=name;
                }
            </script>
        </div>
    </div>

<%@include file="/include/footer.jsp"%>

</body>
</html>
