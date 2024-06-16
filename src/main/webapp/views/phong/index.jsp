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
    <h2 class="mb-4">Thêm Dữ Liệu Phòng</h2>
    <form action="/phong/add" method="POST" class="mb-5">
        <input type="hidden" name="id" value="${phong != null ? phong.id : ''}">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="tenPhong">Tên Phòng</label>
                    <input type="text" class="form-control" id="tenPhong" name="tenPhong"
                           value="${phong != null ? phong.tenPhong : ''}">
                    <c:if test="${not empty errors['tenPhong']}">
                        <div class="alert alert-danger mt-2">${errors['tenPhong']}</div>
                    </c:if>
                </div>
                <div class="form-group">
                    <label>Trạng Thái</label><br>
                    <input type="radio" id="active" name="trangThai"
                           value="Còn Phòng" ${phong != null && phong.trangThai == 'Còn Phòng' ? 'checked' : ''}>
                    <label>Còn Phòng</label><br>
                    <input type="radio" id="inactive" name="trangThai"
                           value="Hết Phòng" ${phong != null && phong.trangThai == 'Hết Phòng' ? 'checked' : ''}>
                    <label>Hết Phòng</label>
                </div>

            </div>
            <div class="col-md-6">

                <div class="form-group">
                    <label for="soLuong">Số Lượng Phòng</label>
                    <input type="number" class="form-control" id="soLuong" name="soLuong"
                           value="${phong != null ? phong.soLuong : ''}">
                    <c:if test="${not empty errors['soLuong']}">
                        <div class="alert alert-danger mt-2">${errors['soLuong']}</div>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="ghiChu">Ghi chú</label>
                    <input type="text" class="form-control" id="ghiChu" name="ghiChu"
                           value="${phong != null ? phong.ghiChu : ''}">
                    <c:if test="${not empty errors['ghiChu']}">
                        <div class="alert alert-danger mt-2">${errors['ghiChu']}</div>
                    </c:if>
                </div>
            </div>

            <div class="form-group">
                <label for="loaiPhong">Tên Loại Phòng</label>
                <select class="form-control" id="loaiPhong" name="loaiPhong">
                    <!-- Thêm các tùy chọn loại phòng ở đây -->
                    <c:forEach var="lp" items="${listLP}">
                        <option value="${lp.id}" ${phong != null && phong.loaiPhong.id == lp.id ? 'selected' : ''}>${lp.ten}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="my-3">
            <button type="submit" class="btn btn-dark">Thêm</button>
        </div>
    </form>
    <table class="table">
        <thead>
        <tr>
            <th>Tên phòng</th>
            <th>Số lượng phòng</th>
            <th>Trạng thái</th>
            <th>ghi Chú</th>
            <th>Tên loại phòng</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${pagePhong.content}">
            <tr>
                <td>${p.tenPhong}</td>
                <td>${p.soLuong}</td>
                <td>${p.trangThai}</td>
                <td>${p.ghiChu}</td>
                <td>${p.loaiPhong.ten}</td>
                <td>
                    <a href="/phong/detail/${p.id}" class="btn btn-success">Detail</a>
                </td>


            </tr>
        </c:forEach>
        </tbody>
    </table>
    <ul class="pagination">
        <c:if test="${pagePhong.totalPages > 1}">
            <c:if test="${pagePhong.number > 0}">
                <li class="page-item"><a class="page-link" href="?page=${pagePhong.number - 1}">Previous</a></li>
            </c:if>
            <c:forEach begin="0" end="${pagePhong.totalPages - 1}" var="i">
                <li class="page-item ${i == pagePhong.number ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}">${i + 1}</a>
                </li>
            </c:forEach>
            <c:if test="${pagePhong.number < pagePhong.totalPages - 1}">
                <li class="page-item"><a class="page-link" href="?page=${pagePhong.number + 1}">Next</a></li>
            </c:if>
        </c:if>
    </ul>

</div>
</body>
</html>