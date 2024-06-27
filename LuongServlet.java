package Controller;

import Dao.LuongDao;
import Model.Luong;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LuongServlet", urlPatterns = {"/LuongServlet"})
public class LuongServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Create an instance of LuongDao
        LuongDao luongDao = new LuongDao();

        // Get the list of all employees
        List<Luong> nhanvienList = luongDao.getAllNhanvien();

        // Calculate the total salary for all employees
        double totalSalary = luongDao.getTotalSalary(nhanvienList);

        // Set attributes to pass to the JSP page
        request.setAttribute("nhanvienList", nhanvienList);
        request.setAttribute("totalSalary", totalSalary);

        // Forward to the JSP page
        request.getRequestDispatcher("./View/Luong.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the request is for adding a new employee
        String action = request.getParameter("action");
        
        if ("addNhanvien".equals(action)) {
            // Retrieve parameters from the request
            String stt = request.getParameter("stt");
            String ten = request.getParameter("ten");
            double luongCoBan = Double.parseDouble(request.getParameter("luongCoBan"));
            int soNgayLam = Integer.parseInt(request.getParameter("soNgayLam"));
            double luongPhuCap = Double.parseDouble(request.getParameter("luongPhuCap"));

            // Create a new employee object
            Luong newNhanvien = new Luong(stt, ten, luongCoBan, soNgayLam, luongPhuCap);

            // Create an instance of LuongDao and add the new employee
            LuongDao luongDao = new LuongDao();
            boolean success = luongDao.addLuong(newNhanvien);

            // Set a message attribute to notify the result of the operation
            if (success) {
                request.setAttribute("message", "Nhân viên đã được thêm thành công!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Thêm nhân viên thất bại!");
                request.setAttribute("messageType", "error");
            }

            // Reuse the doGet method to refresh the data and show the updated list
            doGet(request, response);
        } else {
            // Handle salary calculation
            double baseSalary = Double.parseDouble(request.getParameter("baseSalary"));
            double bonus = Double.parseDouble(request.getParameter("bonus"));
            double deductions = Double.parseDouble(request.getParameter("deductions"));

            // Calculate the final salary
            double calculatedSalary = (baseSalary * bonus) + deductions;

            // Set the calculated salary attribute
            request.setAttribute("calculatedSalary", calculatedSalary);

            // Reuse the doGet method to refresh the data and show the calculated salary
            doGet(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "LuongServlet handles salary calculations and displays employee salary information.";
    }
}
