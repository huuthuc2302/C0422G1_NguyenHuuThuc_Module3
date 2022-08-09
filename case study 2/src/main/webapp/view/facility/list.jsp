<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2022
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>QUẢN LÝ DỊCH VỤ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%@include file="/include/header.jsp"%>

    <center>
        <h1>QUẢN LÝ DỊCH VỤ</h1>
        <h3>
            <a class="btn btn-outline-primary" href="/facility?action=create&id=${facility.facilityId}">Thêm mới dịch vụ</a>
        </h3>
    </center>


    <div class="container ">
        <div class="row">
        <table class="table table-striped">
            <tr>
                <th>Mã dịch vụ</th>
                <th>Tên dịch vụ</th>
                <th>Diện tích sử dụng</th>
                <th>Chi phí thuê </th>
                <th>Số người tối đa</th>
                <th>Mã kiểu thuê</th>
                <th>Mã loại dịch vụ</th>
                <th>Tiêu chuẩn phòng</th>
                <th>Mô tả tiện nghi</th>
                <th>Diện tích hồ bơi</th>
                <th>Số tầng</th>
                <th>Dịch vụ Free đi kèm</th>

                <th colspan="2">Chức năng</th>
            </tr>
            <c:forEach items="${facilityList}" var="facility">
                <tr>
                    <td>${facility.facilityId}</td>
                    <td>${facility.facilityName}</td>
                    <td>${facility.facilityArea}</td>
                    <td>${facility.facilityCost}</td>
                    <td>${facility.facilityMaxPeople}</td>
                    <td>${facility.rentTypeId}</td>
                    <td>${facility.facilityTypeId}</td>
                    <td>${facility.standardRoom}</td>
                    <td>${facility.description}</td>
                    <td>${facility.poolArea}</td>
                    <td>${facility.numberOfFloor}</td>
                    <td>${facility.facilityFree}</td>

                    <td>
                        <a type="button" class="btn btn-primary"  href="/facility?action=update&facilityID=${facility.facilityId}">
                            Sửa
                        </a>
                    </td>
                    <td>
                        <button type="button" onclick="showInfoDelete('${facility.facilityId}','${facility.facilityName}')" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Xoá
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>

            <!-- Modal -->
            <form action="/facility?action=delete" method="post">
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input hidden type="text" name="facilityId" id="deleteId">
                                <span>Bạn có muốn xóa : </span><span id="deleteName"></span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit"  class="btn btn-primary">Xoá</button>
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
<%@include file="/include/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">

    </script>
</body>
</html>
