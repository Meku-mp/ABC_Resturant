package helloServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;

/**
 * Servlet implementation class ReservationStatusUpdateServlet
 */
@WebServlet(name = "ReservationStatusUpdateServlet", value = "/ReservationStatusUpdateServlet")
public class ReservationStatusUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationStatusUpdateServlet() {
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
		var userId = Integer.parseInt(request.getParameter("user_id"));
		var type = request.getParameter("type");

		var reservationDao = new ReservationDao();

		if (type.equals("approve")) {
			reservationDao.approveReservation(userId);
		}

		if (type.equals("reject")) {
			reservationDao.rejectReservation(userId);
		}
		
		response.sendRedirect("admin/reservations.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
