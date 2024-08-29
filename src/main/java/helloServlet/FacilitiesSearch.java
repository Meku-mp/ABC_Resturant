package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FacilitiesDao;

/**
 * Servlet implementation class FacilitiesSearch
 */
@WebServlet(name = "FacilitiesSearch", value = "/FacilitiesSearch")
public class FacilitiesSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacilitiesSearch() {
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
		
		String name = request.getParameter("name");
		
		var facilities = new FacilitiesDao().getAllFacilitiesByName(name);
		
		// Set the facilities list as a request attribute
	    request.setAttribute("facilities", facilities);

	    // Forward the request to the desired JSP page (e.g., facilities.jsp)
	    request.getRequestDispatcher("facilities.jsp").forward(request, response);
		
		
	}

}
