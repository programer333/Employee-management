<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luong</title>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="./asset/css/homestyle.css">
    <link rel="stylesheet" href="./asset/css/Luong.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #d6d8db;
            border-radius: 4px;
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
            text-align: center;
        }
        .message.error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }
        #addEmployeeForm {
            display: none;
        }
    </style>
    <script>
        function toggleForm() {
            var form = document.getElementById("addEmployeeForm");
            form.style.display = form.style.display === "none" ? "block" : "none";
        }

        function hideMessage() {
            var messageDiv = document.getElementById("message");
            if (messageDiv) {
                setTimeout(function() {
                    messageDiv.style.display = "none";
                }, 2000);
            }
        }

        window.onload = hideMessage;
    </script>
    <script>
    function logout() {
    // Thực hiện các hành động cần thiết để thoát, ví dụ như xóa thông tin đăng nhập
    
    // Hiển thị thông báo thoát thành công
    alert("Bạn đã thoát thành công, vui lòng đăng nhập !");
    
    // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chủ
    window.location.href = "http://localhost:9999/QLNHANVIEN/LoginServlet";
}
</script>
</head>
<body>
    <!-- =============== Navigation ================ -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="Home">
                        <span class="icon">
                            <i class="fa-solid fa-shop"></i>
                        </span>
                        <span class="title">Cricle K</span>
                    </a>
                </li>
                <li>
                    <a href="Home">
                        <span class="icon">
                            <i class="fa-solid fa-house"></i>
                        </span>
                        <span class="title">Home</span>
                    </a>
                </li>
                <li>
                    <a href="nhanvien">
                        <span class="icon">
                            <i class="fa-solid fa-users"></i>
                        </span>
                        <span class="title">Nhân viên</span>
                    </a>
                </li>
                <li>
                    <a href="taikhoan">
                        <span class="icon">
                            <i class="fa-solid fa-user"></i>
                        </span>
                        <span class="title">Tài khoản</span>
                    </a>
                </li>
                <li>
                    <a href="LuongServlet">
                        <span class="icon">
                            <i class="fa-solid fa-money-check-dollar"></i>
                        </span>
                        <span class="title">Lương</span>
                    </a>
                </li>
                <li>
                    <a href="thongke">
                        <span class="icon">
                           <i class="fa-solid fa-chart-simple"></i>
                        </span>
                        <span class="title">Thống kê</span>
                    </a>
                </li>
                
                <li>
                    <a href="RegisterServlet" onclick="logout()">
                     <span class="icon">
                     <i class="fa-solid fa-arrow-right-from-bracket"></i>
                     </span>
                      <span class="title">Thoát</span>
                  </a>
                </li>
            </ul>
        </div>

        <!-- ========================= Main ==================== -->
        <div class="main">
            <h1>Danh sách Lương Nhân Viên</h1>

            <h2>Bảng Lương</h2>
            <table border="1">
                <tr>
                    <th>Số Thứ Tự</th>
                    <th>Họ Tên</th>
                    <th>Lương Cơ Bản</th>
                    <th>Số ngày làm</th>
                    <th>Lương Phụ Cấp</th>
                    <th>Tổng Lương</th>
                </tr>
                <c:forEach var="nhanvien" items="${nhanvienList}">
                    <tr>
                        <td>${nhanvien.stt}</td>
                        <td>${nhanvien.ten}</td>
                        <td>${nhanvien.luongCoBan}</td>
                        <td>${nhanvien.soGioLamViec}</td>
                        <td>${nhanvien.luongPhuCap}</td>
                        <td>${nhanvien.totalSalary}</td>
                    </tr>
                </c:forEach>
            </table>

            <h2>Tổng Lương Thanh Toán : ${totalSalary} $</h2>

            <!-- Display message if available -->
             <c:if test="${not empty message}">
                <div id="message" class="message ${messageType}">${message}</div>
            </c:if>

            <!-- Button to show the form -->
            <button onclick="toggleForm()">Thêm Nhân Viên</button>

            <!-- Hidden form for adding a new employee -->
            <div id="addEmployeeForm" style="display:none;">
                <h2>Thêm Nhân Viên Mới</h2>
                <form action="LuongServlet" method="post">
                    <input type="hidden" name="action" value="addNhanvien">
                    <label for="stt">Số Thứ Tự:</label>
                    <input type="text" id="stt" name="stt" required><br>
                    <label for="ten">Họ Tên:</label>
                    <input type="text" id="ten" name="ten" required><br>
                    <label for="luongCoBan">Lương Cơ Bản:</label>
                    <input type="text" id="luongCoBan" name="luongCoBan" required><br>
                    <label for="soNgayLam">Số Ngày Làm:</label>
                    <input type="text" id="soNgayLam" name="soNgayLam" required><br>
                    <label for="luongPhuCap">Lương Phụ Cấp:</label>
                    <input type="text" id="luongPhuCap" name="luongPhuCap" required><br>
                    <button type="submit">Thêm </button>
                    <button type="button" class="cancel-btn">Hủy</button>
                </form>
            </div>
        </div>
    </div>
            <script>
  document.addEventListener('DOMContentLoaded', function() {
    var addEmployeeForm = document.getElementById('addEmployeeForm');
    var cancelBtn = addEmployeeForm.querySelector('.cancel-btn');

    cancelBtn.addEventListener('click', function() {
      addEmployeeForm.style.display = 'none';
    });
  });
</script>

</body>
</html>
