<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/5/2022
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>DANH SÁCH NHÂN VIÊN</title>
</head>
<body>

<%@include file="/include/header.jsp"%>

    <center>
        <h1>DANH SÁCH NHÂN VIÊN</h1>
        <h3>
            <a class="btn btn-outline-primary" href="add_employee.jsp">Thêm mới nhân  viên</a>
        </h3>
    </center>


    <div class="container ">
        <div class="row">
            <table class="table table-striped">
                <tr>
                    <th>ID Nhân viên</th>
                    <th>Họ tên</th>
                    <th>Ngày sinh</th>
                    <th>Số CMND</th>
                    <th>Lương</th>
                    <th>Số Điện Thoại</th>
                    <th>Email</th>
                    <th>Địa chỉ</th>
                    <th>Vị trí</th>
                    <th>Trình độ</th>
                    <th>Bộ phận</th>
                    <th>Tài khoản nhân viên</th>
                    <th colspan="2">Chức năng</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Nguyễn Văn An</td>
                    <td>1970-11-07</td>
                    <td>456231786</td>
                    <td>10000000</td>
                    <td>0901234121</td>
                    <td>annguyen@gmail.com</td>
                    <td>295 Nguyễn Tất Thành, Đà Nẵng</td>
                    <td>Quản lý</td>
                    <td>Cao Đẳng</td>
                    <td>Sale-Marketing</td>
                    <td>vanan01furama</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="edit_employee.jsp" onclick="">
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
                    <td>Lê Văn Bình</td>
                    <td>1997-04-09</td>
                    <td>654231234</td>
                    <td>7000000</td>
                    <td>0934212314</td>
                    <td>binhlv@gmail.com</td>
                    <td>22 Yên Bái, Đà Nẵng</td>
                    <td>Quản lý</td>
                    <td>Cao Đẳng</td>
                    <td>Hành chính</td>
                    <td>vanbinh02furama</td>
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
                    <td>Hồ Thị Yến</td>
                    <td>1995-12-12</td>
                    <td>999231723</td>
                    <td>14000000</td>
                    <td>0412352315</td>
                    <td>thiyen@gmail.com</td>
                    <td>K234/11 Điện Biên Phủ, Gia Lai</td>
                    <td>Quản lý</td>
                    <td>Đại Học</td>
                    <td>Hành chính</td>
                    <td>yenho03furama</td>
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
