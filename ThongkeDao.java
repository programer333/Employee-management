package Dao;

import Utils.MySQLConnectionExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ThongkeDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ThongkeDao() {
        // Constructor does not need to initialize anything
    }

    // Calculate total salary
    public double getTotalSalary() {
        String query = "SELECT * FROM luong";
        double totalSalary = 0;
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                double luongCoBan = rs.getDouble("luongCoBan");
                int soGioLamViec = rs.getInt("soGioLamViec");
                double luongPhuCap = rs.getDouble("luongPhuCap");
                totalSalary += (luongCoBan * soGioLamViec) + luongPhuCap;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return totalSalary;
    }

    // Count the number of employees
    public int countNhanVien() {
        String query = "SELECT COUNT(DISTINCT Mnv) AS total FROM nhanvien";
        int totalNhanVien = 0;
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalNhanVien = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return totalNhanVien;
    }
    public int Quanli() {
    String query = "SELECT COUNT(*) AS total FROM nhanvien WHERE Chucvu = ?";
    int totalNhanVien = 0;
    try {
        MySQLConnectionExample connectionExample = new MySQLConnectionExample();
        conn = connectionExample.getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, "Quản Lí");
        rs = ps.executeQuery();

        if (rs.next()) {
            totalNhanVien = rs.getInt("total");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        closeResources();
    }
    return totalNhanVien;
}

    // Count the number of accounts
    public int countTaiKhoan() {
        String query = "SELECT COUNT(DISTINCT gmail) AS total FROM taikhoan";
        int totalTaiKhoan = 0;
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalTaiKhoan = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return totalTaiKhoan;
    }

    // Close resources
    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
