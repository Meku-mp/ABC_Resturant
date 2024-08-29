package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.GlobalClass;
import dao.CustomerDao;
import dao.StaffDao;
import model.Staff;

/**
 * Servlet implementation class StaffCreateServlet
 */
@WebServlet(name = "StaffCreateServlet", value = "/StaffCreateServlet")
public class StaffCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StaffCreateServlet() {
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
		var position = request.getParameter("position");
		var salary = request.getParameter("salary");
		var resId = request.getParameter("restaurantId");
		var username = request.getParameter("username");
		var password = request.getParameter("password");
		
		Cookie cookies[] = request.getCookies();
        int adminId = 0;

        for (Cookie c : cookies) {
            if (c.getName().equals("adminId")) {
            	adminId = Integer.parseInt(c.getValue());
            }
        }

		var staff = new Staff();
		var globalClass = new GlobalClass();

		staff.setName(name);
		staff.setPosition(position);
		staff.setSalary(Double.parseDouble(salary));
		staff.setRestaurantId(Integer.parseInt(resId));
		staff.setUsername(username);
		staff.setPassword(globalClass.hashPassword(password));
		staff.setCreateBy(adminId);

		var insertedStaff = new StaffDao().createStaff(staff);

		if (insertedStaff != null) {
			response.sendRedirect("admin/staff.jsp?created=true");
		}
	}

}
