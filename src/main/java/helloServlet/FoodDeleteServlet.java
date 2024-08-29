package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FoodDao;
import model.Food;

/**
 * Servlet implementation class FoodDeleteServlet
 */
@WebServlet(name = "FoodDeleteServlet", value = "/FoodDeleteServlet")
public class FoodDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FoodDeleteServlet() {
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
		String foodIdParam = request.getParameter("id");
		if (foodIdParam != null) {
			try {
				int foodId = Integer.parseInt(foodIdParam);
				FoodDao foodDao = new FoodDao();

				// Delete the food item
				boolean isDeleted = foodDao.deleteFood(foodId);

				if (isDeleted) {
					// Redirect to the food list page with success message
					response.sendRedirect("admin/foods.jsp?deleted=true");
				} else {
					// Redirect to the food list page with error message
					response.sendRedirect("admin/foods.jsp?deleted=false");
				}
			} catch (NumberFormatException e) {
				response.sendRedirect("admin/foods.jsp?deleted=false");
			}
		} else {
			response.sendRedirect("admin/foods.jsp?deleted=false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Get parameters from the request
		String idParam = request.getParameter("id");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String priceParam = request.getParameter("price");
		String restaurantIdParam = request.getParameter("restaurantId");
		String imagePath = request.getParameter("imagePath");

		try {
			int id = Integer.parseInt(idParam);
			double price = Double.parseDouble(priceParam);
			int restaurantId = Integer.parseInt(restaurantIdParam);

			// Create a Food object
			Food food = new Food();
			food.setId(id);
			food.setName(name);
			food.setDescription(description);
			food.setPrice(price);
			food.setRestaurantId(restaurantId);
			food.setImagePath(imagePath);

			// Update the food item in the database
			FoodDao foodDao = new FoodDao();
			boolean isUpdated = foodDao.updateFood(food);

			if (isUpdated) {
				// Redirect to the food list page with success message
				response.sendRedirect("admin/foods.jsp?updated=true");
			} else {
				// Redirect to the food list page with error message
				response.sendRedirect("admin/foods.jsp?updated=false");
			}
		} catch (NumberFormatException e) {
			response.sendRedirect("admin/foods.jsp?updated=false");
		}
	}

}
