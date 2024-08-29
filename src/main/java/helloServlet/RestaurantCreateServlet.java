package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.GlobalClass;
import dao.RestaurantDao;
import model.Restaurant;

/**
 * Servlet implementation class RestaurantCreateServlet
 */
@WebServlet(name = "RestaurantCreateServlet", value = "/RestaurantCreateServlet")
public class RestaurantCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RestaurantCreateServlet() {
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

		var Restaurant = new Restaurant();

		Restaurant.setName(name);
		Restaurant.setLocation(location);
		Restaurant.setRate(rate);
		Restaurant.setCreateBy(adminId);

		var insertedRestaurant = new RestaurantDao().createRestaurant(Restaurant);

		if (insertedRestaurant != null) {
			response.sendRedirect("admin/restaurants.jsp?created=true");
		}
	}

}
