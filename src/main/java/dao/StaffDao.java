package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Staff;

public class StaffDao {
	Statement statement;
	PreparedStatement preparedStatement;

	public Staff loginStaff(Staff staff) {
		var dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {

			preparedStatement = connection.prepareStatement("SELECT * FROM staff WHERE Username = ? AND Password = ?");
			preparedStatement.setString(1, staff.getUsername());
			preparedStatement.setString(2, staff.getPassword());

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				int userId = resultSet.getInt(1);
				staff.setId(userId);

				// No error
				return staff;
			} else {

				// cannot find the customer
				return null;
			}

		} catch (SQLException ex) {
			Logger.getLogger(StaffDao.class.getName()).log(Level.SEVERE, null, ex);

			// exception
			return null;
		}
	}

	public Staff createStaff(Staff staff) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL InsertStaff (?, ?, ?, ?, ?, ?, ?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setString(1, staff.getName());
			stmt.setString(2, staff.getPosition());
			stmt.setDouble(3, staff.getSalary());
			stmt.setInt(4, staff.getRestaurantId());
			stmt.setString(5, staff.getUsername());
			stmt.setString(6, staff.getPassword());
			stmt.setInt(7, staff.getCreateBy());

			ResultSet rs = stmt.executeQuery();

			return staff;

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}

	}
	
	public Staff updateStaff(Staff staff) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL UpdateStaff (?, ?, ?, ?, ?, ?,?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setInt(1, staff.getId());
			stmt.setString(2, staff.getName());
			stmt.setString(3, staff.getPosition());
			stmt.setDouble(4, staff.getSalary());
			stmt.setInt(5, staff.getRestaurantId());
			stmt.setString(6, staff.getUsername());
			stmt.setString(7, staff.getPassword());

			ResultSet rs = stmt.executeQuery();

			return staff;

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}

	}
	
	public Staff deleteStaff(Staff staff) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL DeleteStaff (?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setInt(1, staff.getId());
			ResultSet rs = stmt.executeQuery();

			return staff;

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}

	}

}
