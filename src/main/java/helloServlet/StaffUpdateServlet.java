package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.GlobalClass;
import dao.StaffDao;
import model.Staff;

/**
 * Servlet implementation class StaffUpdateServlet
 */
@WebServlet(name = "StaffUpdateServlet", value = "/StaffUpdateServlet")
public class StaffUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffUpdateServlet() {
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
		
		int id = Integer.parseInt(request.getParameter("id"));
		var name = request.getParameter("name");
		var position = request.getParameter("position");
		var salary = request.getParameter("salary");
		var resId = request.getParameter("restaurantId");
		var username = request.getParameter("username");
		var password = request.getParameter("password");

		var staff = new Staff();
		var globalClass = new GlobalClass();

		staff.setId(id);
		staff.setName(name);
		staff.setPosition(position);
		staff.setSalary(Double.parseDouble(salary));
		staff.setRestaurantId(Integer.parseInt(resId));
		staff.setUsername(username);
		staff.setPassword(globalClass.hashPassword(password));

		var updatedStaff = new StaffDao().updateStaff(staff);

		if (updatedStaff != null) {
			response.sendRedirect("admin/staff.jsp?updated=true");
		}
	}

}
