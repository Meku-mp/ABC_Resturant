package model;

public class Food {
	private int Id;
    private String Name;
    private String Description;
    private Double Price;
    private int RestaurantId;
    private String ImagePath;

    // Default constructor
    public Food() {
    }

    // Parameterized constructor
    public Food(int id, String name, String description, Double price, int restaurantId, String imagePath) {
        this.Id = id;
        this.Name = name;
        this.Description = description;
        this.Price = price;
        this.RestaurantId = restaurantId;
        this.ImagePath = imagePath;
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

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double price) {
        this.Price = price;
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

    @Override
    public String toString() {
        return "Food [Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + ", RestaurantId=" + RestaurantId + ", ImagePath=" + ImagePath + "]";
    }
}
