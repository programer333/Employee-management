package Controller;

import Dao.TaiKhoanDao;
import Model.taiKhoan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login", urlPatterns = {"/LoginServlet"})
public class Login extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    // Lấy thông tin người dùng từ request
    String Sodienthai = request.getParameter("sodienthoai");
    String Pass = request.getParameter("pass");

    // Kiểm tra xem Số điện thoại và Mật khẩu có được nhập vào không
    if (Sodienthai == null || Sodienthai.trim().isEmpty() || Pass == null || Pass.trim().isEmpty()) {
        // Nếu Số điện thoại hoặc Mật khẩu trống, chuyển hướng về trang Login.jsp với thông báo lỗi
        request.setAttribute("errorMessage", "Số điện thoại và Mật khẩu không được để trống.");
        request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
        return; // Kết thúc xử lý request
    }

    // Gọi đến lớp DAO để kiểm tra đăng nhập
    TaiKhoanDao taiKhoanDao = new TaiKhoanDao();
    taiKhoan tk = taiKhoanDao.login(Sodienthai, Pass);

    // Kiểm tra kết quả đăng nhập và chuyển hướng tới trang home.jsp nếu thành công
    if (tk != null) {
    // Đăng nhập thành công
    request.getSession().setAttribute("user", tk);
     request.setAttribute("successMessage", "Đăng nhập thành công.");// Lưu thông tin người dùng vào session
    request.getRequestDispatcher("./View/Home.jsp").forward(request, response); // Chuyển hướng tới trang home.jsp
} else {
    // Đăng nhập không thành công
    request.setAttribute("errorMessage", "Số điện thoại hoặc mật khẩu không đúng. Vui lòng thử lại."); // Gửi thông báo lỗi
    request.getRequestDispatcher("./View/Login.jsp").forward(request, response); // Chuyển hướng về trang Login.jsp để nhập lại
}

}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
