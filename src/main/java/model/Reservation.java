package model;

import java.util.Date;

public class Reservation {
	private int Id;
	private Date ReservationDate;
	private int NumberOfGuests;
	private int CustomerId;
	private int RestaurantId;
	private int Type;
	private double Price;
	private int FoodId;
	private int Status;

	// Default constructor
	public Reservation() {
	}

	// Parameterized constructor
	public Reservation(int id, Date reservationDate, int numberOfGuests, int customerId, int restaurantId, int type,
			double price, int foodId, int status) {
		this.Id = id;
		this.ReservationDate = reservationDate;
		this.NumberOfGuests = numberOfGuests;
		this.CustomerId = customerId;
		this.RestaurantId = restaurantId;
		this.Type = type;
		this.Price = price;
		this.FoodId = foodId;
		this.Status = status;
	}

	// Getters and Setters
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		this.Id = id;
	}

	public Date getReservationDate() {
		return ReservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.ReservationDate = reservationDate;
	}

	public int getNumberOfGuests() {
		return NumberOfGuests;
	}

	public void setNumberOfGuests(int numberOfGuests) {
		this.NumberOfGuests = numberOfGuests;
	}

	public int getCustomerId() {
		return CustomerId;
	}

	public void setCustomerId(int customerId) {
		this.CustomerId = customerId;
	}

	public int getRestaurantId() {
		return RestaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.RestaurantId = restaurantId;
	}

	public int getType() {
		return Type;
	}

	public void setType(int type) {
		this.Type = type;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		this.Price = price;
	}

	public int getFoodId() {
		return FoodId;
	}

	public void setFoodId(int foodId) {
		this.FoodId = foodId;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		this.Status = status;
	}

}
