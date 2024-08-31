package dao;

import model.Restaurant;

public interface Observer {
	 void update(String message, Restaurant restaurant);
}
