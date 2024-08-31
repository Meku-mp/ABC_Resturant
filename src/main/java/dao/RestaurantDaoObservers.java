package dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.DbConnection;
import model.Restaurant;
public class RestaurantDaoObservers {
	private List<Observer> observers = new ArrayList<>();
    private static final Logger LOGGER = Logger.getLogger(RestaurantDao.class.getName());

    public void addObserver(Observer observer) {
        observers.add(observer);
    }

    private void notifyObservers(String message, Restaurant restaurant) {
        for (Observer observer : observers) {
            observer.update(message, restaurant);
        }
    }

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

            stmt.executeQuery();

            notifyObservers("Restaurant Created", restaurant); // Notify observers

            return restaurant;

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.SEVERE, null, ex);
            }
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
            stmt.setInt(4, restaurant.getId());

            stmt.executeUpdate();

            notifyObservers("Restaurant Updated", restaurant); // Notify observers

            return restaurant;

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.SEVERE, null, ex);
            }
        }
    }

    public Restaurant deleteRestaurant(Restaurant restaurant) {
        var dbCon = new DbConnection();
        var connection = dbCon.getConnection();

        try {
            String query = "DELETE FROM restaurants WHERE Id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, restaurant.getId());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                notifyObservers("Restaurant Deleted", restaurant); // Notify observers
                return restaurant;
            } else {
                return null;
            }

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.SEVERE, null, ex);
            }
        }
    }
}
