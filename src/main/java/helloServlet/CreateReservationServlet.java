package helloServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmailDao;
import dao.ReservationDao;
import model.Reservation;

/**
 * Servlet implementation class CreateReservationServlet
 */
@WebServlet(name = "CreateReservationServlet", value = "/CreateReservationServlet")
public class CreateReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateReservationServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");

		// Retrieve the user ID from cookies
		Cookie cookies[] = request.getCookies();
		int userId = 0;
		for (Cookie c : cookies) {
			if (c.getName().equals("userId")) {
				userId = Integer.parseInt(c.getValue());
			}
		}

		// Common parameters
		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
		String datetime = request.getParameter("datetime");
		Date reservationDate = null;
		try {
			reservationDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(datetime);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Initialize variables
		int numberOfGuests = 1;
		double price = 0.00;
		int foodId = 0;
		int resType = 0;

		// Set specific parameters based on reservation type
		if (type.equals("takeAway")) {
			foodId = Integer.parseInt(request.getParameter("food"));
			price = 2000.00; // Set fixed price for take away
			resType = 1; // Type 1 for take away
		} else if (type.equals("dineIn")) {
			numberOfGuests = Integer.parseInt(request.getParameter("noOfguests"));
			resType = 2; // Type 2 for dine-in
		}

		// Create Reservation object
		Reservation reservation = new Reservation();
		reservation.setCustomerId(userId);
		reservation.setRestaurantId(restaurantId);
		reservation.setReservationDate(reservationDate);
		reservation.setNumberOfGuests(numberOfGuests);
		reservation.setPrice(price);
		reservation.setType(resType);
		reservation.setFoodId(foodId);
		reservation.setStatus(0); // Assuming 0 means pending or new

		// Call the DAO to insert the reservation
		ReservationDao reservationDao = new ReservationDao();
		reservationDao.createReservation(reservation);

		// Send a thank you email after the reservation is created
		String recipientEmail = request.getParameter("email"); // Assuming you have the customer's email as a request
																// parameter
		String reservationDetails = "Reservation Date: "
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm").format(reservationDate) + "\nNumber of Guests: "
				+ numberOfGuests + "\nReservation Type: " + (resType == 1 ? "Take Away" : "Dine In") + "\nPrice: $"
				+ price;

		EmailDao emailDao = new EmailDao();
		emailDao.sendThankYouEmail(recipientEmail, reservationDetails);

		// Redirect to confirmation or success page
		response.sendRedirect("index.jsp");
	}
}
