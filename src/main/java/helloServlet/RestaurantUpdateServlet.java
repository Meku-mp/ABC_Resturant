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
@WebServlet(name = "RestaurantUpdateServlet", value = "/RestaurantUpdateServlet")
public class RestaurantUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RestaurantUpdateServlet() {
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
		var id = request.getParameter("id");
		var name = request.getParameter("name");
		var location = request.getParameter("location");
		var rate = Double.parseDouble(request.getParameter("rate"));

		var Restaurant = new Restaurant();

		Restaurant.setId(Integer.parseInt(id));
		Restaurant.setName(name);
		Restaurant.setLocation(location);
		Restaurant.setRate(rate);

		var updatedRestaurant = new RestaurantDao().updateRestaurant(Restaurant);

		if (updatedRestaurant != null) {
			response.sendRedirect("admin/restaurants.jsp?updated=true");
		}
	}

}
