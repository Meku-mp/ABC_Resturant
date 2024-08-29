package dao;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailDao {

	public void sendThankYouEmail(String recipientEmail, String reservationDetails) {
		System.setProperty("https.protocols", "TLSv1.2");
		final String username = "assshka@gmail.com";
		final String password = "ivqqbhjsnqrmakob";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
			message.setSubject("Thank You for Your Reservation");
			message.setText(
					"Dear Customer,\n\nThank you for making a reservation with us. Here are your reservation details:\n\n"
							+ reservationDetails
							+ "\n\nWe look forward to serving you!\n\nBest Regards,\nYour Restaurant Team");

			Transport.send(message);
			System.out.println("Thank you email sent successfully!");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		EmailDao emailDao = new EmailDao();
		String recipientEmail = "guestpc87@gmail.com";
		String reservationDetails = "Reservation Date: 2024-08-30\nNumber of Guests: 4\nReservation Type: Dine-In";
		emailDao.sendThankYouEmail(recipientEmail, reservationDetails);
	}
}
