package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Facility;

public class FacilitiesDao {

	Statement statement;
	PreparedStatement preparedStatement;

	public Facility createFacility(Facility facility) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL AddFacility (?, ?, ?, ?, ?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setString(1, facility.getName());
			stmt.setString(2, facility.getDescription());
			stmt.setInt(3, facility.getRestaurantId());
			stmt.setString(4, facility.getImagePath());
			stmt.setInt(5, facility.getCreateBy());

			ResultSet rs = stmt.executeQuery();

			return facility;

		} catch (SQLException ex) {
			Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;

		}
	}

	public boolean updateFacility(Facility facility) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "UPDATE facilities SET Name = ?, Description = ?, RestaurantId = ?, ImagePath = ?, CreateBy = ? WHERE Id = ?";
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setString(1, facility.getName());
			preparedStatement.setString(2, facility.getDescription());
			preparedStatement.setInt(3, facility.getRestaurantId());
			preparedStatement.setString(4, facility.getImagePath());
			preparedStatement.setInt(5, facility.getCreateBy());
			preparedStatement.setInt(6, facility.getId());

			preparedStatement.executeUpdate();

			return true;

		} catch (SQLException ex) {
			Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}

	public boolean deleteFacility(int facilityId) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "DELETE FROM facilities WHERE Id = ?";
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setInt(1, facilityId);

			int rowsAffected = preparedStatement.executeUpdate();

			return rowsAffected > 0;

		} catch (SQLException ex) {
			Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}

	public List<Facility> getAllFacilitiesByName(String name) {
		List<Facility> facilities = new ArrayList<>();
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL GetFacilitiesByName(?)}";
			CallableStatement stmt = connection.prepareCall(query);
			stmt.setString(1, name);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Facility facility = new Facility();
				facility.setId(rs.getInt("Id"));
				facility.setName(rs.getString("Name"));
				facility.setDescription(rs.getString("Description"));
				facility.setRestaurantId(rs.getInt("RestaurantId"));
				facility.setImagePath("ImagePath");
				facility.setCreateBy(rs.getInt("CreateBy"));
				facility.setCreateDate(rs.getTimestamp("CreateDate").toLocalDateTime());

				facilities.add(facility);
			}

		} catch (SQLException ex) {
			Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				Logger.getLogger(FacilitiesDao.class.getName()).log(Level.SEVERE, null, e);
			}
		}

		return facilities;
	}

}
