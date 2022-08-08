
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>THÊM MỚI KHÁCH HÀNG</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%@include file="/include/header.jsp"%>

    <div class="container w-50 mt-5 p-2 bg-success" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">THÊM MỚI KHÁCH HÀNG</h3>
        <form class="row g-3 text-center" action="/customers?action=create" method="post">

            <div class="col-md-12">
                <label for="customer_type_id" class="form-label">Loại khách</label>
                <select name="customerTypeId"  class="form-select" id="customer_type_id">
                    <c:forEach var="typeCustomer" items="${customerTypeList}">
                        <option value="${typeCustomer.customerTypeId}">${typeCustomer.customerTypeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-12">
                <label for="name" class="form-label">Họ tên</label>
                <input type="text" class="form-control" id="name" name="customerName">
            </div>
            <div class="col-md-12">
                <label for="birthday" class="form-label">Ngày sinh</label>
                <input type="date" name="customerBirth" class="form-control"
                       id="birthday" required>
            </div>
            <div class="col-md-12">
                <label for="gender" class="form-label">Giới tính</label>
                <div class="form-control" id="gender">
                    <input type="radio" name="customerGender" value="0" checked>Nam
                    <input type="radio" name="customerGender" value="1">Nữ
                </div>
            </div>
            <div class="col-md-12">
                <label for="id_card" class="form-label">Số CMND</label>
                <input type="text" class="form-control" id="id_card" name="customerIdCard">
            </div>
            <div class="col-md-12">
                <label for="phone" class="form-label">Số Điện Thoại</label>
                <input type="text" class="form-control" id="phone" name="customerPhone">
            </div>
            <div class="col-md-12">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" name="customerEmail">
            </div>
            <div class="col-md-12">
                <label for="address" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="customerAddress">
            </div>


            <div class="col-12">
                <button type="submit" name="action" value="create" class="btn btn-primary">Lưu</button>
            </div>

        </form>
    </div>

<%@include file="/include/footer.jsp"%>

</body>
</html>
