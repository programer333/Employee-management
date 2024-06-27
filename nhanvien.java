package Controller;

import Dao.NhanvienDao;
import Model.NhanVien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "nhanvien", urlPatterns = {"/nhanvien"})
public class nhanvien extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        NhanvienDao nhanvienDao = new NhanvienDao();
        HttpSession session = request.getSession();

        if (action == null || action.equals("list")) {
            List<NhanVien> nhanvienList = nhanvienDao.getAllNhanvien();
            request.setAttribute("nhanvienList", nhanvienList);
            request.getRequestDispatcher("/View/nhanvien.jsp").forward(request, response);
        } else if (action.equals("add")) {
            String HoTen = request.getParameter("HoTen");
            String Diachi = request.getParameter("Diachi");
            String ngaysinhStr = request.getParameter("ngaysinh");
            String SdtStr = request.getParameter("Sdt");
            String Chucvu = request.getParameter("Chucvu");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                java.util.Date ngaysinh = sdf.parse(ngaysinhStr);
                int Sdt = Integer.parseInt(SdtStr);
                NhanVien nv = new NhanVien(0, HoTen, Diachi, ngaysinh, Sdt, Chucvu);
                boolean isAdded = nhanvienDao.addNhanvien(nv);

                if (isAdded) {
                    session.setAttribute("message", "Đã thêm nhân viên thành công.");
                } else {
                    session.setAttribute("message", "Thêm nhân viên không thành công.");
                }
            } catch (ParseException | NumberFormatException e) {
                session.setAttribute("message", "Dữ liệu không hợp lệ.");
            }

            response.sendRedirect("nhanvien?action=list");
        } else if (action.equals("update")) {
            String MnvStr = request.getParameter("Mnv");
            String HoTen = request.getParameter("HoTen");
            String Diachi = request.getParameter("Diachi");
            String ngaysinhStr = request.getParameter("ngaysinh");
            String SdtStr = request.getParameter("Sdt");
            String Chucvu = request.getParameter("Chucvu");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                int Mnv = Integer.parseInt(MnvStr);
                java.util.Date ngaysinh = sdf.parse(ngaysinhStr);
                int Sdt = Integer.parseInt(SdtStr);
                NhanVien nv = new NhanVien(Mnv, HoTen, Diachi, ngaysinh, Sdt, Chucvu);
                boolean isUpdated = nhanvienDao.updateNhanvien(nv);

                if (isUpdated) {
                    session.setAttribute("message", "Đã cập nhật nhân viên thành công.");
                } else {
                    session.setAttribute("message", "Cập nhật nhân viên không thành công.");
                }
            } catch (ParseException | NumberFormatException e) {
                session.setAttribute("message", "Dữ liệu không hợp lệ.");
            }

            response.sendRedirect("nhanvien?action=list");
        } else if (action.equals("delete")) {
            String MnvStr = request.getParameter("Mnv");
            try {
                int Mnv = Integer.parseInt(MnvStr);
                boolean isDeleted = nhanvienDao.deleteNhanvien(Mnv);

                if (isDeleted) {
                    session.setAttribute("message", "Đã xóa nhân viên thành công.");
                } else {
                    session.setAttribute("message", "Xóa nhân viên không thành công.");
                }
            } catch (NumberFormatException e) {
                session.setAttribute("message", "Dữ liệu không hợp lệ.");
            }

            response.sendRedirect("nhanvien?action=list");
        } else if (action.equals("search")) {
            String searchTerm = request.getParameter("searchTerm");
            List<NhanVien> nhanvienList = nhanvienDao.searchNhanvien(searchTerm);
            request.setAttribute("nhanvienList", nhanvienList);
            request.getRequestDispatcher("/View/nhanvien.jsp").forward(request, response);
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
        return "Servlet xử lý các thao tác CRUD cho nhân viên";
    }
}
