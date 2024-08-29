package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import config.GlobalClass;
import dao.CustomerDao;
import model.Customer;

@WebServlet(name = "UserLoginServlet", value = "/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		var username = request.getParameter("username");
		var password = request.getParameter("password");

		HttpSession httpSession = request.getSession();

		if (username.equals("") || password.equals("")) {
			request.setAttribute("errorMessage", "Username and password are required.");
			request.getRequestDispatcher("signin.jsp").forward(request, response);
			
			return;
		}

		Customer customer = new Customer();
		GlobalClass globalClass = new GlobalClass();

		customer.setUsername(username);
		customer.setPassword(globalClass.hashPassword(password));

		var loggedCustomer = new CustomerDao().loginCustomer(customer);

		if (loggedCustomer == null) {
			httpSession.setAttribute("error_code", "1");
			request.setAttribute("errorMessage", "Invalid credentials");
			request.getRequestDispatcher("signin.jsp").forward(request, response);
			return;
		} else {
			Cookie cookies[] = request.getCookies();

			for (Cookie c : cookies) {
				if (c.getName().equals("userId")) {
					c.setValue(loggedCustomer.getId() + "");
					c.setMaxAge(60 * 60);
					response.addCookie(c);
				} else {
					Cookie adId = new Cookie("userId", loggedCustomer.getId() + "");
					adId.setMaxAge(60 * 60);
					response.addCookie(adId);
				}
			}
			response.sendRedirect("profile.jsp");
		}

	}

}
