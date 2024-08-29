package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.DbConnection;
import model.Food;

public class FoodDao {
	Statement statement;
	PreparedStatement preparedStatement;

	public Food insertFood(Food food) {
		DbConnection dbCon = new DbConnection();
		Connection connection = dbCon.getConnection();

		String insertFoodQuery = "INSERT INTO foods (Name, Description, Price, RestaurantId, ImagePath) VALUES (?, ?, ?, ?, ?)";

		try {
			preparedStatement = connection.prepareStatement(insertFoodQuery, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, food.getName());
			preparedStatement.setString(2, food.getDescription());
			preparedStatement.setDouble(3, food.getPrice());
			preparedStatement.setInt(4, food.getRestaurantId());
			preparedStatement.setString(5, food.getImagePath());

			preparedStatement.executeUpdate();

			return food;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

	}

	public boolean deleteFood(int foodId) {
		DbConnection dbCon = new DbConnection();
		Connection connection = dbCon.getConnection();

		String deleteFoodQuery = "DELETE FROM foods WHERE Id = ?";

		try {
			preparedStatement = connection.prepareStatement(deleteFoodQuery);
			preparedStatement.setInt(1, foodId);

			int rowsAffected = preparedStatement.executeUpdate();

			return rowsAffected > 0; // Return true if at least one row was deleted

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}

	public boolean updateFood(Food food) {
		DbConnection dbCon = new DbConnection();
		Connection connection = dbCon.getConnection();

		String updateFoodQuery = "UPDATE foods SET Name = ?, Description = ?, Price = ?, RestaurantId = ?, ImagePath = ? WHERE Id = ?";

		try {
			preparedStatement = connection.prepareStatement(updateFoodQuery);
			preparedStatement.setString(1, food.getName());
			preparedStatement.setString(2, food.getDescription());
			preparedStatement.setDouble(3, food.getPrice());
			preparedStatement.setInt(4, food.getRestaurantId());
			preparedStatement.setString(5, food.getImagePath());
			preparedStatement.setInt(6, food.getId());

			int rowsAffected = preparedStatement.executeUpdate();

			return rowsAffected > 0; // Return true if at least one row was updated

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
	}
}
