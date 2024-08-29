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
import dao.AdminDao;
import dao.StaffDao;
import model.Admin;
import model.Staff;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		var username = request.getParameter("username");
		var password = request.getParameter("password");
		var loginType = request.getParameter("userType");

		HttpSession httpSession = request.getSession();
		var globalClass = new GlobalClass();

		if (username.equals("") || password.equals("")) {
			request.setAttribute("errorMessage", "Username and password are required.");
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

			return;
		}

		if (loginType.equals("admin")) {
			var admin = new Admin();

			admin.setUsername(username);
			admin.setPassword(globalClass.hashPassword(password));

			var loggedAdmin = new AdminDao().loginAdmin(admin);

			if (loggedAdmin == null) {
				httpSession.setAttribute("error_code", "1");
				request.setAttribute("errorMessage", "Invalid credentials");
				request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

				return;

			} else {
				Cookie cookies[] = request.getCookies();

				for (Cookie c : cookies) {
					if (c.getName().equals("adminId")) {
						c.setValue(loggedAdmin.getId() + "");
						c.setMaxAge(60 * 60);
						response.addCookie(c);
					} else {
						Cookie adId = new Cookie("adminId", loggedAdmin.getId() + "");
						adId.setMaxAge(60 * 60);
						response.addCookie(adId);
					}
				}

				response.sendRedirect("admin/adminhome.jsp");
			}
		} else if (loginType.equals("staff")) {
			var staff = new Staff();

			staff.setUsername(username);
			staff.setPassword(globalClass.hashPassword(password));

			var loggedStaff = new StaffDao().loginStaff(staff);

			if (loggedStaff == null) {
				httpSession.setAttribute("error_code", "1");
				request.setAttribute("errorMessage", "Invalid credentials");
				request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

				return;

			} else {
				Cookie cookies[] = request.getCookies();

				for (Cookie c : cookies) {
					if (c.getName().equals("staffId")) {
						c.setValue(loggedStaff.getId() + "");
						c.setMaxAge(60 * 60);
						response.addCookie(c);
					} else {
						Cookie adId = new Cookie("staffId", loggedStaff.getId() + "");
						adId.setMaxAge(60 * 60);
						response.addCookie(adId);
					}
				}

				response.sendRedirect("staff/staffhome.jsp");
			}

		} else {
			request.setAttribute("errorMessage", "Something Happened :(");
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);

			return;
		}

	}

}
