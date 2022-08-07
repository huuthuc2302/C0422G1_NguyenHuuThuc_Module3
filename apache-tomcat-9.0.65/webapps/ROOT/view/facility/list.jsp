<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2022
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>QUẢN LÝ DỊCH VỤ</title>
</head>
<body>

<%@include file="/include/header.jsp"%>

    <center>
        <h1>QUẢN LÝ DỊCH VỤ</h1>
        <h3>
            <a class="btn btn-outline-primary" href="/facility?action=create">Thêm mới dịch vụ</a>
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

                <th>Dịch vụ miễn phí đi kèm</th>

                <th colspan="2">Chức năng</th>
            </tr>
            <c:forEach items="${facilityList}" var="facility">
                <tr>
                    <td>${facility.serviceId}</td>
                    <td>${facility.serviceName}</td>
                    <td>${facility.serviceArea}</td>
                    <td>${facility.serviceCost}</td>
                    <td>${facility.serviceMaxPeople}</td>
                    <td>${mapRentType.get(facility.rentTypeId)}</td>
                    <td>${mapServiceType.get(facility.serviceTypeId)}</td>
                    <td>${facility.standardRoom}</td>
                    <td>${facility.description}</td>
                    <td>${facility.poolArea}</td>
                    <td>${facility.numberOfFloor}</td>

                    <td></td>

                    <td>
                        <a type="button" class="btn btn-primary"  href="/facility?action=update&facilityId=${facility.serviceId}">
                            Sửa
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" onclick="showInfo('${facility.serviceId}','${facility.serviceName}')"
                                data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Xoá
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">XOÁ DICH VỤ</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            XÁC NHẬN XOÁ DỊCH VỤ
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">Xoá</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function showInfo(id, name) {
            document.getElementById("facilityName").innerText = name;
            document.getElementById("facilityId").value = id;
        }
    </script>

<%@include file="/include/footer.jsp"%>

</body>
</html>
