package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Util.DBUtil;
import model.Usermember;

public class RegisterDAO {
	
	 public String register(Usermember user) {
	        Connection con = null;
	        String result = "You are Registered";

	        try {
	            con = DBUtil.getConnection();

	            String sql = "insert into users(firstname, lastname, password, email, contact) values(?,?,?,?,?)";

	            try (PreparedStatement ps = con.prepareStatement(sql)) {
	                ps.setString(1, user.getFirstname());
	                ps.setString(2, user.getLastname());
	                ps.setString(3, user.getPassword());
	                ps.setString(4, user.getEmail());
	                ps.setString(5, user.getContact());
	                ps.executeUpdate();
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            result = "Data not entered";
	        } finally {
	            try {
	                if (con != null) {
	                    con.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return result;
	    }
	
}
