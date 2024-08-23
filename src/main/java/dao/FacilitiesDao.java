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
