package Dao;

import Model.Luong;
import Utils.MySQLConnectionExample;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LuongDao {
    private Connection conn;
    private PreparedStatement ps;

    public List<Luong> getAllNhanvien() {
        List<Luong> nhanvienList = new ArrayList<>();
        String query = "SELECT * FROM luong";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String stt = rs.getString("Stt");
                String ten = rs.getString("Hoten");
                double luongCoBan = rs.getDouble("luongCoBan");
                int soGioLamViec = rs.getInt("soGioLamViec");
                double luongPhuCap = rs.getDouble("luongPhuCap");
                Luong nhanvien = new Luong(stt, ten, luongCoBan, soGioLamViec, luongPhuCap);
                nhanvienList.add(nhanvien);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return nhanvienList;
    }

    public double getTotalSalary(List<Luong> nhanvienList) {
        double total = 0;
        for (Luong nv : nhanvienList) {
            total += nv.getTotalSalary();
        }
        return total;
    }

     public boolean addLuong(Luong luong) {
        String query = "INSERT INTO luong (Stt, Hoten, luongCoBan, soGioLamViec, luongPhuCap) VALUES (?, ?, ?, ?, ?)";
        try {
            MySQLConnectionExample connectionExample = new MySQLConnectionExample();
            conn = connectionExample.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, luong.getStt());
            ps.setString(2, luong.getTen());
            ps.setDouble(3, luong.getLuongCoBan());
            ps.setInt(4, luong.getSoGioLamViec());
            ps.setDouble(5, luong.getLuongPhuCap());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Insertion successful

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return false; // Insertion failed
    }

    private void closeResources() {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
