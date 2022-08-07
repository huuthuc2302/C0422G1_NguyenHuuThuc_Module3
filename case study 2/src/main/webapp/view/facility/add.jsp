



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>THÊM MỚI DỊCH VỤ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%@include file="/include/header.jsp"%>

<div class="container w-50 mt-5 p-2 bg-success" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">THÊM MỚI DỊCH VỤ</h3>
        <form class="row g-3 text-center" action="/facility?action=create" method="post">
            <div class="col-md-12">
                <label class="form-label">Loại dịch vụ</label>
                <select name=""  class="form-select" onchange="showServiceInput(this)">
                    <option value="None" >Chọn loại dịch vụ</option>
                    <option value="Villa" >Villa</option>
                    <option value="House" >House</option>
                    <option value="Room" >Room</option>
                </select>
            </div>

                        <%--Dịch vụ mặc định--%>
            <div class="col-md-12">
                <label for="name" class="form-label">Tên dịch vụ</label>
                <input type="text" class="form-control" id="name" name="name" value="${facility.serviceName}">
            </div>
            <div class="col-md-12">
                <label for="area" class="form-label">Diện tích sử dụng</label>
                <input type="text" class="form-control" id="area" name="area" value="${facility.serviceArea}">
            </div>
            <div class="col-md-12">
                <label for="cost" class="form-label">Chi phí thuê</label>
                <input type="text" class="form-control" id="cost"  name="cost" value="${facility.serviceCost}">
            </div>
            <div class="col-md-12">
                <label for="inputAddress2" class="form-label">Số lượng người tối đa </label>
                <input type="text" class="form-control" id="inputAddress2"  name="max_people" value="${facility.serviceMaxPeople}">
            </div>
            <div class="col-md-12">
                <label for="inputCity" class="form-label">Chọn kiểu thuê</label>

                <select class="form-control" name="rentTypeId" id="inputCity">
                    <c:forEach items="${rentTypeList}" var="rType">
                        <option value="${rType.rentTypeId}">${rType.rentTypeName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-12">
                <label for="inputCity" class="form-label">Chọn loại dịch vụ</label>

                <select class="form-control" name="facilityTypeId" id="exampleFormControlSelect2">
                    <c:forEach items="${facilityTypeId}" var="sType">
                        <option value="${sType.facilityTypeId}">${sType.facilityTypeName}</option>
                    </c:forEach>
                </select>
            </div>

                        <%--Villa và House sẽ có chung--%>
            <div class="col-md-12" id="dv1" style="display: none">
                <label for="standard_room" class="form-label">Tiêu chuẩn phòng</label>
                <input type="text" class="form-control" id="standard_room" name="standard_room" value="${facility.standardRoom}">
            </div>
            <div class="col-md-12" id="dv2" style="display: none">
                <label for="description_other_convenience" class="form-label">Mô tả tiện nghi khác</label>
                <input type="text" class="form-control" id="description_other_convenience" name="description_other_convenience" value="${facility.description}">
            </div>
            <div class="col-md-12" id="dv3" style="display: none">
                <label for="number_of_floors" class="form-label">Số tầng</label>
                <input type="text" class="form-control" id="number_of_floors" name="number_of_floors" value="${facility.numberOfFloor}">
            </div>


                        <%--Riêng Villa sẽ có thêm--%>
            <div class="col-md-12" id="dv4" style="display: none">
                <label for="pool_area" class="form-label">Diện tích hồ bơi</label>
                <input type="text" class="form-control" id="pool_area" name="pool_area" value="${facility.poolArea}">
            </div>


                        <%--Riêng Room sẽ có thêm--%>
            <div class="col-md-12" id="dv5" style="display: none">
                <label for="facility_free" class="form-label">Dịch vụ miễn phí đi kèm</label>
                <input type="text" class="form-control" id="facility_free" name="facility_free">
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Lưu</button>
                <a href="/facility" class="btn btn-secondary w-50">Quay lại</a>
            </div>
        </form>
    </div>



    <script>
        function showServiceInput(value) {
            const v = value.value;
            switch (v) {
                case 'None':
                    document.getElementById("dv1").style.display="none";
                    document.getElementById("dv2").style.display="none";
                    document.getElementById("dv3").style.display="none";
                    document.getElementById("dv4").style.display="none";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "Villa":
                    document.getElementById("dv1").style.display="block";
                    document.getElementById("dv2").style.display="block";
                    document.getElementById("dv3").style.display="block";
                    document.getElementById("dv4").style.display="block";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "House":
                    document.getElementById("dv1").style.display="block";
                    document.getElementById("dv2").style.display="block";
                    document.getElementById("dv3").style.display="block";
                    document.getElementById("dv4").style.display="none";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "Room":
                    document.getElementById("dv1").style.display="none";
                    document.getElementById("dv2").style.display="none";
                    document.getElementById("dv3").style.display="none";
                    document.getElementById("dv4").style.display="none";
                    document.getElementById("dv5").style.display="block";
                    break;
            }
        }
    </script>

<%@include file="/include/footer.jsp"%>

</body>
</html>
