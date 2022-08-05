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
    <title>CHỈNH SỬA DỊCH VỤ</title>
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

    <div class="container w-50 mt-2 p-2 bg-success" style="border: 1px solid grey; border-radius: 15px">
        <h3 align="center">CHỈNH SỬA DỊCH VỤ</h3>
        <form class="row g-3 text-center" action="" method="post">
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
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="col-md-12">
                <label for="area" class="form-label">Diện tích sử dụng</label>
                <input type="text" class="form-control" id="area" name="area">
            </div>
            <div class="col-md-12">
                <label for="cost" class="form-label">Chi phí thuê</label>
                <input type="text" class="form-control" id="cost"  name="cost" >
            </div>
            <div class="col-md-12">
                <label for="inputAddress2" class="form-label">Số lượng người tối đa </label>
                <input type="text" class="form-control" id="inputAddress2"  name="max_people" >
            </div>
            <div class="col-md-12">
                <label for="inputCity" class="form-label">Kiểu thuê</label>
                <input type="text" class="form-control" id="inputCity" name="rent_type_id">
            </div>




            <%--Villa và House sẽ có chung--%>
            <div class="col-md-12" id="dv1" style="display: none">
                <label for="standard_room" class="form-label">Tiêu chuẩn phòng</label>
                <input type="text" class="form-control" id="standard_room" name="standard_room">
            </div>
            <div class="col-md-12" id="dv2" style="display: none">
                <label for="description_other_convenience" class="form-label">Mô tả tiện nghi khác</label>
                <input type="text" class="form-control" id="description_other_convenience" name="description_other_convenience">
            </div>
            <div class="col-md-12" id="dv3" style="display: none">
                <label for="number_of_floors" class="form-label">Số tầng</label>
                <input type="text" class="form-control" id="number_of_floors" name="number_of_floors">
            </div>


            <%--Riêng Villa sẽ có thêm--%>
            <div class="col-md-12" id="dv4" style="display: none">
                <label for="pool_area" class="form-label">Diện tích hồ bơi</label>
                <input type="text" class="form-control" id="pool_area" name="pool_area">
            </div>


            <%--Riêng Room sẽ có thêm--%>
            <div class="col-md-12" id="dv5" style="display: none">
                <label for="facility_free" class="form-label">Dịch vụ miễn phí đi kèm</label>
                <input type="text" class="form-control" id="facility_free" name="facility_free">
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary">Cập nhật</button>
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

</body>
</html>
