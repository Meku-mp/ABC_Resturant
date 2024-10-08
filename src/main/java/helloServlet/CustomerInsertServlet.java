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
 * Servlet implementation class CustomerInsertServlet
 */
@WebServlet(name = "CustomerInsertServlet", value = "/CustomerInsertServlet")
public class CustomerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerInsertServlet() {
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
		var customer = new Customer();
		var globalClass = new GlobalClass();
		
		var fullName = request.getParameter("fullname");
		var email = request.getParameter("email");
		var phone = request.getParameter("phone");
		var username = request.getParameter("username");
		var password = request.getParameter("password");

		customer.setFullName(fullName);
		customer.setEmail(email);
		customer.setPhone(phone);
		customer.setUsername(username);
		customer.setPassword(globalClass.hashPassword(password));

		var insertedCustomer = new CustomerDao().insertCustomer(customer);

		if (insertedCustomer != null) {
			Cookie cookies[] = request.getCookies();

			for (Cookie c : cookies) {
				if (c.getName().equals("userId")) {
					c.setValue(insertedCustomer.getId() + "");
					c.setMaxAge(60 * 60);
					response.addCookie(c);
				} else {
					Cookie adId = new Cookie("userId", insertedCustomer.getId() + "");
					adId.setMaxAge(60 * 60);
					response.addCookie(adId);
				}
			}

			response.sendRedirect("profile.jsp");
		}
	}

}
