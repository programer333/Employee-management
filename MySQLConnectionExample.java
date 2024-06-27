package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnectionExample {
    private static final String URL = "jdbc:mysql://localhost:3306/qlnv1";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "admin";

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Unable to connect to database.");
        }
    }
}
