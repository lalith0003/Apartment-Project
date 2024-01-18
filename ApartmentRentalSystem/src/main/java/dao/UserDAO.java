package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Usermember;
import Util.DBUtil;

public class UserDAO {
    

    public List<Usermember> getAllUsers() {
        List<Usermember> userList = new ArrayList<>();

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstname = resultSet.getString("firstname");
                String lastname = resultSet.getString("lastname");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String contact = resultSet.getString("contact");

                Usermember user = new Usermember(firstname, lastname, password, email, contact);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public Usermember getUserById(int userId) {
        Usermember user = null;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
        ) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String firstname = resultSet.getString("firstname");
                    String lastname = resultSet.getString("lastname");
                    String password = resultSet.getString("password");
                    String email = resultSet.getString("email");
                    String contact = resultSet.getString("contact");

                    user = new Usermember(firstname, lastname, password, email, contact);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public Usermember getUserByUsername(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

           
            String sql = "SELECT * FROM users WHERE firstname = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);

            rs = pstmt.executeQuery();

           
            if (rs.next()) {
                Usermember user = new Usermember();
                user.setId(rs.getInt("id"));
                user.setFirstname(rs.getString("firstname"));
                user.setContact(rs.getString("contact"));

                
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
            
        } 

        return null; 
    }
    public Usermember getUserByFirstname(String username) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

          
            String sql = "SELECT * FROM users WHERE firstname = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                
                Usermember user = new Usermember();
                user.setId(rs.getInt("id"));
                
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setContact(rs.getString("contact"));
                
                return user;
            } else {
                
                return null; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
           
        } 

       
        return null; 
    }

}