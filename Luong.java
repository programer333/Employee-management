package Model;

public class Luong {
    private String stt;
    private String ten;
    private double luongCoBan;
    private int soGioLamViec;
    private double luongPhuCap;
    private double totalSalary;

    public Luong(String stt, String ten, double luongCoBan, int soGioLamViec, double luongPhuCap) {
        this.stt = stt;
        this.ten = ten;
        this.luongCoBan = luongCoBan;
        this.soGioLamViec = soGioLamViec;
        this.luongPhuCap = luongPhuCap;
        this.totalSalary = calculateTotalSalary();
    }

    public String getStt() {
        return stt;
    }

    public String getTen() {
        return ten;
    }

    public double getLuongCoBan() {
        return luongCoBan;
    }

    public int getSoGioLamViec() {
        return soGioLamViec;
    }

    public double getLuongPhuCap() {
        return luongPhuCap;
    }

    public double getTotalSalary() {
        return totalSalary;
    }

    private double calculateTotalSalary() {
        return (luongCoBan * soGioLamViec) + luongPhuCap;
    }
}
