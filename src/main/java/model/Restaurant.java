package model;

import java.util.Date;

public class Restaurant {
	private Long Id;
    private String Name;
    private String Location;
    private Double Rate;
    private Long CreateBy; // ID of the admin who created the restaurant record
    private Date CreateDate; // Date when the restaurant record was created

    // Default constructor
    public Restaurant() {
    }

    // Parameterized constructor
    public Restaurant(Long id, String name, String location, Double rate, Long createBy, Date createDate) {
        this.Id = id;
        this.Name = name;
        this.Location = location;
        this.Rate = rate;
        this.CreateBy = createBy;
        this.CreateDate = createDate;
    }

    // Getters and Setters
    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        this.Location = location;
    }

    public Double getRate() {
        return Rate;
    }

    public void setRate(Double rate) {
        this.Rate = rate;
    }

    public Long getCreateBy() {
        return CreateBy;
    }

    public void setCreateBy(Long createBy) {
        this.CreateBy = createBy;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date createDate) {
        this.CreateDate = createDate;
    }

    @Override
    public String toString() {
        return "Restaurant [Id=" + Id + ", Name=" + Name + ", Location=" + Location + ", Rate=" + Rate + ", CreateBy=" + CreateBy + ", CreateDate=" + CreateDate + "]";
    }
}
