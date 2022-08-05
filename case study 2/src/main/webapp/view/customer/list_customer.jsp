<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 11:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>DANH SÁCH KHÁCH HÀNG</title>
</head>
<body>

<%@include file="/include/header.jsp"%>

    <center>
        <h1>DANH SÁCH KHÁCH HÀNG</h1>
        <h3>
            <a class="btn btn-outline-primary" href="add_customer.jsp">Thêm mới khách hàng</a>
        </h3>
    </center>


    <div class="container ">
        <div class="row">
            <table class="table table-striped">
                <tr>
                    <th>ID khách </th>
                    <th>Loại khách</th>
                    <th>Họ tên</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>Số CMND</th>
                    <th>Số Điện Thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th colspan="2">Chức năng</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Member</td>
                    <td>Nguyễn Thị Hào</td>
                    <td>1970-11-07</td>
                    <td>Nữ</td>
                    <td>643431213</td>
                    <td>0945423362</td>
                    <td>thihao07@gmail.com</td>
                    <td>23 Nguyễn Hoàng, Đà Nẵng</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="edit_customer.jsp" onclick="">
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
                    <td>Gold</td>
                    <td>Phạm Xuân Diệu</td>
                    <td>1992-08-08</td>
                    <td>Nữ</td>
                    <td>865342123</td>
                    <td>0954333333</td>
                    <td>xuandieu92@gmail.com</td>
                    <td>K77/22 Thái Phiên, Quảng Trị</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="edit_customer.jsp" onclick="">
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
                    <td>Diamond</td>
                    <td>Trương Đình Nghệ</td>
                    <td>1990-02-27</td>
                    <td>Nam</td>
                    <td>488645199</td>
                    <td>0373213122</td>
                    <td>nghenhan2702@gmail.com</td>
                    <td>K323/12 Ông Ích Khiêm, Vinh</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="edit_customer.jsp" onclick="">
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

<%@include file="/include/footer.jsp"%>

</body>
</html>
