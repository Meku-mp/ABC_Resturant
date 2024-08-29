<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport">
<!-- ========== SEO ========== -->
<title>Profile</title>
<meta content="" name="description">
<meta content="" name="keywords">
<meta content="" name="author">
<!-- ========== FAVICON ========== -->
<link rel="apple-touch-icon-precomposed" href="images/favicon-apple.png" />
<link rel="icon" href="images/favicon.png">
<!-- ========== STYLESHEETS ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="css/jquery.mmenu.css">
<link rel="stylesheet" href="revolution/css/layers.css">
<link rel="stylesheet" href="revolution/css/settings.css">
<link rel="stylesheet" href="revolution/css/navigation.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/daterangepicker.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet" href="style/stylesignin.css">
<link rel="stylesheet" href="style/userdashboard.css">

<link rel="stylesheet" href="style/guestdetails.css">
<link rel="stylesheet" href="style/profile.css">


<!-- ========== ICON FONTS ========== -->
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="fonts/flaticon.css" rel="stylesheet">
<!-- ========== GOOGLE FONTS ========== -->
<link
	href="https://fonts.googleapis.com/css?family=Oswald:400,500,600,700%7CRoboto:100,300,400,400i,500,700"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="light">

	<%
	int userId = 0;

	Cookie cookies[] = request.getCookies();

	for (Cookie c : cookies) {
		if (c.getName().equals("userId")) {
			userId = Integer.parseInt(c.getValue());
		}
	}

	if (userId == 0) {
		response.sendRedirect("signin.jsp");
	}
	%>
	<!-- ========== MOBILE MENU ========== -->
	<nav id="mobile-menu"></nav>
	<!--Navbar-->

	<header class="horizontal-header sticky-header transparent-header "
		data-menutoggle="991">

		<!--Header-->
		<div class="container">
			<!-- BRAND -->
			<div class="brand">
				<div class="logo">
					<a href="index.html"> <img src="images/logo ABC.png"
						class="nav-logo" alt="ABC Resturent">
					</a>
				</div>
			</div>
			<!-- MOBILE MENU BUTTON -->
			<div id="toggle-menu-button" class="toggle-menu-button">
				<span class="line"></span> <span class="line"></span> <span
					class="line"></span>
			</div>
			<!-- MAIN MENU -->
			<nav id="main-menu" class="main-menu">
				<ul class="menu">
					<li class="menu-item dropdown  "><a href="index.html">HOME</a>

					</li>
					<li class="menu-item dropdown"><a href="#">ROOMS</a></li>
					<li class="menu-item dropdown"><a href="#">CONFERENCE
							HALLS</a></li>
					<li class="menu-item dropdown"><a href="#">DINING</a></li>

					<li class="menu-item"><a href="contact.html">CONTACT US</a></li>
					<li class="menu-item menu-btn dropdown active"><a href="#"
						class="username"> <image class="userdp" src="images/u1.png"
								alt="DP"></image> Hello User,
					</a>
						<ul class="submenu">
							<li class="menu-item"><a href="#">Profile</a></li>
							<li class="menu-item"><a href="#">Log Out</a></li>
						</ul>
						
						</li>

				</ul>
			</nav>
		</div>
	</header>
	<section class="contact ">
		<div class="container full">
			<div class="row">
				<div class="bg-img"></div>

				<%
				DbConnection dbConn = new DbConnection();
				Connection connection = dbConn.getConnection();
				PreparedStatement preparedStatement;
				%>

				<%
				try {
					Statement statement = connection.createStatement();
					ResultSet resultSet = statement.executeQuery("SELECT * FROM customers where Id = " + userId + "");

					resultSet.next();
				%>

				<div class="col-lg-6 text ">
					<div class="section-title">
						<h4>
							Welcome <br><%=resultSet.getString(2)%>
						</h4>
						<p class="section-subtitle">PLAN YOUR NEXT VACATION WITH US</p>
					</div>


				</div>

				<div class="col-lg-6 sign-form">

					<div id="contact-form" name="contact-form">
						<h4 class="form-title">PERSONAL DETAILS</h4>
						<table class="guest-info">

							<tr>
								<td class="col-name">FULL NAME: <%=resultSet.getString(2)%></td>
								<td><span class="first-name" id="FirstnameID"></span></td>
							</tr>

							<tr>
								<td class="col-name">EMAIL: <%=resultSet.getString(3)%></td>
								<td><span class="email" id="emailID"></span></td>
							</tr>

							<tr>
								<td class="col-name">CONTACT NO: <%=resultSet.getString(4)%></td>
								<td><span class="contact-no" id="contactNoId"></span></td>
							</tr>

						</table>

						<a href="editprofile.jsp">
							<button class="btn btn-fw edit-btn">EDIT</button>
						</a>

					</div>
				</div>

				<%
				} catch (Exception e) {
				out.print(e.getMessage());
				}
				%>

				<%
				try {
					// Fetching reservations with joins
					String reservationQuery = "SELECT r.ReservationDate, r.NumberOfGuests, rest.Name as RestaurantName, "
					+ "f.Name as FoodName, r.Price, r.Type, r.Status " + "FROM reservations r "
					+ "LEFT JOIN customers c ON r.CustomerId = c.Id " + "LEFT JOIN restaurants rest ON r.RestaurantId = rest.Id "
					+ "LEFT JOIN foods f ON r.FoodId = f.Id " + "WHERE r.CustomerId = ?";

					preparedStatement = connection.prepareStatement(reservationQuery);
					preparedStatement.setInt(1, userId);
					ResultSet resultSet = preparedStatement.executeQuery();
				%>

				<div class="col-lg-12">
					<h4 class="form-title">YOUR RESERVATIONS</h4>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Reservation Date</th>
								<th>Number of Guests</th>
								<th>Restaurant</th>
								<th>Food</th>
								<th>Price</th>
								<th>Type</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							while (resultSet.next()) {
								String resDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(resultSet.getTimestamp("ReservationDate"));
								int numberOfGuests = resultSet.getInt("NumberOfGuests");
								String restaurantName = resultSet.getString("RestaurantName");
								String foodName = resultSet.getString("FoodName");
								double price = resultSet.getDouble("Price");
								int type = resultSet.getInt("Type");
								int status = resultSet.getInt("Status");
								String typeStr = (type == 1) ? "Take Away" : "Dine In";
								String statusStr = (status == 0) ? "Pending" : "Confirmed";
							%>
							<tr>
								<td><%=resDate%></td>
								<td><%=numberOfGuests%></td>
								<td><%=restaurantName%></td>
								<td><%=foodName%></td>
								<td><%=price%></td>
								<td><%=typeStr%></td>
								<td><%=statusStr%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>

				<%
				} catch (Exception e) {
				out.print(e.getMessage());
				} finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				%>




			</div>
		</div>

	</section>

	<!--=========== FOOTER==========-->

	<footer>
		<div class="footer-widgets">
			<div class="container">
				<div class="row">
					<!-- WIDGET -->
					<div class="col-md-4">
						<div class="footer-widget">
							<img src="images/logo ABC.png" class="nav-logo" alt="Hotel"
								style="width: 150px;">
							<div class="inner">
								<h6 style="letter-spacing: 1px;">Indulge in a dining
									experience that brings your culinary dreams to life.</h6>

							</div>
						</div>
					</div>

					<!-- WIDGET -->
					<div class="col-md-4">
						<div class="footer-widget">
							<h3>USEFUL LINKS</h3>
							<div class="inner">
								<ul class="useful-links">
									<li><a href="about-us.html">About Us</a></li>
									<li><a href="contact.html">Contact Us</a></li>
									<li><a href="shop.html">Shop</a></li>
									<li><a href="gallery.html">Himara Gallery</a></li>
									<li><a href="location.html">Our Location</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- WIDGET -->
					<div class="col-md-4">
						<div class="footer-widget">
							<h3>Contact Info</h3>
							<div class="inner">
								<ul class="contact-details">
									<li><i class="fa fa-map-marker" aria-hidden="true"></i>
										Colombo</li>
									<li><i class="fa fa-phone" aria-hidden="true"></i> Phone:
										+94 770 000 000</li>
									<li><i class="fa fa-fax"></i> Fax: +94 770 000 000</li>
									<li><i class="fa fa-globe"></i> Web: www.abcresturent.com</li>
									<li><i class="fa fa-envelope"></i> Email: <a
										href="mailto:info@site.com">abcresturent@gmail.com</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ========== JAVASCRIPT ========== -->

	<script src="js/page/loadProfile.js"></script>
	<script src="http://maps.google.com/maps/api/js?key=YOUR_API_KEY"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/jquery.mmenu.js"></script>
	<script src="js/jquery.inview.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/owl.carousel.thumbs.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/masonry.pkgd.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/countup.min.js"></script>
	<script src="js/moment.min.js"></script>
	<script src="js/daterangepicker.js"></script>
	<script src="js/parallax.min.js"></script>
	<script src="js/smoothscroll.min.js"></script>
	<script src="js/instafeed.min.js"></script>
	<script src="js/main.js"></script>
	<!-- ========== REVOLUTION SLIDER ========== -->

</body>
</html>
