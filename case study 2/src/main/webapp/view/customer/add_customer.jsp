<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>THÊM MỚI KHÁCH HÀNG</title>
</head>
<body>

<%@include file="/include/header.jsp"%>

    <div class="container w-50 mt-5 p-2 bg-success" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">THÊM MỚI KHÁCH HÀNG</h3>
        <form class="row g-3 text-center" action="" method="post">

            <div class="col-md-12">
                <label for="idCustomer" class="form-label">ID Khách hàng</label>
                <input type="text" class="form-control" id="idCustomer" name="idCustomer">
            </div>
            <div class="col-md-12">
                <label for="customer_type_id" class="form-label">Loại khách</label>
                <select name=""  class="form-select" id="customer_type_id">
                    <option value="None">Chọn loại khách</option>
                    <option value="Diamond">Diamond</option>
                    <option value="Platinium">Platinium</option>
                    <option value="Gold">Gold</option>
                    <option value="Silver">Silver</option>
                    <option value="Member">Member</option>
                </select>
            </div>
            <div class="col-md-12">
                <label for="name" class="form-label">Họ tên</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="col-md-12">
                <label for="birthday" class="form-label">Ngày sinh</label>
                <input type="date" name="birthday" class="form-control" value=""
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
                <input type="text" class="form-control" id="id_card"  name="id_card" >
            </div>
            <div class="col-md-12">
                <label for="phone" class="form-label">Số Điện Thoại</label>
                <input type="text" class="form-control" id="phone" name="phone">
            </div>
            <div class="col-md-12">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" name="email">
            </div>
            <div class="col-md-12">
                <label for="address" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="address">
            </div>


            <div class="col-12">
                <button type="submit" class="btn btn-primary">Lưu</button>
            </div>

        </form>
    </div>

<%@include file="/include/footer.jsp"%>

</body>
</html>
