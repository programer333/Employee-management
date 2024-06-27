<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>thongke</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="./asset/css/homestyle.css">
    <link rel="stylesheet" href="./asset/css/Thongke.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
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
                    <a href="">
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
            </ul>
        </div>

        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
                <div class="search">
                    <h2>Thống kê </h2>
                </div>
            </div>

            <!-- =========== Charts ============ -->
            <div class="charts">
                <div class="chart-container">
                    <canvas id="pieChart"></canvas>
                </div>
                <div class="chart-container">
                    <canvas id="barChart"></canvas>
                </div>
                <div class="chart-container">
                    <canvas id="lineChart"></canvas>
                </div>
            </div>
        </div>
    </div>
    <script>
        // Get data from JSP
        const totalSalary = ${totalSalary};
        const totalNhanVien = ${totalNhanVien};
        const totalTaiKhoan = ${totalTaiKhoan};
        const totalQuanli = ${totalQuanli};

        // Pie chart configuration
        const pieCtx = document.getElementById('pieChart').getContext('2d');
        const pieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['Lương', 'Nhân viên', 'Tài khoản', 'Quản Lí'],
                datasets: [{
                    label: 'Số lượng',
                    data: [totalSalary, totalNhanVien, totalTaiKhoan, totalQuanli],
                    backgroundColor: [
                        'rgba(0, 255, 255, 1)',
                        'rgba(0, 255, 0, 1)',
                        'rgba(240, 248, 255, 1)',
                        'rgba(220, 20, 60, 1)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                }
            }
        });

        // Bar chart configuration
        const barCtx = document.getElementById('barChart').getContext('2d');
        const barChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['Tổng Lương', 'Nhân viên', 'Tài khoản', 'Quản Lí'],
                datasets: [{
                    label: 'Số lượng',
                    data: [totalSalary, totalNhanVien, totalTaiKhoan, totalQuanli],
                    backgroundColor: [
                        'rgba(0, 255, 255, 1)',
                        'rgba(0, 255, 0, 1)',
                        'rgba(240, 248, 255, 1)',
                        'rgba(220, 20, 60, 1)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Line chart configuration
        const lineCtx = document.getElementById('lineChart').getContext('2d');
        const lineChart = new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: ['Tổng Lương', 'Nhân viên', 'Tài khoản', 'Quản Lí'],
                datasets: [{
                    label: 'Số lượng',
                    data: [totalSalary, totalNhanVien, totalTaiKhoan, totalQuanli],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script>
    function logout() {
    // Thực hiện các hành động cần thiết để thoát, ví dụ như xóa thông tin đăng nhập
    
    // Hiển thị thông báo thoát thành công
    alert("Bạn đã thoát thành công, vui lòng đăng nhập");
    
    // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chủ
    window.location.href = "http://localhost:9999/QLNHANVIEN/LoginServlet";
}
</script>
</body>

</html>
