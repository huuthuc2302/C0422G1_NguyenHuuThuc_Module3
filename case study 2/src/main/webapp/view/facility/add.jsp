



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>THÊM MỚI DỊCH VỤ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%@include file="/include/header.jsp"%>

<div class="container w-50 mt-5 p-2 bg-success" id="create" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">THÊM MỚI DỊCH VỤ</h3>
        <form class="row g-3 text-center" action="/facility?action=create" method="post">
            <div class="col-md-12">
                <label class="form-label">Loại dịch vụ</label>
                <select id="type_facility" name="facilityTypeId" class="form-select" onchange="showFacilityInput()">
                    <option value="None" >Chọn loại dịch vụ</option>
                    <option value="1" >Villa</option>
                    <option value="2" >House</option>
                    <option value="3" >Room</option>
                </select>
            </div>

                        <%--Dịch vụ mặc định--%>
            <div class="col-md-12">
                <label for="facilityName" class="form-label">Tên dịch vụ</label>
                <input type="text" class="form-control" id="facilityName" name="facilityName">
            </div>
            <div class="col-md-12">
                <label for="facilityArea" class="form-label">Diện tích sử dụng</label>
                <input type="text" class="form-control" id="facilityArea" name="facilityArea">
            </div>
            <div class="col-md-12">
                <label for="facilityCost" class="form-label">Chi phí thuê</label>
                <input type="text" class="form-control" id="facilityCost"  name="facilityCost">
            </div>
            <div class="col-md-12">
                <label for="facilityMaxPeople" class="form-label">Số lượng người tối đa </label>
                <input type="text" class="form-control" id="facilityMaxPeople"  name="facilityMaxPeople">
            </div>
            <div class="col-md-12">
                <label for="rentTypeId" class="form-label">Chọn kiểu thuê</label>

                <select class="form-control" name="rentTypeId" id="rentTypeId">
                    <c:forEach items="${rentTypeList}" var="rType">
                        <option value="${rType.rentTypeId}">${rType.rentTypeName}</option>
                    </c:forEach>
                </select>
            </div>
<%--            <div class="col-md-12">--%>
<%--                <label for="facilityTypeId" class="form-label">Chọn loại dịch vụ</label>--%>

<%--                <select class="form-control" name="facilityTypeId" id="facilityTypeId">--%>
<%--                    <c:forEach items="${facilityTypeList}" var="sType">--%>
<%--                        <option value="${sType.facilityTypeId}">${sType.facilityTypeName}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </div>--%>

                        <%--Villa và House sẽ có chung--%>
            <div class="col-md-12" id="dv1" style="display: none">
                <label for="standardRoom" class="form-label">Tiêu chuẩn phòng</label>
                <input type="text" class="form-control" id="standardRoom" name="standardRoom">
            </div>
            <div class="col-md-12" id="dv2" style="display: none">
                <label for="description" class="form-label">Mô tả tiện nghi khác</label>
                <input type="text" class="form-control" id="description" name="description">
            </div>
            <div class="col-md-12" id="dv3" style="display: none">
                <label for="numberOfFloor" class="form-label">Số tầng</label>
                <input type="text" class="form-control" value="0" id="numberOfFloor" name="numberOfFloor">
            </div>

                        <%--Riêng Villa sẽ có thêm--%>
            <div class="col-md-12" id="dv4" style="display: none">
                <label for="poolArea" class="form-label">Diện tích hồ bơi</label>
                <input type="text" class="form-control"  value="0" id="poolArea" name="poolArea">
            </div>


                        <%--Riêng Room sẽ có thêm--%>
            <div class="col-md-12" id="dv5" style="display: none">
                <label for="facilityFree" class="form-label">Dịch vụ miễn phí đi kèm</label>
                <input type="text" class="form-control" id="facilityFree" name="facilityFree">
            </div>

            <div class="col-12">
                <button type="submit" name="action" value="create" class="btn btn-primary">Lưu</button>
                <a href="/facility" class="btn btn-secondary w-50">Quay lại</a>
            </div>
        </form>
    </div>



    <script>
        function showFacilityInput() {
            let type = document.getElementById("type_facility").value;
            switch (type) {
                case 'None':
                    document.getElementById("dv1").style.display="none";
                    document.getElementById("dv2").style.display="none";
                    document.getElementById("dv3").style.display="none";
                    document.getElementById("dv4").style.display="none";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "1":
                    // "Villa"
                    document.getElementById("dv1").style.display="block";
                    document.getElementById("dv2").style.display="block";
                    document.getElementById("dv3").style.display="block";
                    document.getElementById("dv4").style.display="block";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "2":
                // "House":
                    document.getElementById("dv1").style.display="block";
                    document.getElementById("dv2").style.display="block";
                    document.getElementById("dv3").style.display="block";
                    document.getElementById("dv4").style.display="none";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "3":
                // "Room":
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
