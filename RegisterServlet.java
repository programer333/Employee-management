package Controller;

import Dao.TaiKhoanDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "register", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String sodienthoai = request.getParameter("sodienthoai");
        String pass = request.getParameter("pass");
        String gmail = request.getParameter("gmail");

        if (sodienthoai == null || sodienthoai.trim().isEmpty() ||
            pass == null || pass.trim().isEmpty() ||
            gmail == null || gmail.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Số điện thoại, mật khẩu và email không được để trống.");
            request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
            return;
        }

        if (!isValidPassword(pass)) {
            request.setAttribute("errorMessage", "Mật khẩu phải có ít nhất 5 chữ số và ít nhất một ký tự đặc biệt.");
            request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
            return;
        }

        if (!gmail.contains("@")) {
            request.setAttribute("errorMessage", "Email phải có kí tự @.");
            request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
            return;
        }

        TaiKhoanDao taiKhoanDao = new TaiKhoanDao();
        if (taiKhoanDao.isGmailExist(gmail)) {
            request.setAttribute("errorMessage", "Email đã tồn tại.");
            request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
            return;
        }
        boolean registered = taiKhoanDao.register(sodienthoai, pass, gmail);

        if (registered) {
            request.setAttribute("successMessage", "Đăng ký thành công!.");
            request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Đăng ký không thành công. Vui lòng thử lại.");
            request.getRequestDispatcher("/View/Login.jsp").forward(request, response);
        }
    }

    private boolean isValidPassword(String pass) {
        int digitCount = 0;
        boolean hasSpecialChar = false;

        for (char c : pass.toCharArray()) {
            if (Character.isDigit(c)) {
                digitCount++;
            } else if (!Character.isLetterOrDigit(c)) {
                hasSpecialChar = true;
            }
        }

        return digitCount > 5 && hasSpecialChar;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register Servlet";
    }
}
