<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>CHỈNH SỬA NHÂN VIÊN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%@include file="/include/header.jsp"%>

    <div class="container w-50 mt-5 p-2 bg-success" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">CHỈNH SỬA NHÂN VIÊN</h3>
        <form class="row g-3 text-center" action="" method="post">

            <div class="col-md-12">
                <label for="idCustomer" class="form-label">ID Nhân viên</label>
                <input type="text" class="form-control" id="idCustomer" name="idCustomer">
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
                <label for="id_card" class="form-label">Số CMND</label>
                <input type="text" class="form-control" id="id_card"  name="id_card" >
            </div>
            <div class="col-md-12">
                <label for="salary" class="form-label">Lương</label>
                <input type="text" class="form-control" id="salary"  name="salary" >
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
            <div class="col-md-12">
                <label for="customer_type_id" class="form-label">Vị trí</label>
                <select name=""  class="form-select" id="customer_type_id">
                    <option value="None">Chọn vị trí</option>
                    <option value="vt1">Lễ tân</option>
                    <option value="vt2">Phục vụ</option>
                    <option value="vt3">Chuyên viên</option>
                    <option value="vt4">Giám sát</option>
                    <option value="vt5">Quản lý</option>
                    <option value="vt6">Giám đốc</option>
                </select>
            </div>
            <div class="col-md-12">
                <label for="customer_type_id" class="form-label">Trình độ</label>
                <select name=""  class="form-select" id="custoe_id">
                    <option value="None">Chọn trình độ</option>
                    <option value="td1">Trung cấp</option>
                    <option value="td2">Cao đẳng</option>
                    <option value="td3">Đại học</option>
                    <option value="td4">sau Đại học</option>
                </select>
            </div>
            <div class="col-md-12">
                <label for="customer_type_id" class="form-label">Bộ phận</label>
                <select name=""  class="form-select" id="customer__id">
                    <option value="None">Chọn bộ phận</option>
                    <option value="bp1">Sale – Marketing</option>
                    <option value="bp2">Hành Chính</option>
                    <option value="bp3">Phục vụ</option>
                    <option value="bp4">Quản lý</option>
                </select>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>

        </form>
    </div>

<%@include file="/include/footer.jsp"%>

</body>
</html>
