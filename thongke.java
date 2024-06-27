package Controller;

import Dao.ThongkeDao;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hathu
 */
@WebServlet(name = "thongke", urlPatterns = {"/thongke"})
public class thongke extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch data from the database
        ThongkeDao thongkeDao = new ThongkeDao();
        double totalSalary = thongkeDao.getTotalSalary();
        int totalNhanVien = thongkeDao.countNhanVien();
        int totalTaiKhoan = thongkeDao.countTaiKhoan();
        int totalQuanli = thongkeDao.Quanli();  

        // Set attributes to be forwarded to the JSP
        request.setAttribute("totalSalary", totalSalary);
        request.setAttribute("totalNhanVien", totalNhanVien);
        request.setAttribute("totalTaiKhoan", totalTaiKhoan);
         request.setAttribute("totalQuanli", totalQuanli); 

        // Forward to JSP
        request.getRequestDispatcher("./View/thongke.jsp").forward(request, response);
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
        return "Thongke Servlet";
    }
}
