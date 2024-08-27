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
<title>ABC Restaurant</title>
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
		
		</div>
	</header>

	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	%>
	<!-- ========== Sign in  ========== -->
	<section class="contact"
		style="background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)), url('images/abc.jpg'); background-size: cover; background-position: center; background-attachment: fixed;">


		<div class="container full"
			style="position: relative; z-index: 1; display: flex; justify-content: center; align-items: center; width: 100%; max-width: 1200px; top: 100px;">
			<div class="row"
				style="display: flex; width: 100%; max-width: 1000px; margin: 0;">

			   <div class="col-lg-6 text ">
            
                <div class="section-title" style="z-index: 5; Display;letter-spacing: 3px; color: #ffffff; font-weight: 500;">
                    <h4 style="color:white">Hello <br>There</h4>
                    <p class="section-subtitle" style="color:white">Sign up and start planning your vacation</p>
                </div>


                <h6>Do You Want Create an account?</h6>
                <div class="sign-up-btn" >
                    <a class="link" href="/signin">Sign Up</a>
                </div>

            </div>
				<div class="col-lg-6 "
					style="display: flex; justify-content: center; align-items: center; top: 20px">
					<form class="needs-validation" method="post"
						action="UserLoginServlet" novalidate
						style="width: 100%; max-width: 400px;">
						<h4 class="form-title" style="color: #f1c40f; text-align: center;">Sign
							In With us</h4>
							
						<div class="form-group has-validation"
							style="margin-bottom: 25px;">
							<input class="form-control" name="username" type="text"
								placeholder="Username" required style="border-color: #f1c40f;">
							<div class="invalid-feedback">Please enter a valid
								Username.</div>
						</div>
						
						<div class="form-group has-validation"
							style="margin-bottom: 25px;">
							<input class="form-control" name="password" type="password"
								placeholder="Password" required style="border-color: #f1c40f;">
							<div class="invalid-feedback">Please enter a password.</div>
						</div>


						<%
						if (errorMessage != null && !errorMessage.isEmpty()) {
						%>
						<div class="error" style="color: red"><%=errorMessage%></div>
						<%
						}
						%>
						<button class="btn btn-fw btn-light" type="submit"
							style="background-color: #f1c40f; color: #2b2b2b; width: 100%; padding: 10px;">Sign
							In</button>
					</form>
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
	<!-- ========== Page JS ========== -->

	<!-- <script src="js/jquery.min.js"></script> -->
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

</body>
</html>