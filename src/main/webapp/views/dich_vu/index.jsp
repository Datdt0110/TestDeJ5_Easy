<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2 class="text-center">Them moi dich vu</h2>
    <form action="/dich-vu/update}" method="post">
        <input type="hidden" name="id" value="${dichVu.id}">
        <div class="row">
            <div class="col-md-6">
                <div class="my-3">
                    <label class="form-label">Ten dich vu</label>
                    <input class="form-control" name="tenDichVu" type="text" value="${dichVu.tenDichVu}">
                </div>
                <div class="my-3">
                    <label class="form-label">Don gia</label>
                    <input class="form-control" name="donGia" type="number" value="${dichVu.donGia}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="my-3">
                    <label class="form-label">Đơn vị Tiền</label>
                    <input class="form-control" name="donViTien" type="text" value="${dichVu.donViTien}">
                </div>
                <div class="my-3">
                    <label class="form-label">Tên Loại dịch vụ</label>
                    <select class="form-select" name="loaiDichVu">
                        <c:forEach items="${listLDV}" var="i">
                            <option value="${i.id}"  ${i.id== dichVu.loaiDichVu.id?'selected':""} >${i.ten}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="my-3">
            <button class="btn btn-dark" type="submit">Add</button>
        </div>
    </form>
    <table class="table">
        <thead>
        <tr>
            <th>Teen dịch vụ</th>
            <th>Đơn giá</th>
            <th>Đơn vị tiền</th>
            <th>Tên loại dịch vụ</th>
            <th>Mô tả dịch vuj</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dv" items="${listDV}">
            <tr>
                <td>${dv.tenDichVu}</td>
                <td>${dv.donGia}</td>
                <td>${dv.donViTien}</td>
                <td>${dv.loaiDichVu.ten}</td>
                <td>${dv.moTa}</td>
                <td>
                    <a class="btn btn-dark" href="/dich-vu/detail/${dv.id}">Detail</a>
                    <a class="btn btn-dark" href="/dich-vu/delete/${dv.id}">Xoa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>