package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Query;

public class QueryDao {
	public Query insertQuery(Query query) {
        DbConnection dbCon = new DbConnection();
        Connection connection = dbCon.getConnection();

        try {
            String queryStr = "{CALL AddQuery (?, ?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(queryStr);

            stmt.setString(1, query.getQueryText());
            stmt.setDate(2, new java.sql.Date(query.getQueryDate().getTime()));
            stmt.setString(3, query.getCustomerName());
            stmt.setString(4, query.getCustomerEmail());
            stmt.setInt(5, query.getRestaurantId());

            stmt.executeQuery();

            return query;

        } catch (SQLException ex) {
            Logger.getLogger(QueryDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Query updateQuery(Query query) {
        DbConnection dbCon = new DbConnection();
        Connection connection = dbCon.getConnection();

        try {
            String queryStr = "{CALL UpdateQuery (?, ?, ?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(queryStr);

            stmt.setInt(1, query.getId());
            stmt.setString(2, query.getQueryText());
            stmt.setDate(3, new java.sql.Date(query.getQueryDate().getTime()));
            stmt.setString(4, query.getCustomerName());
            stmt.setString(5, query.getCustomerEmail());
            stmt.setInt(6, query.getRestaurantId());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                return query;
            } else {
                return null;
            }

        } catch (SQLException ex) {
            Logger.getLogger(QueryDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public boolean deleteQuery(int id) {
        DbConnection dbCon = new DbConnection();
        Connection connection = dbCon.getConnection();

        try {
            String queryStr = "{CALL DeleteQuery (?)}";
            CallableStatement stmt = connection.prepareCall(queryStr);

            stmt.setInt(1, id);

            int rowsAffected = stmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException ex) {
            Logger.getLogger(QueryDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

}
