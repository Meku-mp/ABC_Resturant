package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FacilitiesDao;
import model.Facility;

/**
 * Servlet implementation class CreateFacilityServlet
 */
@WebServlet(name = "CreateFacilityServlet", value = "/CreateFacilityServlet")
public class CreateFacilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateFacilityServlet() {
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
		var description = request.getParameter("description");
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

		var facility = new Facility();

		facility.setName(name);
		facility.setDescription(description);
		facility.setRestaurantId(Integer.parseInt(restaurantId));
		facility.setImagePath(imagePath);
		facility.setCreateBy(adminId > 0 ? adminId : 1);

		var insertedFacility = new FacilitiesDao().createFacility(facility);

		if (insertedFacility != null) {
			if (adminId > 0) {
				response.sendRedirect("admin/facilities.jsp?created=true");
			}

			if (staffId > 0) {
				response.sendRedirect("staff/facilities.jsp?created=true");
			}
		}

	}

}








/*
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { // Your existing code for
 * handling the request
 * 
 * // Use Singleton instance of FacilitiesDao var facilitiesDao =
 * FacilitiesDao.getInstance(); var insertedFacility =
 * facilitiesDao.createFacility(facility);
 * 
 * // Continue with your existing response handling code }
 */
