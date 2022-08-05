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

    <nav class="navbar navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="" width="60" height="80">
            </a>
            <span>Nguyễn Hữu Thức</span>
        </div>
    </nav>


    <center>
        <h1>QUẢN LÝ DỊCH VỤ</h1>
        <h3>
            <a class="btn btn-outline-primary" href="add.jsp">Thêm mới dịch vụ</a>
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
                <th>Kiểu thuê</th>
                <th>Tiêu chuẩn phòng</th>
                <th>Mô tả tiện nghi</th>
                <th>Số tầng</th>
                <th>Diện tích hồ bơi</th>
                <th>Dịch vụ miễn phí đi kèm</th>
                <th colspan="2">Chức năng</th>
            </tr>
            <tr>
                <td>1</td>
                <td>Villa Beach Front</td>
                <td>25000</td>
                <td>10000000</td>
                <td>10</td>
                <td>3</td>
                <td>Vip</td>
                <td>Có hồ bơi</td>
                <td>4</td>
                <td>500</td>
                <td>1 Xe máy, 1 Xe đạp</td>
                <td>
                    <a type="button" class="btn btn-primary"  href="edit.jsp" onclick="">
                        Sửa
                    </a></td>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="">
                        Xóa
                    </button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>House Princess 02</td>
                <td>10000</td>
                <td>4000000</td>
                <td>5</td>
                <td>2</td>
                <td>Normal</td>
                <td>Có hồ bơi</td>
                <td>2</td>
                <td>100</td>
                <td>karaoke</td>
                <td>
                    <a type="button" class="btn btn-primary"  href="edit.jsp" onclick="">
                        Sửa
                    </a></td>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="">
                        Xóa
                    </button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>Room Twin 01</td>
                <td>5000</td>
                <td>1000000</td>
                <td>2</td>
                <td>4</td>
                <td>Normal</td>
                <td>Có tivi</td>
                <td>1</td>
                <td>null</td>
                <td>1 Xe máy, 1 Xe đạp</td>
                <td>
                    <a type="button" class="btn btn-primary"  href="edit.jsp" onclick="">
                        Sửa
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="">
                        Xóa
                    </button>
                </td>
            </tr>
        </table>
        </div>
    </div>
</body>
</html>
