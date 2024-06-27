
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="./asset/css/homestyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        .iconBx i.fa-brands.fa-facebook {
         color: blue;
        }
        .iconBx i.fa-brands.fa-shopify {
  color: #ff9900;
}
.iconBx i.fa-brands.fa-instagram {
  color: #ff6b6b;
}
.cardBox .card .iconBx i.fa-brands.fa-whatsapp {
  color: #34b7a7;
}
     .user {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #f9f9f9; /* Light background for contrast */
    padding:0 ;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 200px; 
    height: 60px;/* Adjust width as necessary */
    text-align: center;
}

.user img {
    border-radius: 50%;
    width: 50px;
    height: 50px;
    margin-bottom: 10px;
    margin-left: -10px;
}

#greeting {
    font-size: 1.2em;
    font-weight: bold;
    color: #333; /* Darker color for better readability */
    margin-bottom: 10px;
}

.user button {
    padding: 5px 10px;
    border: none;
    background-color: #4CAF50; /* Green background */
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.user button:hover {
    background-color: #45a049; /* Darker green on hover */
}

#updateForm {
    display: none;
    margin-top: 10px;
}

#updateForm input {
    padding: 5px;
    margin-bottom: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: calc(100% - 12px); /* Adjust width to fit within the form */
}
#updateForm button {
    padding: 5px 10px;
    border: none;
    background-color: #008CBA; /* Blue background */
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

#updateForm button:hover {
    background-color: #007BB5; /* Darker blue on hover */
}
 #logoutMessage {
            display: none;
            color: green;
            font-size: 18px;
        }
    </style>
    <script>
        function toggleUpdateForm() {
            var updateForm = document.getElementById("updateForm");
            updateForm.style.display = updateForm.style.display === "none" ? "block" : "none";
        }

        function updateName() {
            var newName = document.getElementById("newName").value;
            if (newName) {
                document.getElementById("greeting").innerText = "Hi " + newName;
                document.getElementById("updateForm").style.display = "none";
            }
        }
    </script>

<script>
    function logout() {
    // Thực hiện các hành động cần thiết để thoát, ví dụ như xóa thông tin đăng nhập
    
    // Hiển thị thông báo thoát thành công
    alert("Bạn đã thoát thành công,vui lòng đăng nhập !");
    
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

<div id="logoutMessage">Bạn đã thoát thành công. Vui lòng đăng nhập lại.</div>
            </ul>
        </div>
         
        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="user">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR79gi_2vZKsvc3RnEasXgKrRiihfTJVay40Q&s" alt="User Avatar">
    <span id="greeting">Hi user</span>
    <button onclick="toggleUpdateForm()">Đổi thông tin</button>
</div>

<div id="updateForm">
    <input type="text" id="newName" placeholder="Nhập tên mới">
    <button onclick="updateName()">Cập nhật</button>
</div>


                
            </div>

            <!-- ======================= Cards ================== -->
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="cardName"> whatsapp</div>
                    </div>

                    <div class="iconBx">
                       <i class="fa-brands fa-whatsapp"></i>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="cardName">instagram</div>
                    </div>

                    <div class="iconBx">
                       <i class="fa-brands fa-instagram"></i>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="cardName">shopify </div>
                    </div>

                    <div class="iconBx">
                       <i class="fa-brands fa-shopify"></i>
                    </div>
                </div>

                <div class="card">
                    <div>
                        <div class="cardName">facebook</div>
                    </div>

                    <div class="iconBx">
                        <i class="fa-brands fa-facebook"></i>
                    </div>
                </div>
            </div>

            <!-- ================ Order Details List ================= -->
            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Sản Phẩm</h2>
                        <a href="#" class="btn">View All</a>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <td>Tên</td>
                                <td>Gía</td>
                                <td>Thanh toán</td>
                                <td>Trạng thái</td>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Sữa Tươi Cà Phê</td>
                                <td>30.000 VNĐ</td>
                                <td>Tiền Mặt</td>
                                <td><span class="status delivered">Còn !</span></td>
                            </tr>

                            <tr>
                                <td>Cà Phê Phin Sữa Đá</td>
                                <td>35.000 VNĐ</td>
                                <td>Tiền Mặt</td>
                                <td><span class="status pending">Còn !</span></td>
                            </tr>

                            <tr>
                                <td>Cà Phê Phin Đen Đá</td>
                                <td>25.000 VNĐ</td>
                                <td>Tiền Mặt</td>
                                <td><span class="status return">Còn !</span></td>
                            </tr>

                            <tr>
                                <td>Trà Sữa Thái (Xanh)</td>
                                <td>30.000 VNĐ</td>
                                <td>Tiền Mặt</td>
                                <td><span class="status inProgress"> Hết !</span></td>
                            </tr>

                            <tr>
                                <td>Trà Sữa Thái (Đỏ)</td>
                                <td>40.000 VNĐ</td>
                                <td>Tiền Mặt</td>
                                <td><span class="status delivered">Hết !</span></td>
                            </tr>

                            <tr>
                                <td>Milo</td>
                                <td>18.000 VNĐ</td>
                                <td>Tiền Mặt </td>
                                <td><span class="status pending">Hết !</span></td>
                            </tr>

                            <tr>
                                <td>Trà Đào</td>
                                <td>25.000 VNĐ</td>
                                <td>Tiền Mặt</td>
                                <td><span class="status return">Còn !</span></td>
                            </tr>

                            <tr>
                                <td>Cà Phê Phin Đen Đá</td>
                                <td>30.000 VNĐ</td>
                                <td>Tiền Mặt </td>
                                <td><span class="status inProgress">Còn !</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- ================= New Customers ================ -->
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Danh sách cửa hàng</h2>
                    </div>

                    <table>
                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>170 Nguyễn Đổng Chi, Quận Nam Từ Liêm, Hà Nội</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>Số 1 Nguyễn Hoàng, P. Mỹ Đình, Q. Nam Từ Liêm, Hà Nội, Việt Nam</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>28TT4 The Manor, Nam Từ Liêm, Hà Nội Việt Nam</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>SH09 - S1.05 Vinhome Smart City, Nam Từ Liêm, Hà Nội</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K<br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>Vinhomes Westpoint W1, phố Đỗ Đức Dục, P. Mễ Trì, Q. Nam Từ Liêm</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>171 Lương Thế Vinh, Phường Trung Văn, Quận Nam Từ Liêm, Hà Nội, Việt Nam</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br> 
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>15 Dương Khuê, P. Mai Dịch, Quận Cầu Giấy, Hà Nội</span></h4>
                            </td>
                        </tr>

                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZEDpRudUTdhxIrFd2tg04MRWYaZpDFoutvQ&s" alt=""></div>
                            </td>
                            <td>
                                <h4>Circle K <br>
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>177 Xuân Thủy, P. Dịch Vọng Hậu, Q. Cầu Giấy, Hà Nội, Việt Nam</span></h4>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>