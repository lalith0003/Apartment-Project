package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String DBURL = "jdbc:mysql://127.0.0.1:3306/apartment_system";
    private static final String DBUSER = "root";
    private static final String DBPASS = "12348765";
    public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
	

    public static void loadDriver(String DBDRIVER) {
        try {
            Class.forName(DBDRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading database driver.");
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DBURL, DBUSER, DBPASS);
    }
}
