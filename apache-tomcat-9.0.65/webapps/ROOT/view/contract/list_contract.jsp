<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/6/2022
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <table class="table table-hover">
        <tr>
            <td>#</td>
            <td>Dịch vụ</td>
            <td>Khách Hàng</td>
            <td>Ngày bắt đầu</td>
            <td>Ngày kết thúc</td>
            <td>Tiền đặt cọc</td>
            <td>Tổng tiền</td>
            <td colspan="2">Các dịch vụ đi kèm</td>
        </tr>

        <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalContract">
                    add
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    danh sách dịch vụ đi kèm
                </button>
            </td>
        </tr>
    </table>


    <!-- Modal -->
    <div class="modal fade " id="modalContract" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">THÊM MỚI HỢP ĐỒNG CHI TIẾT</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-center">
                    <form action="">
                        <table cellpadding="10">
                            <tr>
                                <td>Mã hợp đồng chi tiết</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>Mã hợp đồng</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>Mã dịch vụ đi kèm</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>Số lượng</td>
                                <td><input type="text"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary">Lưu</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">DANH SÁCH HỢP ĐỒNG ĐI KÈM</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                                <%--Sử dụng checkbox--%>
                    <p><input type="checkbox">Karaoke</p>
                    <p><input type="checkbox">Thuê xe máy</p>
                    <p><input type="checkbox">Thuê xe đạp</p>
                    <p><input type="checkbox">Buffet buổi sáng</p>
                    <p><input type="checkbox">Buffet buổi trưa</p>
                    <p><input type="checkbox">Buffet buổi tối</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Quay lại</button>
                    <button type="button" class="btn btn-primary">Chọn</button>
                </div>
            </div>
        </div>
    </div>
</div>
<a class="btn btn-secondary" href="view/contract/add_contract.jsp">Thêm mới</a>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
