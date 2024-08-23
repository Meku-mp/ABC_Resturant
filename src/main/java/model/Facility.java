package model;

import java.time.LocalDateTime;

public class Facility {
    private int Id;
    private String Name;
    private String Description;
    private int RestaurantId;
    private String ImagePath;
    private int CreateBy;
    private LocalDateTime CreateDate;

    // Default constructor
    public Facility() {
    }

    // Parameterized constructor
    public Facility(int id, String name, String description, int restaurantId, String imagePath, int createBy, LocalDateTime createDate) {
        this.Id = id;
        this.Name = name;
        this.Description = description;
        this.RestaurantId = restaurantId;
        this.ImagePath = imagePath;
        this.CreateBy = createBy;
        this.CreateDate = createDate;
    }

    // Getters and Setters
    public int getId() {
        return Id;
    }

    public void setId(int id) {
        this.Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        this.Description = description;
    }

    public int getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.RestaurantId = restaurantId;
    }

    public String getImagePath() {
        return ImagePath;
    }

    public void setImagePath(String imagePath) {
        this.ImagePath = imagePath;
    }

    public int getCreateBy() {
        return CreateBy;
    }

    public void setCreateBy(int createBy) {
        this.CreateBy = createBy;
    }

    public LocalDateTime getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.CreateDate = createDate;
    }

    @Override
    public String toString() {
        return "Facility [Id=" + Id + ", Name=" + Name + ", Description=" + Description + 
               ", RestaurantId=" + RestaurantId + ", ImagePath=" + ImagePath + 
               ", CreateBy=" + CreateBy + ", CreateDate=" + CreateDate + "]";
    }
}
