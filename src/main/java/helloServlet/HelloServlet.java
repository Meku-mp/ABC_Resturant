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
 * Servlet implementation class HelloServlet
 */
@WebServlet(name = "HelloServlet", value = "/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * request.setAttribute("message", "Hello, Jakarta EE with JSP!");
		 * 
		 * 
		 * request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request,
		 * response);
		 */
             
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
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

//		var FacilitiesDaoSingleton = FacilitiesDao.getInstance();
//		var insertedFacility = ((FacilitiesDao) facilitiesDao).createFacility(facility);
//
//		if (insertedFacility != null) {
//			if (adminId > 0) {
//				response.sendRedirect("admin/facilities.jsp?created=true");
//			}
//
//			if (staffId > 0) {
//				response.sendRedirect("staff/facilities.jsp?created=true");
//			}
//		}
	}

}
