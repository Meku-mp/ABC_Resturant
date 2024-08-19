package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		Customer customer = new Customer();
		
		customer.setFullName(request.getParameter("FullName"));
		customer.setEmail(request.getParameter("Email"));
		customer.setPhone(request.getParameter("Phone"));
		customer.setUsername(request.getParameter("Username"));
		customer.setPassword(request.getParameter("Password"));
		
		var insertedCustomer = new CustomerDao().insertCustomer(customer);
		
		if (insertedCustomer == 0) {
			response.sendRedirect("customers.jsp");
		}
	}

}

