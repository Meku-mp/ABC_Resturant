<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
<link rel="stylesheet" href="style/stylesignin.css">
<link rel="stylesheet" href="style/stylesignup.css">

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
<body class="dark">
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

	<%
	DbConnection dBConnection = new DbConnection();
	Connection connection = dBConnection.getConnection();
	PreparedStatement preparedStatement = null;
	Statement statement = null;
	ResultSet resultSet = null;
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
					<a href="/"> <img src="images/logo ABC.png" class="nav-logo"
						alt="Hotel" style="width: 150px;">
					</a>
				</div>
			</div>
			<!-- MOBILE MENU BUTTON -->
			<div id="toggle-menu-button" class="toggle-menu-button">
				<span class="line"></span> <span class="line"></span> <span
					class="line"></span>
			</div>
			<!-- MAIN MENU -->
	</header>
	<!-- ========== Sign up ========== -->
	<section class="contact "
		style="background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)), url('images/abc.jpg'); background-size: cover; background-position: center; background-attachment: fixed;">
		<div class="container full">



			<div class="container">
				<!-- Take Away Section -->
				<div class="row" id="takeaway-section">
					<div class="bg-img"></div>
					<div class="col-lg-6 text">

						<div class="section-title" style="color: white">
							<h4 style="color: white">
								TAKE <br>AWAY
							</h4>
							<p class="section-subtitle" style="color: white">The "Order
								Now" page is where excitement meets convenience. With a sleek,
								intuitive design, users can effortlessly explore products,
								customize their selections, and finalize their purchase with
								just a few clicks.</p>
						</div>
						<h6>Change Reservation Type To Dine In</h6>
						<div class="sign-up-btn" id="dinein-btn">
							<a class="link">Dine In</a>
						</div>
					</div>
					<div class="col-lg-6 sign-form"
						style="position: relative; padding: 50px;">
						<!-- Take Away Form -->

						<form method="post" action="CreateReservationServlet" style="background: #2b2b2b; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <input type="text" name="type" value="takeAway" hidden="true" />
    <h4 class="form-title" style="color: #f1c40f; text-align: center; font-family: 'Roboto', sans-serif;">Place Your Order</h4>
    <br />

    <div class="form-group has-validation" style="display: flex; align-items: center; width: 100%; max-width: 600px; margin: auto; flex-direction: column;">
        <div style="width: 100%; margin-bottom: 15px;">
            <label for="restaurantId" style="color: #f1c40f; font-size: 18px;">Restaurant</label>
<select id="restaurantId" name="restaurantId" required style="width: 200px; padding: 10px; border-radius: 5px; border: 1px solid #007bff; background-color: #333; color: #fff; font-size: 16px;">
    <option value="" disabled selected>Select Restaurant</option>
    <% try {
        Connection conn = dBConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT Id, Name FROM restaurants");
        while (rs.next()) {
    %>
    <option value="<%=rs.getInt("Id")%>"><%=rs.getString("Name")%></option>
    <% } rs.close(); stmt.close(); } catch (Exception e) { out.print(e.getMessage()); } %>
</select>


        </div>
        <div style="width: 100%; margin-bottom: 15px;">
    <label for="restaurantId" style="color: #f1c40f; font-size: 18px;">Email</label>
        <input type="email" name="email" placeholder="someone@example.com" style="width: 100%; padding: 12px; border-radius: 5px; border: 1px solid #007bff; background-color: #333; color: #fff; font-size: 16px;" />
 </div>
        

        <div style="width: 100%; margin-bottom: 15px;">
            <label for="food-options" style="color: #f1c40f; font-size: 18px;">Select Food</label>
            <select class="form-control" name="food" id="food-options" required style="width: 100%; padding: 12px; border-radius: 5px; border: 1px solid #007bff; background-color: #333; color: #fff; font-size: 16px;">
                <option value="" disabled selected>Select Food</option>
                <option value="1">Pizza</option>
                <option value="2">Burger</option>
                <option value="3">Pasta</option>
                <option value="4">Sushi</option>
            </select>
        </div>

        <div class="form-group has-validation" style="width: 100%; position: relative;">
            <label for="validationCustomDateTime" style="color: #f1c40f; font-size: 18px;">Select Date and Time</label>
            <input class="form-control" name="datetime" type="datetime-local" id="validationCustomDateTime" required style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #007bff; background-color: #333; color: #fff; font-size: 16px;" />
            <div class="invalid-feedback" style="color: red; font-size: 14px; margin-top: 5px;">Please select a valid date and time.</div>
        </div>

        <div class="form-group has-validation" style="width: 100%; max-width: 600px; margin: auto; margin-top: 15px;">
            <div style="display: flex; align-items: center; border: 1px solid #007bff; border-radius: 8px; padding: 10px; background-color: #333; font-size: 18px; color: #f1c40f;">
                <span id="price-display" style="flex: 1; text-align: center;">Rs. 0.00</span>
            </div>
        </div>
    </div>

    <br />

    <div style="display: flex; gap: 10px; width: 100%; max-width: 600px; margin: auto;">
        <!-- First Button -->
        <button class="btn btn-fw btn-light" type="submit" style="background-color: #f1c40f; color: #2b2b2b; flex: 1; padding: 12px; border: none; border-radius: 8px; font-size: 18px; cursor: pointer; transition: background-color 0.3s ease;">
            PLACE ORDER
        </button>

        <!-- Second Button -->
        <button class="btn btn-fw btn-light" type="button" style="background-color: red; color: #ffffff; flex: 1; padding: 12px; border: none; border-radius: 8px; font-size: 18px; cursor: pointer; transition: background-color 0.3s ease;" onclick="location.href='home.html'">
            CANCEL
        </button>
    </div>
</form>

					</div>
				</div>

				<!-- Dine In Section -->
				<div class="row" id="dinein-section" style="display: none;">
					<div class="bg-img"></div>
					<div class="col-lg-6 text">

						<div class="section-title" style="color: white">
							<h4 style="color: white">
								DINE<br>IN
							</h4>
							<p class="section-subtitle" style="color: white">The "Order
								Now" page is where excitement meets convenience. With a sleek,
								intuitive design, users can effortlessly explore products,
								customize their selections, and finalize their purchase with
								just a few clicks.</p>
						</div>
						<h6>Change Reservation Type To Take Away</h6>
						<div class="sign-up-btn" id="takeaway-btn">
							<a class="link" href="#">Take Away</a>
						</div>
					</div>
					<div class="col-lg-6 sign-form">
						<!-- Dine In Form -->
					<form method="post" action="CreateReservationServlet" style="max-width: 800px; margin: auto; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); background-color: #ffffff;">
    <input type="text" name="type" value="dineIn" hidden="true" />
    <h4 class="form-title" style="color: #f1c40f; text-align: center; font-size: 24px; margin-bottom: 20px;">Place Your Order</h4>

    <div style="margin-bottom: 15px;">
        <label for="restaurantId" style="display: block; font-size: 16px; margin-bottom: 5px;">Restaurant:</label>
        <select id="restaurantId" name="restaurantId" required style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #007bff; background-color: #f9f9f9; font-size: 16px;">
            <% try { 
                Connection conn = dBConnection.getConnection(); 
                Statement stmt = conn.createStatement(); 
                ResultSet rs = stmt.executeQuery("SELECT Id, Name FROM restaurants"); 
                while (rs.next()) { %>
                    <option value="<%=rs.getInt("Id")%>"><%=rs.getString("Name")%></option>
            <% } 
                rs.close(); 
                stmt.close(); 
            } catch (Exception e) { 
                out.print(e.getMessage()); 
            } %>
        </select>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="email" style="display: block; font-size: 16px; margin-bottom: 5px;">Email:</label>
        <input type="email" name="email" placeholder="someone@example.com" required style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #007bff; background-color: #f9f9f9; font-size: 16px;" />
    </div>

    <div style="margin-bottom: 15px;">
        <label for="noOfguests" style="display: block; font-size: 16px; margin-bottom: 5px;">No of guests:</label>
        <select id="noOfguests" name="noOfguests" required style="width: 100%; padding: 10px; border-radius: 8px; border: 1px solid #007bff; background-color: #f9f9f9; font-size: 16px;">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
    </div>

    <div style="margin-bottom: 15px;">
        <label for="datetime" style="display: block; font-size: 16px; margin-bottom: 5px;">Date and Time:</label>
        <input class="form-control" name="datetime" type="datetime-local" id="validationCustomDateTime" required style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #007bff; background-color: #ffffff; color: #333; font-size: 16px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); cursor: pointer;" />
        <div class="invalid-feedback" style="color: red; font-size: 14px; margin-top: 5px;">Please select a valid date and time.</div>
    </div>

<!--     <div style="display: flex; align-items: center; justify-content: center; border: 1px solid #007bff; border-radius: 8px; padding: 10px; background-color: #333; font-size: 18px; color: #f1c40f; margin-bottom: 20px;">
        <span id="price-display" style="flex: 1; text-align: center;">Rs. 0.00</span>
    </div> -->

    <div style="display: flex; gap: 10px; width: 100%; justify-content: center;">
        <!-- First Button -->
        <button class="btn btn-fw btn-light" type="submit" style="background-color: #f1c40f; color: #2b2b2b; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; transition: background-color 0.3s;">
            PLACE ORDER
        </button>

        <!-- Second Button -->
        <button class="btn btn-fw btn-light" type="button" style="background-color: red; color: #ffffff; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; transition: background-color 0.3s;">
            CANCEL
        </button>
    </div>
</form>

					</div>
				</div>
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
	<%--<script src="js/jquery.min.js"></script>--%>

	<!-- ========== Page JS ========== -->
	<script>
		$(document).ready(
				function() {
					$('#dinein-btn').click(
							function() {
								$('#takeaway-section').addClass('fade-out')
										.removeClass('fade-in');
								$('#dinein-section').addClass('fade-in')
										.removeClass('fade-out');
								setTimeout(function() {
									$('#takeaway-section').hide();
									$('#dinein-section').show();
								}, 700); // Match the duration of your fadeOut animation
							});

					$('#takeaway-btn').click(
							function() {
								$('#dinein-section').addClass('fade-out')
										.removeClass('fade-in');
								$('#takeaway-section').addClass('fade-in')
										.removeClass('fade-out');
								setTimeout(function() {
									$('#dinein-section').hide();
									$('#takeaway-section').show();
								}, 700); // Match the duration of your fadeOut animation
							});
				});
	</script>

	<style>
#takeaway-section, #dinein-section {
	transition: opacity 0.7s ease-in-out, transform 0.7s ease-in-out;
	opacity: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	transform: translateY(0);
}

#takeaway-section.hidden, #dinein-section.hidden {
	opacity: 0;
	pointer-events: none;
	transform: translateY(50px);
}

.fade-in {
	animation: fadeIn 0.7s ease-in-out forwards;
}

.fade-out {
	animation: fadeOut 0.7s ease-in-out forwards;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(50px) scale(0.9);
}

to {
	opacity: 1;
	transform: translateY(0) scale(1);
}

}
@
keyframes fadeOut {from { opacity:1;
	transform: translateY(0) scale(1);
}

to {
	opacity: 0;
	transform: translateY(50px) scale(0.9);
}
}
</style>

	<%--<script src="http://maps.google.com/maps/api/js?key=YOUR_API_KEY"></script>--%>
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
	<script src="js/validation/validation.js"></script>

	<script type="text/javascript">
		// Function to generate a random price value
		function generateRandomPrice() {
			return (Math.random() * 1000).toFixed(2); // Generates a random price between 0 and 1000
		}

		// Function to handle food option change
		function onFoodOptionChange() {
			const priceElement = document.querySelector('#price-display'); // The element where the price will be displayed
			const randomPrice = generateRandomPrice();
			priceElement.textContent = `Rs. 2000`;
		}

		// Attach the function to the food option change event
		document.querySelector('#food-options').addEventListener('change',
				onFoodOptionChange);
	</script>


</body>
</html>