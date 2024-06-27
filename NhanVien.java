
package Model;

import java.util.Date;

public class NhanVien {
    private int Mnv;
    private String HoTen;
    private String Diachi;
    private Date ngaysinh;
    private int Sdt;
    private String Chucvu;

    public int getMnv() {
        return Mnv;
    }

    public String getHoTen() {
        return HoTen;
    }

    public String getDiachi() {
        return Diachi;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public int getSdt() {
        return Sdt;
    }

    public String getChucvu() {
        return Chucvu;
    }

    public NhanVien(int Mnv, String HoTen, String Diachi, Date ngaysinh, int Sdt, String Chucvu) {
        this.Mnv = Mnv;
        this.HoTen = HoTen;
        this.Diachi = Diachi;
        this.ngaysinh = ngaysinh;
        this.Sdt = Sdt;
        this.Chucvu = Chucvu;
    }
}
