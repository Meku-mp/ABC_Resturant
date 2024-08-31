package dao;

import model.Restaurant;

public class RestaurantObserver {
	   public void update(String message, Restaurant restaurant) {
	        System.out.println("Notification: " + message);
	        System.out.println("Restaurant Details: " + restaurant.toString());
	        // Additional actions can be performed here, such as updating a UI component
	    }
}
