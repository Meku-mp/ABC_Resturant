package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Restaurant;
import model.Staff;

public class RestaurantDao {
	Statement statement;
	PreparedStatement preparedStatement;

	public Restaurant createRestaurant(Restaurant restaurant) {
		var dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL InsertRestaurant (?, ?, ?, ?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setString(1, restaurant.getName());
			stmt.setString(2, restaurant.getLocation());
			stmt.setDouble(3, restaurant.getRate());
			stmt.setInt(4, restaurant.getCreateBy());

			ResultSet rs = stmt.executeQuery();

			return restaurant;

		} catch (SQLException ex) {
			Logger.getLogger(RestaurantDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
	}

	public Restaurant updateRestaurant(Restaurant restaurant) {
		var dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "UPDATE restaurants SET Name = ?, Location = ?, Rate = ? WHERE Id = ?";
			PreparedStatement stmt = connection.prepareStatement(query);

			stmt.setString(1, restaurant.getName());
			stmt.setString(2, restaurant.getLocation());
			stmt.setDouble(3, restaurant.getRate());
			stmt.setInt(4, restaurant.getId()); // Assuming Restaurant has an 'id' property to identify the record

			stmt.executeUpdate();

			return restaurant; // Successfully updated

		} catch (SQLException ex) {
			Logger.getLogger(RestaurantDao.class.getName()).log(Level.SEVERE, null, ex);
			return null; // Error occurred
		}
	}
	
	public Restaurant deleteRestaurant(Restaurant restaurant) {
	    DbConnection dBConnection = new DbConnection();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = dBConnection.getConnection();
	        preparedStatement = connection.prepareStatement("DELETE FROM Restaurants WHERE Id = ?");
	        preparedStatement.setInt(1, restaurant.getId());

	        int rowsAffected = preparedStatement.executeUpdate();
	        if (rowsAffected > 0) {
	            // Record deleted successfully
	            return restaurant;
	        } else {
	            // No record found to delete
	            return null;
	        }

	    } catch (SQLException ex) {
	        Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
	        return null;
	    } finally {
	        // Close resources
	        try {
	            if (preparedStatement != null) preparedStatement.close();
	            if (connection != null) connection.close();
	        } catch (SQLException ex) {
	            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }
	}


}
