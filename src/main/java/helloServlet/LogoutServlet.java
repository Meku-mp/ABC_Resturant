package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Clear all cookies
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
		    for (Cookie c : cookies) {
		        if (c.getName().equals("adminId")) {
		            // Set the max age to 0 to delete the cookie
		            c.setMaxAge(0);
		            response.addCookie(c);
		        }
		        if (c.getName().equals("userId")) {
		            // Set the max age to 0 to delete the cookie
		            c.setMaxAge(0);
		            response.addCookie(c);
		        }
		        if (c.getName().equals("staffId")) {
		            // Set the max age to 0 to delete the cookie
		            c.setMaxAge(0);
		            response.addCookie(c);
		        }
		    }
		}
				// Redirect to home page
				response.sendRedirect("index.jsp"); // Redirect to index.jsp or the appropriate home page
		
	}

}
