package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FoodDao;
import model.Food;

/**
 * Servlet implementation class CreateFoodServlet
 */
@WebServlet(name = "CreateFoodServlet", value = "/CreateFoodServlet")
public class CreateFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateFoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		var name = request.getParameter("name");
		var description = request.getParameter("description");
		var price = request.getParameter("price");
		var restaurantId = request.getParameter("restaurantId");
		var imagePath = request.getParameter("imagePath");
		
		
		Cookie cookies[] = request.getCookies();
		int adminId = 0;
		int staffId = 0;

		for (Cookie c : cookies) {
			if (c.getName().equals("adminId")) {
				adminId = Integer.parseInt(c.getValue());
			}

			if (c.getName().equals("staffId")) {
				staffId = Integer.parseInt(c.getValue());
			}
		}
		
		var food = new Food();
		
		food.setName(name);
		food.setDescription(description);
		food.setPrice(Double.parseDouble(price));
		food.setRestaurantId(Integer.parseInt(restaurantId));
		food.setImagePath(imagePath);
		
		var insertedFood = new FoodDao().insertFood(food);
		
		if (insertedFood != null) {
			if (adminId > 0) {
				response.sendRedirect("admin/foods.jsp");
			}

			if (staffId > 0) {
				response.sendRedirect("staff/foods.jsp");
			}
		}
				
				
	}

}
