package model;

public class Food {
	private Long Id;
    private String Name;
    private String Description;
    private Double Price;
    private Long RestaurantId;
    private String ImagePath;

    // Default constructor
    public Food() {
    }

    // Parameterized constructor
    public Food(Long id, String name, String description, Double price, Long restaurantId, String imagePath) {
        this.Id = id;
        this.Name = name;
        this.Description = description;
        this.Price = price;
        this.RestaurantId = restaurantId;
        this.ImagePath = imagePath;
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        this.Description = description;
    }

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double price) {
        this.Price = price;
    }

    public Long getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(Long restaurantId) {
        this.RestaurantId = restaurantId;
    }

    public String getImagePath() {
        return ImagePath;
    }

    public void setImagePath(String imagePath) {
        this.ImagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Food [Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + ", RestaurantId=" + RestaurantId + ", ImagePath=" + ImagePath + "]";
    }
}
