package Controller;

import Dao.TaiKhoanDao;
import Model.taiKhoan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "taikhoan", urlPatterns = {"/taikhoan"})
public class taikhoan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        TaiKhoanDao taiKhoanDao = new TaiKhoanDao();
        HttpSession session = request.getSession();

        if (action == null || action.equals("list")) {
            // Get list of taiKhoan from the database
            List<taiKhoan> taiKhoanList = taiKhoanDao.getAllTaiKhoan();

            // Set the list in the request scope
            request.setAttribute("taiKhoanList", taiKhoanList);

            // Forward the request to the JSP page
            request.getRequestDispatcher("/View/taikhoan.jsp").forward(request, response);

        } else if (action.equals("delete")) {
            String sodienthai = request.getParameter("sodienthai");
            boolean isDeleted = taiKhoanDao.deleteTaiKhoan(sodienthai);

            if (isDeleted) {
                session.setAttribute("message", "Đã xóa tài khoản thành công.");
            } else {
                session.setAttribute("message", "xóa tài khoản không thành công.");
            }

            // Redirect to list
            response.sendRedirect("taikhoan?action=list");

        } else if (action.equals("update")) {
            String sodienthai = request.getParameter("sodienthai");
            String Pass = request.getParameter("Pass");
            String Gmail = request.getParameter("Gmail");

            // Server-side validation
            if (Pass.length() < 6) {
                session.setAttribute("message", "Mật khẩu phải có ít nhất 5 số và 1 ký tự.");
            } else if (!Gmail.contains("@")) {
                session.setAttribute("message", "Email phải chứa ký tự @.");
            } else {
                boolean isUpdated = taiKhoanDao.updateTaiKhoan(sodienthai, Pass, Gmail);

                if (isUpdated) {
                    session.setAttribute("message", "Đã cập nhật tài khoản thành công.");
                } else {
                    session.setAttribute("message", "cập nhật tài khoản không thành công.");
                }
            }

            // Redirect to list
            response.sendRedirect("taikhoan?action=list");
        }
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
        return "Short description";
    }
}
