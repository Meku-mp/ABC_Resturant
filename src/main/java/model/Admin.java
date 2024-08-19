package model;

public class Admin {
	private Long Id;
    private String FullName;
    private String Email;
    private String Username;
    private String Password;

    // Default constructor
    public Admin() {
    }

    // Parameterized constructor
    public Admin(Long id, String fullName, String email, String username, String password) {
        this.Id = id;
        this.FullName = fullName;
        this.Email = email;
        this.Username = username;
        this.Password = password;
    }

    // Getters and Setters
    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String fullName) {
        this.FullName = fullName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
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

    @Override
    public String toString() {
        return "Admin [Id=" + Id + ", FullName=" + FullName + ", Email=" + Email + ", Username=" + Username + ", Password=" + Password + "]";
    }

}
