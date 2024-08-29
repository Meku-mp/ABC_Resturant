package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Admin;

public class AdminDao {
	Statement statement;
	PreparedStatement preparedStatement;
	
	public Admin loginAdmin(Admin admin) {
		var dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {

			preparedStatement = connection
					.prepareStatement("SELECT * FROM admin WHERE Username = ? AND Password = ?");
			preparedStatement.setString(1, admin.getUsername());
			preparedStatement.setString(2, admin.getPassword());

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				int userId = resultSet.getInt(1);
				admin.setId(userId);

				// No error
				return admin;
			} else {

				// cannot find the customer
				return null;
			}

		} catch (SQLException ex) {
			Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);

			// exception
			return null;
		}
	}

}
