<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.NhanVien"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Nhân viên</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="./asset/css/homestyle.css">
    <link rel="stylesheet" href="./asset/css/nhanvien.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
.search {
    display: flex;
    justify-content: center; /* Centers the search input horizontally */
    align-items: center; /* Centers the content vertically if needed */
    width: 100%;
    margin: 20px 0; /* Adds margin for spacing */
}

.search form {
    display: flex;
    align-items: center;
    width: 50%;
    border-radius: 40px;
    background-color: var(--white) ;
}

.search input[type="text"] {
    width: 100%; /* Takes up the full width of the form */
    padding: 10px; /* Adds padding for a larger input box */
    font-size: 1.2em; /* Increases the font size */
    border: 1px solid #ccc; /* Border styling */
    border-radius: 20px; /* Rounded corners for the left side */
    outline: none; /* Removes default outline */
}

.search button {
    padding: 10px 15px; /* Adds padding */
    font-size: 1.2em; /* Increases the font size */
    background-color: #4CAF50; /* Background color for the button */
    color: white; /* Text color for the button */
    border: none; /* Removes default border */
    border-radius: 40px; /* Rounded corners for the right side */
    cursor: pointer; /* Pointer cursor on hover */
}

.search button:hover {
    background-color: #ff0000; /* Darker green on hover */
}
    </style>
    <script>
        function showAddForm() {
            document.getElementById('addForm').style.display = 'block';
        }

        function showEditForm(mnv, hoten, diachi, ngaysinh, sdt, chucvu) {
            document.getElementById('editForm').style.display = 'block';
            document.getElementById('editMnv').value = mnv;
            document.getElementById('editHoTen').value = hoten;
            document.getElementById('editDiachi').value = diachi;
            document.getElementById('editNgaysinh').value = ngaysinh;
            document.getElementById('editSdt').value = sdt;
            document.getElementById('editChucvu').value = chucvu;
        }

        function hideForms() {
            document.getElementById('addForm').style.display = 'none';
            document.getElementById('editForm').style.display = 'none';
        }
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

        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <form action="nhanvien" method="get">
                        <input type="hidden" name="action" value="search">
                        <input type="text" name="searchTerm" placeholder="Search here">
                        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
            </div>

            <!-- ==================== Table ==================== -->
            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Danh sách Nhân viên</h2>
                        <a href="javascript:void(0);" onclick="showAddForm();" class="btn">Thêm Nhân viên</a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>Mnv</td>
                                <td>Họ Tên</td>
                                <td>Địa chỉ</td>
                                <td>Ngày sinh</td>
                                <td>Số ĐT</td>
                                <td>Chức vụ</td>
                                <td>Hành động</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<NhanVien> nhanvienList = (List<NhanVien>) request.getAttribute("nhanvienList");
                                if (nhanvienList != null) {
                                    for (NhanVien nv : nhanvienList) {
                            %>
                            <tr>
                                <td><%= nv.getMnv() %></td>
                                <td><%= nv.getHoTen() %></td>
                                <td><%= nv.getDiachi() %></td>
                                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(nv.getNgaysinh()) %></td>
                                <td><%= nv.getSdt() %></td>
                                <td><%= nv.getChucvu() %></td>
                                <td>
                                    <a href="javascript:void(0);" onclick="showEditForm('<%= nv.getMnv() %>', '<%= nv.getHoTen() %>', '<%= nv.getDiachi() %>', '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(nv.getNgaysinh()) %>', '<%= nv.getSdt() %>', '<%= nv.getChucvu() %>');" class="btn">Sửa</a>
                                    <a href="nhanvien?action=delete&Mnv=<%= nv.getMnv() %>" class="btn">Xóa</a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Add Form -->
            <div id="addForm" style="display:none;">
                <h2>Thêm Nhân viên</h2>
                <form action="nhanvien" method="post">
                    <input type="hidden" name="action" value="add">
                    <label for="HoTen">Họ Tên:</label>
                    <input type="text" id="HoTen" name="HoTen" required>
                    <label for="Diachi">Địa chỉ:</label>
                    <input type="text" id="Diachi" name="Diachi" required>
                    <label for="ngaysinh">Ngày sinh:</label>
                    <input type="date" id="ngaysinh" name="ngaysinh" required>
                    <label for="Sdt">Số ĐT:</label>
                    <input type="text" id="Sdt" name="Sdt" required>
                    <label for="Chucvu">Chức vụ:</label>
                    <input type="text" id="Chucvu" name="Chucvu" required>
                    <button type="submit">Thêm</button>
                    <button type="button" onclick="hideForms();">Hủy</button>
                </form>
            </div>
                
            <div id="editForm" style="display:none;">
                <h2>Sửa Nhân viên</h2>
                <form action="nhanvien" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="editMnv" name="Mnv">
                    <label for="editHoTen">Họ Tên:</label>
                    <input type="text" id="editHoTen" name="HoTen" required>
                    <label for="editDiachi">Địa chỉ:</label>
                    <input type="text" id="editDiachi" name="Diachi" required>
                    <label for="editNgaysinh">Ngày sinh:</label>
                    <input type="date" id="editNgaysinh" name="ngaysinh" required>
                    <label for="editSdt">Số ĐT:</label>
                    <input type="text" id="editSdt" name="Sdt" required>
                    <label for="editChucvu">Chức vụ:</label>
                    <input type="text" id="editChucvu" name="Chucvu" required>
                    <button type="submit">Sửa</button>
                    <button type="button" onclick="hideForms();">Hủy</button>
                </form>
            </div
        </div>
    </div>
     <script>
         function showSuccessMessage() {
    var message = '<%= session.getAttribute("message") %>';
    if (message && window.location.href.indexOf("nhanvien?action=list") !== -1) {
        // Tạo một div để hiển thị thông báo
        var successMessageDiv = document.createElement('div');
        successMessageDiv.classList.add('success-message');
        successMessageDiv.style.display = 'block';
        successMessageDiv.style.position = 'fixed';
        successMessageDiv.style.top = '20px';
        successMessageDiv.style.right = '20px';
        successMessageDiv.style.backgroundColor = '#4CAF50';
        successMessageDiv.style.color = 'white';
        successMessageDiv.style.padding = '20px';
        successMessageDiv.style.borderRadius = '5px';
        successMessageDiv.style.boxShadow = '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
        successMessageDiv.style.zIndex = '9999';

        // Tạo nội dung thông báo
        var messageText = document.createElement('p');
        messageText.textContent = message;
        successMessageDiv.appendChild(messageText);

        // Tạo nút đóng thông báo
        var closeButton = document.createElement('button');
        closeButton.textContent = 'Đóng';
        closeButton.style.backgroundColor = '#3e8e41';
        closeButton.style.border = 'none';
        closeButton.style.color = 'white';
        closeButton.style.padding = '10px 20px';
        closeButton.style.textAlign = 'center';
        closeButton.style.textDecoration = 'none';
        closeButton.style.display = 'inline-block';
        closeButton.style.fontSize = '16px';
        closeButton.style.marginTop = '10px';
        closeButton.style.cursor = 'pointer';
        closeButton.addEventListener('click', function() {
            successMessageDiv.style.display = 'none';
        });
        successMessageDiv.appendChild(closeButton);

        // Thêm thông báo vào trang web
        document.body.appendChild(successMessageDiv);

        // Xóa thông báo khỏi session
        <% session.removeAttribute("message"); %>
    }
    setTimeout(function() {
    successMessageDiv.style.display = 'none';
}, 1000);
}

// Gọi hàm showSuccessMessage() khi trang được tải
window.onload = showSuccessMessage;

      </script>
</body>

</html>
