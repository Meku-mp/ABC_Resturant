package model;

import java.util.Date;

public class Reservation {
	private Long Id;
    private Long CustomerId;
    private Long RestaurantId;
    private Date ReservationDate;
    private Integer NumberOfPeople;
    private String SpecialRequests;

    // Default constructor
    public Reservation() {
    }

    // Parameterized constructor
    public Reservation(Long id, Long customerId, Long restaurantId, Date reservationDate, Integer numberOfPeople, String specialRequests) {
        this.Id = id;
        this.CustomerId = customerId;
        this.RestaurantId = restaurantId;
        this.ReservationDate = reservationDate;
        this.NumberOfPeople = numberOfPeople;
        this.SpecialRequests = specialRequests;
    }

    // Getters and Setters
    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public Long getCustomerId() {
        return CustomerId;
    }

    public void setCustomerId(Long customerId) {
        this.CustomerId = customerId;
    }

    public Long getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(Long restaurantId) {
        this.RestaurantId = restaurantId;
    }

    public Date getReservationDate() {
        return ReservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.ReservationDate = reservationDate;
    }

    public Integer getNumberOfPeople() {
        return NumberOfPeople;
    }

    public void setNumberOfPeople(Integer numberOfPeople) {
        this.NumberOfPeople = numberOfPeople;
    }

    public String getSpecialRequests() {
        return SpecialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.SpecialRequests = specialRequests;
    }

    @Override
    public String toString() {
        return "Reservation [Id=" + Id + ", CustomerId=" + CustomerId + ", RestaurantId=" + RestaurantId + ", ReservationDate=" + ReservationDate + ", NumberOfPeople=" + NumberOfPeople + ", SpecialRequests=" + SpecialRequests + "]";
    }
}
