package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import model.Restaurant;

/**
 * Servlet implementation class CreateRestaurantServlet
 */
@WebServlet(name = "CreateRestaurantServlet", value = "/CreateRestaurantServlet")
public class CreateRestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateRestaurantServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie cookies[] = request.getCookies();
		int adminId = 0;

		for (Cookie c : cookies) {
			if (c.getName().equals("adminId")) {
				adminId = Integer.parseInt(c.getValue());
			}
		}

		var name = request.getParameter("name");
		var location = request.getParameter("location");
		var rate = request.getParameter("rate");

		var restaurant = new Restaurant();

		restaurant.setName(name);
		restaurant.setLocation(location);
		restaurant.setRate(Double.parseDouble(rate));
		restaurant.setCreateBy(adminId);

		var createdRestaurant = new RestaurantDao().createRestaurant(restaurant);

		if (createdRestaurant != null) {
			response.sendRedirect("admin/restaurants.jsp");
		}

	}

}
