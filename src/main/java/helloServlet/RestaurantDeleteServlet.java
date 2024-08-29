package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RestaurantDao;
import dao.StaffDao;
import model.Restaurant;
import model.Staff;

/**
 * Servlet implementation class RestaurantDeleteServlet
 */
@WebServlet(name="RestaurantDeleteServlet",value="/RestaurantDeleteServlet")
public class RestaurantDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RestaurantDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		var restaurant = new Restaurant();

		restaurant.setId(id);

		var deleteRestaurant = new RestaurantDao().deleteRestaurant(restaurant);

		if (deleteRestaurant != null) {
			response.sendRedirect("admin/restaurants.jsp?deleted=true");
		}
	}

}
