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
    <title>deetail SPCT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h1 class="text-center">Detail SPCT</h1>
    <form action="/spct/update" method="post">
        <div class="mb-3">
            <label for="maSPCT" class="form-label">Mã SPCT</label>
            <input type="text" class="form-control" id="maSPCT" name="ma" value="${spct.ma}" readonly>
        </div>
        <div class="mb-3">
            <label for="sanPham" class="form-label">Tên Sản Phẩm</label>
            <select class="form-select" id="sanPham" name="sanPham" disabled>
                <option value="${spct.sanPham.id}" selected>${spct.sanPham.ten}</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="soLuong" class="form-label">Số Lượng</label>
            <input type="number" class="form-control" id="soLuong" name="soLuong" value="${spct.soLuong}" readonly>
        </div>
        <div class="mb-3">
            <label for="donGia" class="form-label">Đơn Giá</label>
            <input type="number" step="0.01" class="form-control" id="donGia" name="donGia" value="${spct.donGia}" readonly>
        </div>
        <div class="mb-3">
            <label for="trangThai" class="form-label">Trạng Thái</label>
            <select class="form-select" id="trangThai" name="trangThai" disabled>
                <option value="${spct.trangThai}" selected>${spct.trangThai == 0 ? "Hoạt động" : "Ngừng hoạt động"}</option>
            </select>
        </div>

    </form>
</div>
</body>
</html>
