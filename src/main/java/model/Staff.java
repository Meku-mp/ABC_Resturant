package model;

import java.util.Date;

public class Staff {
	private Long Id;
    private String Name;
    private String Position;
    private Double Salary;
    private Long RestaurantId; // ID of the restaurant the staff is associated with
    private String Username;
    private String Password;
    private Long CreateBy; // ID of the admin who created the staff record
    private Date CreateDate; // Date when the staff record was created

    // Default constructor
    public Staff() {
    }

    // Parameterized constructor
    public Staff(Long id, String name, String position, Double salary, Long restaurantId, String username, String password, Long createBy, Date createDate) {
        this.Id = id;
        this.Name = name;
        this.Position = position;
        this.Salary = salary;
        this.RestaurantId = restaurantId;
        this.Username = username;
        this.Password = password;
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

    public String getPosition() {
        return Position;
    }

    public void setPosition(String position) {
        this.Position = position;
    }

    public Double getSalary() {
        return Salary;
    }

    public void setSalary(Double salary) {
        this.Salary = salary;
    }

    public Long getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(Long restaurantId) {
        this.RestaurantId = restaurantId;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        this.Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        this.Password = password;
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
        return "Staff [Id=" + Id + ", Name=" + Name + ", Position=" + Position + ", Salary=" + Salary + ", RestaurantId=" + RestaurantId + ", Username=" + Username + ", Password=" + Password + ", CreateBy=" + CreateBy + ", CreateDate=" + CreateDate + "]";
    }
}
