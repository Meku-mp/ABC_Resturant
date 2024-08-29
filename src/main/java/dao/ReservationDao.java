package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Reservation;

public class ReservationDao {
	Statement statement;
	PreparedStatement preparedStatement;

	public Reservation createReservation(Reservation reservation) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "{CALL InsertReservation (?, ?, ?, ?, ?, ?, ?)}";
			CallableStatement stmt = connection.prepareCall(query);

			stmt.setDate(1, new java.sql.Date(reservation.getReservationDate().getTime()));
			stmt.setInt(2, reservation.getNumberOfGuests());
			stmt.setInt(3, reservation.getCustomerId());
			stmt.setInt(4, reservation.getRestaurantId());
			stmt.setInt(5, reservation.getType());
			stmt.setDouble(6, reservation.getPrice());
			stmt.setInt(7, reservation.getFoodId());

			ResultSet rs = stmt.executeQuery();

			return reservation;

		} catch (SQLException ex) {
			Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
			return null;

		}
	}

	public boolean approveReservation(int id) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "UPDATE reservations SET status = ? WHERE Id = ?";
			PreparedStatement pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, 1); // 1 for approved
			pstmt.setInt(2, id);

			pstmt.executeUpdate();
			return true;

		} catch (SQLException ex) {
			Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;

		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}

	public boolean rejectReservation(int id) {
		DbConnection dbCon = new DbConnection();
		var connection = dbCon.getConnection();

		try {
			String query = "UPDATE reservations SET status = ? WHERE Id = ?";
			PreparedStatement pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, 2); // 2 for rejected
			pstmt.setInt(2, id);

			pstmt.executeUpdate();
			return true;

		} catch (SQLException ex) {
			Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;

		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				Logger.getLogger(ReservationDao.class.getName()).log(Level.SEVERE, null, e);
			}
		}
	}
}
