package Dao;

import Model.NhanVien;
import Utils.MySQLConnectionExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NhanvienDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public NhanvienDao() {
        // Constructor does not need to initialize anything
    }

    // Retrieve all employees
    public List<NhanVien> getAllNhanvien() {
        List<NhanVien> nhanvienList = new ArrayList<>();
        String query = "SELECT * FROM nhanvien;";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                NhanVien nv = new NhanVien(
                        rs.getInt("Mnv"),
                        rs.getString("HoTen"),
                        rs.getString("Diachi"),
                        rs.getDate("ngaysinh"),
                        rs.getInt("Sdt"),
                        rs.getString("Chucvu")
                );
                nhanvienList.add(nv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return nhanvienList;
    }

    // Add a new employee
    public boolean addNhanvien(NhanVien nv) {
        String query = "INSERT INTO nhanvien (HoTen, Diachi, ngaysinh, Sdt, Chucvu) VALUES (?, ?, ?, ?, ?)";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, nv.getHoTen());
            ps.setString(2, nv.getDiachi());
            ps.setDate(3, new java.sql.Date(nv.getNgaysinh().getTime()));
            ps.setInt(4, nv.getSdt());
            ps.setString(5, nv.getChucvu());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Insertion successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Insertion failed
    }

    // Update an existing employee
    public boolean updateNhanvien(NhanVien nv) {
        String query = "UPDATE nhanvien SET HoTen = ?, Diachi = ?, ngaysinh = ?, Sdt = ?, Chucvu = ? WHERE Mnv = ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, nv.getHoTen());
            ps.setString(2, nv.getDiachi());
            ps.setDate(3, new java.sql.Date(nv.getNgaysinh().getTime()));
            ps.setInt(4, nv.getSdt());
            ps.setString(5, nv.getChucvu());
            ps.setInt(6, nv.getMnv());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Update successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Update failed
    }

    // Delete an employee
    public boolean deleteNhanvien(int Mnv) {
        String query = "DELETE FROM nhanvien WHERE Mnv = ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, Mnv);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Deletion successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Deletion failed
    }

    // Search employees by name
    public List<NhanVien> searchNhanvien(String name) {
        List<NhanVien> nhanvienList = new ArrayList<>();
        String query = "SELECT * FROM nhanvien WHERE Diachi LIKE ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                NhanVien nv = new NhanVien(
                        rs.getInt("Mnv"),
                        rs.getString("HoTen"),
                        rs.getString("Diachi"),
                        rs.getDate("ngaysinh"),
                        rs.getInt("Sdt"),
                        rs.getString("Chucvu")
                );
                nhanvienList.add(nv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return nhanvienList;
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
