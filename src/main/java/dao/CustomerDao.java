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
import model.Customer;

public class CustomerDao {

	Statement statement;
	PreparedStatement preparedStatement;

	public Customer insertCustomer(Customer customer) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL AddCustomer (?, ?, ?, ?, ?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setString(1, customer.getFullName());
			stmt.setString(2, customer.getEmail());
			stmt.setString(3, customer.getPhone());
			stmt.setString(4, customer.getUsername());
			stmt.setString(5, customer.getPassword());

			int rowsAffected = stmt.executeUpdate();

			if (rowsAffected > 0) {
				ResultSet generatedKeys = stmt.getGeneratedKeys();
				if (generatedKeys.next()) {
					int generatedId = generatedKeys.getInt(1);
					customer.setId(generatedId);
				}
				return customer;
			} else {
				return null;
			}

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
	}

	public Customer loginCustomer(Customer customer) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {

			preparedStatement = connection
					.prepareStatement("SELECT * FROM customers WHERE Username = ? AND Password = ?");
			preparedStatement.setString(1, customer.getUsername());
			preparedStatement.setString(2, customer.getPassword());

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				int userId = resultSet.getInt(1);
				customer.setId(userId);

				// No error
				return customer;
			} else {

				// cannot find the customer
				return null;
			}

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);

			// exception
			return null;
		}
	}

	public Customer updateCustomer(Customer customer) {
		DbConnection dbCon = new DbConnection();
		Connection connection = dbCon.getConnection();

		try {
			String query = "{CALL UpdateCustomer (?, ?, ?, ?, ?, ?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setInt(1, customer.getId());
			stmt.setString(2, customer.getFullName());
			stmt.setString(3, customer.getEmail());
			stmt.setString(4, customer.getPhone());
			stmt.setString(5, customer.getUsername());
			stmt.setString(6, customer.getPassword());

			int rowsAffected = stmt.executeUpdate();

			// If the update is successful, return the updated customer object
			if (rowsAffected > 0) {
				return customer;
			} else {
				// If no rows were affected, return null (indicating the update failed)
				return null;
			}

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
	}

}
