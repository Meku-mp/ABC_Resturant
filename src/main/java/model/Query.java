package model;

import java.util.Date;

public class Query {
	private Long Id;
    private String QueryText;
    private Date QueryDate;
    private String CustomerName;
    private String CustomerEmail;
    private Long RestaurantId;

    // Default constructor
    public Query() {
    }

    // Parameterized constructor
    public Query(Long id, String queryText, Date queryDate, String customerName, String customerEmail, Long restaurantId) {
        this.Id = id;
        this.QueryText = queryText;
        this.QueryDate = queryDate;
        this.CustomerName = customerName;
        this.CustomerEmail = customerEmail;
        this.RestaurantId = restaurantId;
    }

    // Getters and Setters
    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
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

    public Long getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(Long restaurantId) {
        this.RestaurantId = restaurantId;
    }

    @Override
    public String toString() {
        return "Query [Id=" + Id + ", QueryText=" + QueryText + ", QueryDate=" + QueryDate + ", CustomerName=" + CustomerName + ", CustomerEmail=" + CustomerEmail + ", RestaurantId=" + RestaurantId + "]";
    }
}
