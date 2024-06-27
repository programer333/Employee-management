package Dao;

import Model.taiKhoan;
import Utils.MySQLConnectionExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaiKhoanDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public TaiKhoanDao() {
        // Constructor does not need to initialize anything
    }

    // Retrieve all accounts
    public List<taiKhoan> getAllTaiKhoan() {
        List<taiKhoan> taiKhoanList = new ArrayList<>();
        String query = "SELECT * FROM taikhoan;";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                taiKhoan tk = new taiKhoan(
                        rs.getString("Sodienthoai"),
                        rs.getString("pass"),
                        rs.getString("gmail")
                );
                taiKhoanList.add(tk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return taiKhoanList;
    }  

    // Login
    public taiKhoan login(String sodienthai, String pass) {
        String query = "SELECT * FROM taikhoan WHERE sodienthoai = ? AND pass = ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, sodienthai);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new taiKhoan(
                        rs.getString("sodienthoai"),
                        rs.getString("pass"),
                        rs.getString("gmail")
                ); // Return account object if login is successful
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return null; // Return null if login is unsuccessful
    }

    // Register
    public boolean register(String sodienthai, String pass, String gmail) {
        String query = "INSERT INTO taikhoan (sodienthoai, pass, gmail) VALUES (?, ?, ?)";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, sodienthai);
            ps.setString(2, pass);
            ps.setString(3, gmail);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Registration successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Registration failed
    }
     public boolean isGmailExist(String gmail) {
        String query = "SELECT * FROM taikhoan WHERE gmail = ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, gmail);
            rs = ps.executeQuery();

            return rs.next(); // Return true if Gmail exists

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Return false if an error occurs or Gmail does not exist
    }
    public boolean updateTaiKhoan(String sodienthai, String Pass, String Gmail) {
        String query = "UPDATE taikhoan SET pass = ?, gmail = ? WHERE sodienthoai  = ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Pass);
            ps.setString(2, Gmail);
            ps.setString(3, sodienthai);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Update successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Update failed
    }

    // Delete account
    public boolean deleteTaiKhoan(String sodienthai) {
        String query = "DELETE FROM taikhoan WHERE sodienthoai = ?";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, sodienthai);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Deletion successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Deletion failed
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

    public taiKhoan getTaiKhoanBySodienthaiAndPass(String sodienthai, String Pass) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
