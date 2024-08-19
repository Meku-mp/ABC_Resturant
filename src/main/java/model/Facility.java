package model;

public class Facility {
	private Long Id;
    private String Name;
    private String Description;
    private Long RestaurantId;

    // Default constructor
    public Facility() {
    }

    // Parameterized constructor
    public Facility(Long id, String name, String description, Long restaurantId) {
        this.Id = id;
        this.Name = name;
        this.Description = description;
        this.RestaurantId = restaurantId;
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

    public Long getRestaurantId() {
        return RestaurantId;
    }

    public void setRestaurantId(Long restaurantId) {
        this.RestaurantId = restaurantId;
    }

    @Override
    public String toString() {
        return "Facility [Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", RestaurantId=" + RestaurantId + "]";
    }
}
