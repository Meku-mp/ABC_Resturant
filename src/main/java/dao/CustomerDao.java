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

	public int insertCustomer(Customer customer) {
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

			ResultSet rs = stmt.executeQuery();

			return 0;

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return 1;

		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("Hello whotto");

	}

}
