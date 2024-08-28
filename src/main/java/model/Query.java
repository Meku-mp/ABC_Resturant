package model;

import java.util.Date;

public class Query {
	private int Id;
    private String QueryText;
    private Date QueryDate;
    private String CustomerName;
    private String CustomerEmail;
    private int RestaurantId;

    // Default constructor
    public Query() {
    }

    // Parameterized constructor
    public Query(int id, String queryText, Date queryDate, String customerName, String customerEmail, int restaurantId) {
        this.Id = id;
        this.QueryText = queryText;
        this.QueryDate = queryDate;
        this.CustomerName = customerName;
        this.CustomerEmail = customerEmail;
        this.RestaurantId = restaurantId;
    }

    // Getters and Setters
    public int getId() {
        return Id;
    }

    public void setId(int id) {
        this.Id = id;
    }

    public String getQueryText() {
        return QueryText;
    }

    public void setQueryText(String queryText) {
        this.QueryText = queryText;
    }

    public Date getQueryDate() {
        return QueryDate;
    }

    public void setQueryDate(Date queryDate) {
        this.QueryDate = queryDate;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String customerName) {
        this.CustomerName = customerName;
    }

    public String getCustomerEmail() {
        return CustomerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.CustomerEmail = customerEmail;
    }

    public int getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.RestaurantId = restaurantId;
    }

    @Override
    public String toString() {
        return "Query [Id=" + Id + ", QueryText=" + QueryText + ", QueryDate=" + QueryDate + ", CustomerName=" + CustomerName + ", CustomerEmail=" + CustomerEmail + ", RestaurantId=" + RestaurantId + "]";
    }
}
