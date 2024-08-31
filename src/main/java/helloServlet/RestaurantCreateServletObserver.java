package helloServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import dao.RestaurantObserver;
import model.Restaurant;
public class RestaurantCreateServletObserver {
	 private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#HttpServlet()
	     */
//	    public RestaurantCreateServlet() {
//	        super();
//	    }

	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        var name = request.getParameter("name");
	        var location = request.getParameter("location");
	        var rate = Double.parseDouble(request.getParameter("rate"));

	        Cookie cookies[] = request.getCookies();
	        int adminId = 0;

	        for (Cookie c : cookies) {
	            if (c.getName().equals("adminId")) {
	                adminId = Integer.parseInt(c.getValue());
	            }
	        }

	        var restaurant = new Restaurant();
	        restaurant.setName(name);
	        restaurant.setLocation(location);
	        restaurant.setRate(rate);
	        restaurant.setCreateBy(adminId);

	        var restaurantDao = new RestaurantDao();
	        var observer = new RestaurantObserver();
	        //((Object) restaurantDao).addObserver(observer); // Register observer

	        var insertedRestaurant = restaurantDao.createRestaurant(restaurant);

	        if (insertedRestaurant != null) {
	            response.sendRedirect("admin/restaurants.jsp?created=true");
	        }
	    }
}
