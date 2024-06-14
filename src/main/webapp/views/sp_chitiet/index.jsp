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
    <h1 class="text-center">Danh Sach SPCT</h1>
    <a class="btn btn-primary text-end" href="/spct/create">Create</a>
<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Ma</th>
        <th>Ten San Pham</th>
        <th>Số lượng</th>
        <th >Đơn giá</th>
        <th>Trạng thái</th>
        <th>Hành động</th>

    </tr>
    </thead>
    <tbody>

    <c:forEach items="${ listSPCT }" var="cate">
        <tr>
            <td>${ cate.id }</td>
            <td>${ cate.ma }</td>
            <td>${ cate.sanPham.ten }</td>
            <td>${cate.soLuong}</td>
            <td>${cate.donGia}</td>
            <td>${cate.trangThai==0 ? "Hoạt Động":"Ngừng Hoạt Động"}</td>
            <td>
                <a class="btn btn-dark" href="/spct/detail?id=${cate.id}">Detail</a>

            </td>



        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>