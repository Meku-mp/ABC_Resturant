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
import model.Customer;

/**
 * Servlet implementation class UpdateCustomerServlet
 */
@WebServlet(name = "UpdateCustomerServlet", value = "/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCustomerServlet() {
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
		// Retrieve form parameters
		Cookie cookies[] = request.getCookies();
		int userId = 0;

		for (Cookie c : cookies) {
			if (c.getName().equals("userId")) {
				userId = Integer.parseInt(c.getValue());
			}
		}
		
		GlobalClass globalClass = new GlobalClass();
		
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("contactNo");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Create Customer object
		Customer customer = new Customer();
		customer.setId(userId);
		customer.setFullName(fullName);
		customer.setEmail(email);
		customer.setPhone(phone);
		customer.setUsername(username);
		customer.setPassword(globalClass.hashPassword(password));

		// Update customer in database
		CustomerDao customerDao = new CustomerDao();
		Customer updatedCustomer = customerDao.updateCustomer(customer);

		// Check if update was successful
		if (updatedCustomer != null) {
			// Update was successful
			response.sendRedirect("profile.jsp?updateSuccess=true");
		} else {
			// Update failed
			response.sendRedirect("editProfile.jsp?updateSuccess=false");
		}
	}

}
