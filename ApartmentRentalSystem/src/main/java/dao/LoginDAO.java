package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBUtil;
import model.LoginBean;

public class LoginDAO {

    public String validate(LoginBean loginBean) {
        DBUtil.loadDriver(DBUtil.DBDRIVER);
        Connection con = null;
        String role = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT role FROM users WHERE (firstname = ? OR email = ?) AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, loginBean.getFirstname());
            ps.setString(2, loginBean.getFirstname());
            ps.setString(3, loginBean.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
               
                role = rs.getString("role");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return role;
    }
}
