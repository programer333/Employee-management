<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="./asset/css/style.css">
    <title>Login</title>
</head>
<style>
    .error-message {
        margin-top: 10px;
        padding: 10px;
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
        border-radius: 5px;
        font-size: 14px;
        text-align: center;
    }
</style>
<style>
    .success-message {
   margin-top: 10px;
        padding: 10px;
        background-color: #00FF7F;
        color: #F0F8FF;
        border: 1px solid #f5c6cb;
        border-radius: 5px;
        font-size: 14px;
        text-align: center;
}

</style>

<body>
    <div class="container" id="container">
        <div class="form-container sign-up">
            <form action="RegisterServlet" method="POST">
                <h1>Tạo tài khoản</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span>sử dụng email hoặc số điện thoại</span>
                <input type="text" placeholder="Số điện thoại" name="sodienthoai" value="">
                <input type="password" placeholder="Mật khẩu" name="pass">
                <input type="email" placeholder="Email" name="gmail" value="">
                <button type="submit">Đăng ký</button>

                <%-- Hiển thị thông báo lỗi nếu có --%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>

                <%-- Hiển thị thông báo thành công nếu có --%>
                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="success-message">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
            </form>
        </div>
        <div class="form-container sign-in active">
            <form action="LoginServlet" method="POST">
                <h1>Đăng nhập</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span>hoặc sử dụng mật khẩu email của bạn</span>
                <input type="text" placeholder="Số điện thoại" id="sodienthoai" name="sodienthoai">
                <input type="password" placeholder="Mật khẩu" id="pass" name="pass">
                <a href="#">Quên mật khẩu ?</a>
                <button type="submit">Đăng nhập</button>

                <%-- Hiển thị thông báo lỗi nếu có --%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>

                <%-- Hiển thị thông báo thành công nếu có --%>
                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="success-message">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Chào mừng trở lại!!</h1>
                    <p>Nhập thông tin cá nhân của bạn để sử dụng tất cả các tính năng của phần mềm</p>
                    <button class="hidden" id="login">Quay lại</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Chào bạn!</h1>
                    <p>Đăng ký với thông tin cá nhân của bạn để sử dụng tất cả các tính năng của phần mềm</p>
                    <button class="hidden" id="register">Đăng ký</button>
                </div>
            </div>
        </div>
    

    <script>
        const container = document.getElementById('container');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');

        registerBtn.addEventListener('click', () => {
            container.classList.add("active");
        });

        loginBtn.addEventListener('click', () => {
            container.classList.remove("active");
        });

   </script>
   
</body>
  </html>
  
