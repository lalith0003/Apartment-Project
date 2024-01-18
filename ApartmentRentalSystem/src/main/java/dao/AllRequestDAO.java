package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.AllRequest;
import Util.DBUtil;

public class AllRequestDAO {

	public boolean markRequestAsAccepted(int id) {
        Connection conn = null;
        PreparedStatement preparedStatement = null;

        try {
           
            conn = DBUtil.getConnection();

            
            String sql = "UPDATE allrequest SET status = 'Accepted' WHERE id = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, id);

             preparedStatement.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            
            return false;
        } 
    }
	 public boolean isUserRequestAccepted(int userId) {
	        boolean accepted = false;
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            // Obtain a database connection (implement getConnection() method)
	            connection = DBUtil.getConnection();

	            // Query to check if the user has already submitted a request that was accepted
	            String query = "SELECT COUNT(*) FROM allrequest WHERE id = ? AND status = 'Accepted'";
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, userId);

	            resultSet = preparedStatement.executeQuery();

	            // Check the result
	            if (resultSet.next()) {
	                int count = resultSet.getInt(1);
	                accepted = (count > 0);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Close resources
	            try {
	                if (resultSet != null) resultSet.close();
	                if (preparedStatement != null) preparedStatement.close();
	                if (connection != null) connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return accepted;
	    }
    public boolean submitAllRequest(int apartmentId, int id, String username, String contact, String comment) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();

           
            String sql = "INSERT INTO allrequest (floor_no, door_no, username, contact, comment) "
                    + "VALUES (?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, getFloorNoByApartmentId(apartmentId)); // Assuming you have a method to get floor_no by apartmentId
            pstmt.setInt(2, getDoorNoByApartmentId(apartmentId)); // Assuming you have a method to get door_no by apartmentId
            pstmt.setString(3, username);
            pstmt.setString(4, contact);
            pstmt.setString(5, comment);

            int rowsAffected = pstmt.executeUpdate();

           
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
           
        }


        return false;
    }

    public int getFloorNoByApartmentId(int apartmentId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

           
            String sql = "SELECT floor_no FROM apartment WHERE id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, apartmentId);

            rs = pstmt.executeQuery();

            
            if (rs.next()) {
                return rs.getInt("floor_no");
            }
        } catch (SQLException e) {
            e.printStackTrace();
           
        } 

      
        return 0;
    }

  
    public int getDoorNoByApartmentId(int apartmentId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();

           
            String sql = "SELECT door_no FROM apartment WHERE id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, apartmentId);

            rs = pstmt.executeQuery();

           
            if (rs.next()) {
                return rs.getInt("door_no");
            }
        } catch (SQLException e) {
            e.printStackTrace();
           
        } 

        
        return 0;
    }
	public boolean markRequestAsDenied(int requestId) {
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
       
        conn = DBUtil.getConnection();

        
        String sql = "UPDATE allrequest SET status = 'Denied' WHERE id = ?";
        
       
        stmt = conn.prepareStatement(sql);

       
        stmt.setInt(1, requestId);

       
        int rowsAffected = stmt.executeUpdate();

     
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
       
        return false;
    } 
}


	

	
}