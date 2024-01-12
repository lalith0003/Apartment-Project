package dao;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.DBUtil;
import model.LoginBean;



public class LoginDAO {
//	
//	private String dbUrl = "jdbc:mysql://localhost:3306/apartment";
//	private String dbUname = "root";
//	private String dbpassword = "lalithroot";
//	private String dbDriver = "com.mysql.cj.jdbc.Driver";
//	
//	public void loadDriver(String dbDriver) {
//		try {
//			Class.forName(dbDriver);
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//	}
//	public Connection getConnection() {
//		Connection con = null;
//		try {
//			con =  DriverManager.getConnection(dbUrl,dbUname,dbpassword);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return con;
//	}
//	
	public boolean validate(LoginBean loginBean) {
		DBUtil.loadDriver(DBUtil.DBDRIVER);
		Connection con = null;
		try {
			con = DBUtil.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		boolean status = false;
		String sql = "select firstname from users where firstname = ? and password = ?";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, loginBean.getFirstname());
			ps.setString(2, loginBean.getPassword());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
}