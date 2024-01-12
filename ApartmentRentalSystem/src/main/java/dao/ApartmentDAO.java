package dao;
	
	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.ArrayList;
	import java.util.List;
	
	import model.Apartment;
	import Util.DBUtil;
	
	public class ApartmentDAO {
	    public List<Apartment> getAllApartments() {
	        List<Apartment> apartments = new ArrayList<>();
	        Connection connection = null;
	        Statement statement = null;
	        ResultSet resultSet = null;
	
	        try {
	            connection = DBUtil.getConnection();
	            statement = connection.createStatement();
	            resultSet = statement.executeQuery("SELECT * FROM apartment");
	
	            while (resultSet.next()) {
	                Apartment apartment = new Apartment();
	                apartment.setId(resultSet.getInt("id"));
	                apartment.setFloorNo(resultSet.getString("floor_no"));
	                apartment.setDoorNo(resultSet.getString("door_no"));
	                apartment.setAdvanceCost(resultSet.getString("advance_cost"));
	                apartment.setRentalCost(resultSet.getString("rental_cost"));
	                apartment.setBedroom(resultSet.getString("bedroom"));
	                apartment.setFloorSpace(resultSet.getString("floor_space"));
	                apartment.setStatus(resultSet.getString("status"));
	                apartment.setNoticePeriod(resultSet.getString("notice_period"));
	
	                apartments.add(apartment);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Close resources (if applicable)
	        }
	
	        return apartments;
	    }
	    
	    public void updateApartment(Apartment apartment) {
	        try (Connection connection = DBUtil.getConnection(); 
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "UPDATE apartment SET floor_no = ?, door_no = ?, advance_cost = ?, rental_cost = ?, bedroom = ?, floor_space = ?, status = ?, notice_period = ? WHERE id = ?")) {

	            preparedStatement.setString(1, apartment.getFloorNo());
	            preparedStatement.setString(2, apartment.getDoorNo());
	            preparedStatement.setString(3, apartment.getAdvanceCost());
	            preparedStatement.setString(4, apartment.getRentalCost());
	            preparedStatement.setString(5, apartment.getBedroom());
	            preparedStatement.setString(6, apartment.getFloorSpace());
	            preparedStatement.setString(7, apartment.getStatus());
	            preparedStatement.setString(8, apartment.getNoticePeriod());
	            preparedStatement.setInt(9, apartment.getId());

	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle the exception appropriately (log it, throw it, etc.)
	        }
	    }

	    public Apartment getApartmentById(int id) {
	        Apartment apartment = null;

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM apartment WHERE id = ?")) {

	            preparedStatement.setInt(1, id);

	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    apartment = new Apartment(
	                            resultSet.getInt("id"),
	                            resultSet.getString("floor_no"),
	                            resultSet.getString("door_no"),
	                            resultSet.getString("advance_cost"),
	                            resultSet.getString("rental_cost"),
	                            resultSet.getString("bedroom"),
	                            resultSet.getString("floor_space"),
	                            resultSet.getString("status"),
	                            resultSet.getString("notice_period")
	                            // Add other fields as needed
	                    );
	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle the exception appropriately (log it, throw it, etc.)
	        }

	        return apartment;
	    }
	}