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
 * Servlet implementation class FacilityUpdateServlet
 */
@WebServlet(name = "FacilityUpdateServlet", value = "/FacilityUpdateServlet")
public class FacilityUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FacilityUpdateServlet() {
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
		int facilityId = Integer.parseInt(request.getParameter("id"));

		// Create an instance of FacilitiesDao
		FacilitiesDao facilitiesDao = new FacilitiesDao();

		// Call the deleteFacility method
		boolean isDeleted = facilitiesDao.deleteFacility(facilityId);

		// Redirect or show a message based on the deletion result
		if (isDeleted) {
			response.sendRedirect("admin/facilities.jsp?deleted=true");
		} else {
			response.sendRedirect("admin/facilities.jsp?deleted=false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie cookies[] = request.getCookies();
		int adminId = 0;

		for (Cookie c : cookies) {
			if (c.getName().equals("adminId")) {
				adminId = Integer.parseInt(c.getValue());
			}
		}

		// Get parameters from the request
		int facilityId = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
		String imagePath = request.getParameter("image");

		// Create a Facility object
		Facility facility = new Facility();
		facility.setId(facilityId);
		facility.setName(name);
		facility.setDescription(description);
		facility.setRestaurantId(restaurantId);
		facility.setImagePath(imagePath);
		facility.setCreateBy(adminId);

		// Create an instance of FacilitiesDao
		FacilitiesDao facilitiesDao = new FacilitiesDao();

		// Call the updateFacility method
		boolean isUpdated = facilitiesDao.updateFacility(facility);

		// Redirect or show a message based on the update result
		if (isUpdated) {
			response.sendRedirect("admin/facilities.jsp?updated=true");
		} else {
			response.sendRedirect("admin/facilities.jsp?updated=false");
		}

	}

}
