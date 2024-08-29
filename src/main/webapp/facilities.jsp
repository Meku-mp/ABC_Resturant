<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DbConnection"%>
<%@page import="model.Facility"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport">
<!-- ========== SEO ========== -->
<title>ABC Resturent</title>
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

<link rel="stylesheet" href="style/rooms.css">


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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap">

</head>
<body class="dark">
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
					<a href="/"> <img src="images/logo ABC.png" class="nav-logo"
						alt="Hotel Himara">
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
					<li class="menu-item dropdown"
						style="font-weight: bold; color: white;"><a href="/"
						style="color: white; text-decoration: none; font-weight: bold;">HOME</a>
					</li>
					<li class="menu-item dropdown"><a href="#"
						style="color: white; text-decoration: none; font-weight: bold;">ROOMS</a>

					</li>
					<li class="menu-item dropdown"><a href="#"
						style="color: white; text-decoration: none; font-weight: bold;">CONFERENCE
							HALLS</a></li>
					<li class="menu-item dropdown"><a href="#"
						style="color: white; text-decoration: none; font-weight: bold;">DINING</a>

					</li>

					<li class="menu-item"><a href="contact.html"
						style="color: white; text-decoration: none; font-weight: bold;">CONTACT
							US</a></li>
					<li class="menu-item menu-btn dropdown active"><a href="#"
						class="btn "
						style="color: white; text-decoration: none; font-weight: bold;">

							SIGN IN</a></li>
					<li class="menu-item "
						style="color: white; text-decoration: none; font-weight: bold;">
						<a class="signup-nav signuplink " href="/"
						style="color: white; text-decoration: none; font-weight: bold;">SIGN
							UP</a>
					</li>
				</ul>
			</nav>
		</div>
	</header>

	<section class="section-title">
		<div class="container-fluid">
			<div
				style="background-image: url('images/abc.jpg'); background-size: cover; background-position: center; height: 100vh; display: flex; align-items: center; justify-content: center;">
				<h1
					style="font-family: 'Poppins', sans-serif; font-weight: bold; color: white; text-align: center; margin: 0; font-size: 4em;">
					Exquisite Culinary Journey</h1>


			</div>

		</div>

	</section>
	<section class="rooms-list">
		<h1
			style="font-family: 'Poppins', sans-serif; font-weight: bold; color: black; text-align: center; margin: 0; font-size: 4em;">
			- OUR FACILITIES -</h1>

		<form action="FacilitiesSearch" method="post">
			<div style="text-align: center; margin-top: 30px;">
				<input type="text" placeholder="  Search..." name="name"
					style="padding: 10px 15px; font-size: 1.2em; border: 2px solid #4CAF50; border-radius: 25px; width: 300px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); outline: none; transition: border-color 0.3s ease, box-shadow 0.3s ease;"
					onfocus="this.style.borderColor='#81C784'; this.style.boxShadow='0 4px 10px rgba(0, 0, 0, 0.2)';"
					onblur="this.style.borderColor='#4CAF50'; this.style.boxShadow='0 4px 6px rgba(0, 0, 0, 0.1)';">

				<button
					style="padding: 10px 20px; font-size: 1.2em; type: submit border: none; border-radius: 25px; background-color: #4CAF50; color: white; cursor: pointer; margin-left: 10px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); transition: background-color 0.3s ease, box-shadow 0.3s ease;"
					onmouseover="this.style.backgroundColor='#45a049'; this.style.boxShadow='0 6px 8px rgba(0, 0, 0, 0.2)';"
					onmouseout="this.style.backgroundColor='#4CAF50'; this.style.boxShadow='0 4px 6px rgba(0, 0, 0, 0.1)';">
					Search</button>
			</div>
		</form>

		<%
		// Retrieve the facilities list from the request scope
		List<Facility> facilities = (List<Facility>) request.getAttribute("facilities");

		if (facilities != null && !facilities.isEmpty()) {
		%>
		<ul>
			<%
			// Loop through the facilities list and display each facility
			for (Facility facility : facilities) {
			%>
			<div
				style="flex: 1 1 calc(33.333% - 20px); max-width: calc(33.333% - 20px); box-sizing: border-box; border: 1px solid #ddd; border-radius: 12px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); overflow: hidden; background: #fff; transition: transform 0.3s, box-shadow 0.3s; padding: 0; margin: 0;">
				<!-- Image Section -->
				<div style="padding: 10px;">
					<figure style="margin: 0; border-radius: 12px; overflow: hidden;">
						<img src="<%=facility.getImagePath()%>"
							alt="Ocean View Room"
							style="width: 100%; height: auto; border-radius: 12px; object-fit: cover;">
					</figure>
				</div>
				<div style="padding: 20px; background-color: #f9f9f9;">
					<h4 style="font-size: 1.6em; margin-bottom: 10px; color: #333;"><%=facility.getName()%></h4>
					<div style="margin-bottom: 10px;">
						<span style="color: #f1c40f; font-size: 1.3em;"> <i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i> <i
							class="fa fa-star" aria-hidden="true"></i>
						</span>
					</div>
					<table
						style="width: 100%; border-collapse: collapse; margin-bottom: 15px;">
						<tr style="border-bottom: 1px solid #ddd;">
							<td style="padding: 8px; font-weight: bold;">RESTURENT</td>
							<td style="padding: 8px;"><%=facility.getRestaurantId()%></td>
						</tr>
						<tr style="border-bottom: 1px solid #ddd;">
							<td style="padding: 8px; font-weight: bold;">DESCRIPTION</td>
							<td style="padding: 8px;"><%=facility.getDescription()%></td>
						</tr>
					</table>
					<div style="margin-top: 10px;">
						<i class="fa fa-coffee"
							style="font-size: 1.6em; margin-right: 12px;"
							title="Breakfast Included"></i> <i class="fa fa-wifi"
							style="font-size: 1.6em; margin-right: 12px;" title="Free WiFi"></i>
						<i class="fa fa-television" style="font-size: 1.6em;"
							title="Plasma TV with cable channels"></i>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</ul>
		<%
		} else {
		%>

		<%
		DbConnection dBConnection = new DbConnection();
		Connection connection = dBConnection.getConnection();
		PreparedStatement preparedStatement;
		%>

		<%
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM facilities");
		%>

		<div
			style="display: flex; flex-wrap: wrap; gap: 20px; padding: 20px; justify-content: space-between;">
			<!-- Card Item -->
			<%
			while (resultSet.next()) {
			%>




			<div
				style="flex: 1 1 calc(33.333% - 20px); max-width: calc(33.333% - 20px); box-sizing: border-box; border: 1px solid #ddd; border-radius: 12px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); overflow: hidden; background: #fff; transition: transform 0.3s, box-shadow 0.3s; padding: 0; margin: 0;">
				<!-- Image Section -->
				<div style="padding: 10px;">
					<figure style="margin: 0; border-radius: 12px; overflow: hidden;">
						<img src="<%=resultSet.getString("ImagePath")%>"
							alt="Ocean View Room"
							style="width: 100%; height: auto; border-radius: 12px; object-fit: cover;">
					</figure>
				</div>
				<div style="padding: 20px; background-color: #f9f9f9;">
					<h4 style="font-size: 1.6em; margin-bottom: 10px; color: #333;"><%=resultSet.getString("Name")%></h4>
					<div style="margin-bottom: 10px;">
						<span style="color: #f1c40f; font-size: 1.3em;"> <i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i> <i
							class="fa fa-star" aria-hidden="true"></i>
						</span>
					</div>
					<table
						style="width: 100%; border-collapse: collapse; margin-bottom: 15px;">
						<tr style="border-bottom: 1px solid #ddd;">
							<td style="padding: 8px; font-weight: bold;">RESTURENT</td>
							<td style="padding: 8px;"><%=resultSet.getInt("RestaurantId")%></td>
						</tr>
						<tr style="border-bottom: 1px solid #ddd;">
							<td style="padding: 8px; font-weight: bold;">DESCRIPTION</td>
							<td style="padding: 8px;"><%=resultSet.getString("Description")%></td>
						</tr>
					</table>
					<div style="margin-top: 10px;">
						<i class="fa fa-coffee"
							style="font-size: 1.6em; margin-right: 12px;"
							title="Breakfast Included"></i> <i class="fa fa-wifi"
							style="font-size: 1.6em; margin-right: 12px;" title="Free WiFi"></i>
						<i class="fa fa-television" style="font-size: 1.6em;"
							title="Plasma TV with cable channels"></i>
					</div>
				</div>
			</div>


			<%
			}
			%>

		</div>

		<%
		} catch (Exception e) {
		out.print(e.getMessage());
		} finally {
		if (connection != null) {
			try {
				connection.close();
			} catch (Exception ignore) {
			}
		}
		}
		%>

		<%
		}
		%>



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
									<li><a href="shop.html">Resturent</a></li>
									<li><a href="gallery.html">Gallery</a></li>
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

	<script src="js/page/payment.js"></script>

</body>
</html>
