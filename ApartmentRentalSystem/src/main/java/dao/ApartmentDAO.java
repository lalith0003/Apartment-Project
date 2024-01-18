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
	                apartment.setFloorNo(resultSet.getInt("floor_no"));
	                apartment.setDoorNo(resultSet.getInt("door_no"));
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
	        }
	
	        return apartments;
	    }
	    
	    public void updateApartment(Apartment apartment) {
	        try (Connection connection = DBUtil.getConnection(); 
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "UPDATE apartment SET floor_no = ?, door_no = ?, advance_cost = ?, rental_cost = ?, bedroom = ?, floor_space = ?, status = ?, notice_period = ? WHERE id = ?")) {

	            preparedStatement.setInt(1, apartment.getFloorNo());
	            preparedStatement.setInt(2, apartment.getDoorNo());
	            preparedStatement.setString(3, apartment.getAdvanceCost());
	            preparedStatement.setString(4, apartment.getRentalCost());
	            preparedStatement.setString(5, apartment.getBedroom());
	            preparedStatement.setString(6, apartment.getFloorSpace());
	            preparedStatement.setString(7, apartment.getStatus());
	            preparedStatement.setString(8, apartment.getNoticePeriod());
	            preparedStatement.setInt(9, apartment.getId());

	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace(); 
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
	                            resultSet.getInt("floor_no"),
	                            resultSet.getInt("door_no"),
	                            resultSet.getString("advance_cost"),
	                            resultSet.getString("rental_cost"),
	                            resultSet.getString("bedroom"),
	                            resultSet.getString("floor_space"),
	                            resultSet.getString("status"),
	                            resultSet.getString("notice_period")
	                           
	                    );
	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return apartment;
	    }
	    
	    public List<Apartment> filterApartments(int floor_no, int door_no, String advanceCost, String rentalCost, String floorSpace, String status, String bedroom, String noticeperiod) {
	        List<Apartment> apartments = new ArrayList<>();

	        try {
	            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM apartment WHERE 1=1 ");

	            if (floor_no != 0) {
	                queryBuilder.append(" AND floor_no = ?");
	            }
	            if (door_no != 0) {
	                queryBuilder.append(" AND door_no = ?");
	            }
	            if (rentalCost != null && !rentalCost.isEmpty()) {
	                queryBuilder.append(" AND rental_cost = ?");
	            }
	            if (advanceCost != null && !advanceCost.isEmpty()) {
	                queryBuilder.append(" AND advance_cost = ?");
	            }
	            if (floorSpace != null && !floorSpace.isEmpty()) {
	                queryBuilder.append(" AND floor_space = ?");
	            }
	            if (status != null && !status.isEmpty()) {
	                queryBuilder.append(" AND status = ?");
	            }
	            if (bedroom != null && !bedroom.isEmpty()) {
	                queryBuilder.append(" AND bedroom = ?");
	            }
	            if (noticeperiod != null && !noticeperiod.isEmpty()) {
	                queryBuilder.append(" AND notice_period = ?");
	            }

	            try (Connection connection = DBUtil.getConnection();
	                 PreparedStatement preparedStatement = connection.prepareStatement(queryBuilder.toString())) {
	                int parameterIndex = 1;

	                if (floor_no != 0) {
	                    preparedStatement.setInt(parameterIndex++, floor_no);
	                }
	                if (door_no != 0) {
	                    preparedStatement.setInt(parameterIndex++, door_no);
	                }
	                if (rentalCost != null && !rentalCost.isEmpty()) {
	                    preparedStatement.setString(parameterIndex++, rentalCost);
	                }
	                if (advanceCost != null && !advanceCost.isEmpty()) {
	                    preparedStatement.setString(parameterIndex++, advanceCost);
	                }
	                if (floorSpace != null && !floorSpace.isEmpty()) {
	                    preparedStatement.setString(parameterIndex++, floorSpace);
	                }
	                if (status != null && !status.isEmpty()) {
	                    preparedStatement.setString(parameterIndex++, status);
	                }
	                if (bedroom != null && !bedroom.isEmpty()) {
	                    preparedStatement.setString(parameterIndex++, bedroom);
	                }
	                if (noticeperiod != null && !noticeperiod.isEmpty()) {
	                    preparedStatement.setString(parameterIndex++, noticeperiod);
	                }

	                try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                    while (resultSet.next()) {
	                        Apartment apartment = new Apartment();
	                        apartment.setId(resultSet.getInt("id"));
	                        apartment.setFloorNo(resultSet.getInt("floor_no"));
	                        apartment.setDoorNo(resultSet.getInt("door_no"));
	                        apartment.setAdvanceCost(resultSet.getString("advance_cost"));
	                        apartment.setRentalCost(resultSet.getString("rental_cost"));
	                        apartment.setFloorSpace(resultSet.getString("floor_space"));
	                        apartment.setStatus(resultSet.getString("status"));
	                        apartment.setBedroom(resultSet.getString("bedroom"));
	                        apartment.setNoticePeriod(resultSet.getString("notice_period"));
	                        apartments.add(apartment);
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return apartments;
	    }

	    public boolean isApartmentExist(int floor_no, int door_no) {
	        boolean exists = false;
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	          
	            connection = DBUtil.getConnection();

	            String query = "SELECT COUNT(*) FROM apartment WHERE floor_no = ? AND door_no = ?";
	            preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, floor_no);
	            preparedStatement.setInt(2, door_no);

	            resultSet = preparedStatement.executeQuery();

	            if (resultSet.next()) {
	                int count = resultSet.getInt(1);
	                exists = (count > 0);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	           
	            try {
	                if (resultSet != null) resultSet.close();
	                if (preparedStatement != null) preparedStatement.close();
	                if (connection != null) connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return exists;
	    }
	    
	    public int getApartmentIdByFloorAndDoor(int floorNo, int doorNo) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            conn = DBUtil.getConnection();

	          
	            String sql = "SELECT id FROM apartment WHERE floor_no = ? AND door_no = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, floorNo);
	            pstmt.setInt(2, doorNo);

	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                
	                return rs.getInt("id");
	            } else {
	                
	                return -1; 
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	           
	        } 

	     
	        return -1; 
	    }
	    public boolean deleteApartmentById(int id) {
	       
	        try (Connection connection = DBUtil.getConnection();) {
	            String sql = "DELETE FROM apartment WHERE id = ?";
	            try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                statement.setInt(1, id);

	                int rowsAffected = statement.executeUpdate();
	                
	                
	                return rowsAffected > 0;
	            }
	        } catch (SQLException e) {
	           
	            e.printStackTrace(); 
	            return false;
	        } 
	    }
	    
	    public static List<Integer> getDistinctFloorNo() {
	        List<Integer> FloorNoValues = new ArrayList<>();

	        try (Connection connection =  DBUtil.getConnection();) {
	            String sql = "SELECT DISTINCT floor_no FROM apartment";
	            try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                try (ResultSet resultSet = statement.executeQuery()) {
	                    while (resultSet.next()) {
	                        int floor_no = resultSet.getInt("floor_no");
	                        FloorNoValues.add(floor_no);
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); 
	        }

	        return FloorNoValues;
	    }
	    public static List<Integer> getDistinctDoorNoValues() {
	        List<Integer> DoorNoValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT door_no FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                	DoorNoValues.add(resultSet.getInt("door_no"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return DoorNoValues;
	    }
	    
	    public static List<String> getDistinctNoticePeriod() {
	        List<String> NoticePeriodValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT notice_period FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                	NoticePeriodValues.add(resultSet.getString("notice_period"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return NoticePeriodValues;
	    }
	    
	    public static List<String> getDistinctAdvanceCostValues() {
	        List<String> AdvanceCostValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT advance_cost FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    AdvanceCostValues.add(resultSet.getString("advance_cost"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return AdvanceCostValues;
	    }

	    public static List<String> getDistinctRentalCostValues() {
	        List<String> rentalCostValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT rental_cost FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    rentalCostValues.add(resultSet.getString("rental_cost"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return rentalCostValues;
	    }

	    public static List<String> getDistinctFloorSpaceValue() {
	        List<String> floorSpaceValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT floor_space FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    floorSpaceValues.add(resultSet.getString("floor_space"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return floorSpaceValues;
	    }

	    public static List<String> getDistinctStatusValue() {
	        List<String> statusValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT status FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    statusValues.add(resultSet.getString("status"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return statusValues;
	    }

	    public static List<String> getDistinctBedroomValue() {
	        List<String> bedroomValues = new ArrayList<>();

	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement("SELECT DISTINCT bedroom FROM apartment")) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    bedroomValues.add(resultSet.getString("bedroom"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return bedroomValues;
	    }
	    
	    public void addApartment(int floor_no, int door_no, String advance_cost, String rental_cost, String bedroom,
	            String floor_space, String status, String notice_period) {
	        try (Connection connection = DBUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(
	                     "INSERT INTO apartment (floor_no, door_no, advance_cost, rental_cost, bedroom, floor_space, status, notice_period) " +
	                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {

	            preparedStatement.setInt(1, floor_no);
	            preparedStatement.setInt(2, door_no);
	            preparedStatement.setString(3, advance_cost);
	            preparedStatement.setString(4, rental_cost);
	            
	            preparedStatement.setString(5, bedroom);
	            preparedStatement.setString(6, floor_space);
	            preparedStatement.setString(7, status);
	            preparedStatement.setString(8, notice_period);

	           
	            preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	           
	        }
	    }
	    public boolean updateApartmentStatus(int floorNo, int doorNo) {
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	           
	            conn = DBUtil.getConnection();

	            
	            String sql = "UPDATE apartment SET status = 'Rented out' WHERE floor_no = ? AND door_no = ?";
	            
	           
	            stmt = conn.prepareStatement(sql);

	            
	            stmt.setInt(1, floorNo);
	            stmt.setInt(2, doorNo);

	           
	            int rowsAffected = stmt.executeUpdate();

	            
	            return rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            
	            return false;
	        } 
	    }

}