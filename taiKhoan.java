package Model;

public class taiKhoan {
    private String sodienthai;
    private String pass;
    private String gmail;

    // Constructor
    public taiKhoan(String sodienthai, String pass, String gmail) {
        this.sodienthai = sodienthai;
        this.pass = pass;
        this.gmail = gmail;
    }

    // Getters
    public String getSodienthai() {
        return sodienthai;
    }

    public String getPass() {
        return pass;
    }

    public String getGmail() {
        return gmail;
    }

    // Setters (if you need to modify these fields later)
    public void setSodienthai(String sodienthai) {
        this.sodienthai = sodienthai;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    @Override
    public String toString() {
        return "taiKhoan{" +
                "sodienthai='" + sodienthai + '\'' +
                ", pass='" + pass + '\'' +
                ", gmail='" + gmail + '\'' +
                '}';
    }
}
