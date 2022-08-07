

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container w-50 mt-5 p-2 " style="border: 1px solid grey; border-radius: 15px">
    <form class="row g-3 text-center" action="" method="post">
        <table cellpadding="10">
            <tr>
                <td>Ngày bắt đầu</td>
                <td><input type="date" name="" class="form-control" value=""
                           id="day_begin" required></td>
            </tr>
            <tr>
                <td>Ngày kết thúc</td>
                <td><input type="date" name="" class="form-control" value=""
                           id="day_end" required></td>
            </tr>
            <tr>
                <td>Tiền gửi</td>
                <td><input type="text" class="form-control"></td>
            </tr>
            <tr>
                <td>Tổng tiền</td>
                <td><input type="text" class="form-control"></td>
            </tr>
            <tr>
                <td>Khách hàng thuê dịch vụ</td>
                <td>
                    <select name=""  class="form-select" id="hire_service">
                        <option value="None">Chọn khách hàng</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Dịch vụ</td>
                <td>
                    <select name=""  class="form-select" id="choose_service">
                        <option value="None">Chọn dịch vụ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Dịch vụ đi kèm</td>
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalContract">
                        add
                    </button>
                </td>
            </tr>
        </table>

        <div class="col-12">
            <button type="submit" class="btn btn-danger">HUỶ BỎ</button>
            <button type="submit" class="btn btn-primary">TẠO HỢP ĐỒNG</button>
        </div>
    </form>
</div>


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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
