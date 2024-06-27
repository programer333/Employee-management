<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tài khoản</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="./asset/css/taikhoan.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        /* Set border-spacing for the table to 10px */
        table {
            border-spacing: 10px;
        }

        /* Reduce the padding and margin for table cells */
        td {
            padding: 5px;
            margin: 0;
        }

        /* Adjust button styling */
        .action-buttons .edit-btn, .action-buttons .delete-btn {
            margin-right: 5px; /* Adjust as needed */
            padding: 5px 10px;  /* Adjust as needed */
        }

        /* Ensure the form is displayed inline within the action-buttons */
        .action-buttons form {
            display: inline-block;
            margin: 0;
        }
        .modal {
            display: none; /* Ẩn theo mặc định */
            position: fixed; /* Giữ ở vị trí */
            z-index: 1; /* Nằm trên cùng */
            left: 0;
            top: 0;
            width: 100%; /* Chiều rộng đầy đủ */
            height: 100%; /* Chiều cao đầy đủ */
            overflow: auto; /* Cho phép cuộn nếu cần */
            background-color: rgb(0, 0, 0); /* Màu dự phòng */
            background-color: rgba(0, 0, 0, 0.4); /* Màu đen với độ mờ */
        }

        /* Nội dung của modal */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% từ trên xuống và căn giữa */
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            text-align:center;/* Có thể thay đổi tùy theo kích thước màn hình */
        }

        /* Nút đóng */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Styling của form */
        form {
            display: flex;
            flex-direction: column;
        }

        form label {
            margin-top: 10px;
        }

        form input,
        form button {
            margin-top: 5px;
            padding: 10px;
            font-size: 16px;
        }

        form button {
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        form button:hover {
            background-color: #45a049;
        }
        input[type="text"],
        input[type="email"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        button[type="submit"] {
            padding: 10px;
            background-color: #ed0e0e;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Styling của thông báo */
        .notification {
            display: none; /* Ẩn theo mặc định */
            position: fixed; /* Giữ ở vị trí */
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 2; /* Nằm trên cùng */
        }

        .notification.error {
            background-color: #f44336; /* Màu đỏ cho lỗi */
        }
        .notification {
            display: none;
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border-radius: 5px;
            z-index: 2;
        }

        .notification.error {
            background-color: #f44336;
        }
        
    </style>
     
    
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
                        <span class="title">Circle K</span>
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
<div class="container">
        <div class="main">
            <h1>Danh sách tài khoản</h1>
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>Số Điện thoại</th>
                        <th>Mật khẩu</th>
                        <th>Gmail</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="taiKhoan" items="${taiKhoanList}">
                        <tr>
                            <td>${taiKhoan.sodienthai}</td>
                            <td>${taiKhoan.pass}</td>
                            <td>${taiKhoan.gmail}</td>
                            <td class="action-buttons">
                                <button type="button" class="edit-btn" onclick="editTaiKhoan('${taiKhoan.sodienthai}', '${taiKhoan.pass}', '${taiKhoan.gmail}')">Edit</button>
                                <form action="taikhoan" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="sodienthai" value="${taiKhoan.sodienthai}">
                                    <button type="submit" class="delete-btn">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <form id="editForm" onsubmit="return submitForm(event)">
                <h2>Chỉnh sửa Tài khoản</h2>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="sodienthai" id="sodienthai">
                <label for="newPass">Mật khẩu mới:</label>
                <input type="text" name="Pass" id="Pass" required>
                <label for="newGmail">Gmail mới:</label>
                <input type="email" name="Gmail" id="Gmail" required>
                <button type="submit">Cập nhật</button>
            </form>
        </div>
    </div>
        <div id="notification" class="notification <c:if test="${sessionScope.message ne null && (sessionScope.message.contains('không thành công') || sessionScope.message.contains('ký tự') || sessionScope.message.contains('phải chứa'))}">error</c:if>">
        <c:if test="${not empty sessionScope.message}">
            ${sessionScope.message}
            <%
                // Remove the message from the session
                session.removeAttribute("message");
            %>
        </c:if>
        <script>
        window.onload = function() {
            var notification = document.getElementById('notification');
            if (notification.textContent.trim() !== '') {
                notification.style.display = 'block';
                setTimeout(function() {
                    notification.style.display = '';
                }, 1000);
            }
        }
    </script>
    <script>
        function editTaiKhoan(sodienthai, Pass, Gmail) {
            document.getElementById('sodienthai').value = sodienthai;
            document.getElementById('Pass').value = Pass;
            document.getElementById('Gmail').value = Gmail;
            document.getElementById('editModal').style.display = 'block';
        }
        
    </script>
    <script>
// Function to close the modal
function closeModal() {
    var modal = document.getElementById("editModal");
    modal.style.display = "none";
    alert("Bạn đã thoát!");
}

// Get the modal
var modal = document.getElementById("editModal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal and display a message
span.onclick = function() {
    closeModal();
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        closeModal();
    }
}

// Example function to handle form submission
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

        
</body>

</html>
