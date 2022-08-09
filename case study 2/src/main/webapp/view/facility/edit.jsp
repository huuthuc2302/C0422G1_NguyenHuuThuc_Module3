<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/4/2022
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>CHỈNH SỬA DỊCH VỤ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%@include file="/include/header.jsp"%>

    <div class="container w-50 mt-5 p-2 bg-success" id="create" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">CHỈNH SỬA DỊCH VỤ</h3>
        <form class="row g-3 text-center" action="/facility?action=update&facilityId=${facility.facilityId}" method="post">
            <div class="col-md-12">
                <label class="form-label">Loại dịch vụ</label>
                <select id="type_facility" name="facilityTypeId" value="${facility.facilityTypeId}" class="form-select" onchange="showFacilityInput()">
                    <option value="None" disabled >Chọn loại dịch vụ</option>
                    <c:forEach items="${facilityList}" var="facilityType">
                        <c:choose>
                            <c:when test="${facility.facilityTypeId==facilityType.facilityTypeId}">
                                <option value="${facilityType.facilityTypeId}" selected> ${facilityType.facilityTypeName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${facilityType.facilityTypeId}" > ${facilityType.facilityTypeName}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>

            <%--Dịch vụ mặc định--%>
            <div class="col-md-12">
                <label for="facilityName" class="form-label">Tên dịch vụ</label>
                <input type="text" class="form-control" id="facilityName" name="facilityName" value="${facility.facilityName}">
            </div>
            <div class="col-md-12">
                <label for="facilityArea" class="form-label">Diện tích sử dụng</label>
                <input type="text" class="form-control" id="facilityArea" name="facilityArea" value="${facility.facilityArea}">
            </div>
            <div class="col-md-12">
                <label for="facilityCost" class="form-label">Chi phí thuê</label>
                <input type="text" class="form-control" id="facilityCost"  name="facilityCost" value="${facility.facilityCost}">
            </div>
            <div class="col-md-12">
                <label for="facilityMaxPeople" class="form-label">Số lượng người tối đa </label>
                <input type="text" class="form-control" id="facilityMaxPeople"  name="facilityMaxPeople" value="${facility.facilityMaxPeople}">
            </div>
            <div class="col-md-12">
                <label for="rentTypeId" class="form-label">Kiểu thuê</label>
                <input type="text" class="form-control" id="rentTypeId" name="rentTypeId" value="${facility.rentTypeId}">
            </div>




            <%--Villa và House sẽ có chung--%>
            <div class="col-md-12" id="dv1">
                <label for="standardRoom" class="form-label">Tiêu chuẩn phòng</label>
                <input type="text" class="form-control" id="standardRoom" name="standardRoom" value="${facility.standardRoom}">
            </div>
            <div class="col-md-12" id="dv2">
                <label for="description" class="form-label">Mô tả tiện nghi khác</label>
                <input type="text" class="form-control" id="description" name="description" value="${facility.description}">
            </div>
            <div class="col-md-12" id="dv3">
                <label for="numberOfFloor" class="form-label">Số tầng</label>
                <input type="text" class="form-control" id="numberOfFloor" name="numberOfFloor" value="${facility.numberOfFloor}">
            </div>


            <%--Riêng Villa sẽ có thêm--%>
            <div class="col-md-12" id="dv4">
                <label for="poolArea" class="form-label">Diện tích hồ bơi</label>
                <input type="text" class="form-control" id="poolArea" name="poolArea" value="${facility.poolArea}"
                >
            </div>


            <%--Riêng Room sẽ có thêm--%>
            <div class="col-md-12" id="dv5">
                <label for="facilityFree" class="form-label">Dịch vụ miễn phí đi kèm</label>
                <input type="text" class="form-control" id="facilityFree" name="facilityFree" value="${facility.facilityFree}">
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>
        </form>
    </div>



    <script>
        function showFacilityInput(value) {
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
                    document.getElementById("dv1").style.display="block";
                    document.getElementById("dv2").style.display="block";
                    document.getElementById("dv3").style.display="block";
                    document.getElementById("dv4").style.display="block";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "2":
                    document.getElementById("dv1").style.display="block";
                    document.getElementById("dv2").style.display="block";
                    document.getElementById("dv3").style.display="block";
                    document.getElementById("dv4").style.display="none";
                    document.getElementById("dv5").style.display="none";
                    break;
                case "3":
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
