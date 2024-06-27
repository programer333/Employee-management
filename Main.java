
package Utils;
import Utils.MySQLConnectionExample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {

    public static void main(String[] args) {
        MySQLConnectionExample connectionExample = new MySQLConnectionExample();

        try (Connection conn = connectionExample.getConnection()) {
            if (conn != null) {
                System.out.println("kết nối thành công.");
            } else {
                System.out.println("kết nối không thành công vui lòng thử lại.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


