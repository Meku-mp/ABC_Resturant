package helloServlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QueryDao;
import model.Query;

/**
 * Servlet implementation class CreateQueriesServlet
 */
@WebServlet(name = "CreateQueriesServlet", value = "/CreateQueriesServlet")
public class CreateQueriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateQueriesServlet() {
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
		String queryText = request.getParameter("queryText");
		String queryDateStr = request.getParameter("queryDate");
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

		// Convert date string to Date object
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date queryDate = null;
		try {
			queryDate = sdf.parse(queryDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
			response.sendRedirect("errorPage.jsp"); // Redirect to an error page
			return;
		}

		// Create Query object
		Query query = new Query();
		query.setQueryText(queryText);
		query.setQueryDate(queryDate);
		query.setCustomerName(customerName);
		query.setCustomerEmail(customerEmail);
		query.setRestaurantId(restaurantId);

		// Insert query using QueriesDao
		QueryDao queriesDao = new QueryDao();
		Query insertedQuery = queriesDao.insertQuery(query);

		if (insertedQuery != null) {
			// Redirect to success or confirmation page
			response.sendRedirect("index.jsp");
		} else {
			// Redirect to an error page
			response.sendRedirect("errorPage.jsp");
		}
	}

}
