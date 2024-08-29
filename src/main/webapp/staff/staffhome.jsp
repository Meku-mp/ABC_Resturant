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
<title>Hotel Heritance- ADMIN</title>
<meta content="" name="description">
<meta content="" name="keywords">
<meta content="" name="author">
<!-- ========== FAVICON ========== -->
<link rel="apple-touch-icon-precomposed" href="images/favicon-apple.png" />
<link rel="icon" href="images/favicon.png">
<!-- ========== STYLESHEETS ========== -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-select.min.css">
<link rel="stylesheet" href="../css/jquery.mmenu.css">
<link rel="stylesheet" href="../revolution/css/layers.css">
<link rel="stylesheet" href="../revolution/css/settings.css">
<link rel="stylesheet" href="../revolution/css/navigation.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/daterangepicker.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/responsive.css">
<link rel="stylesheet" href="../style/style.css">
<link rel="stylesheet" href="../style/stylesignin.css">
<link rel="stylesheet" href="../style/userdashboard.css">
<link rel="stylesheet" href="../style/rooms.css">
<link rel="stylesheet" href="../style/guestdetails.css">
<link rel="stylesheet" href="../style/adminhome.css">

<!-- ========== ICON FONTS ========== -->
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="fonts/flaticon.css" rel="stylesheet">
<!-- ========== GOOGLE FONTS ========== -->
<link
	href="https://fonts.googleapis.com/css?family=Oswald:400,500,600,700%7CRoboto:100,300,400,400i,500,700"
	rel="stylesheet">
</head>
<body class="dark">

	<%
	int staffId = 0;

	Cookie cookies[] = request.getCookies();

	for (Cookie c : cookies) {
		if (c.getName().equals("staffId")) {
			staffId = Integer.parseInt(c.getValue());
		}
	}

	if (staffId == 0) {
		response.sendRedirect("../adminlogin.jsp");
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
			<nav id="main-menu" class="main-menu">
				<ul class="menu">
					<li class="menu-item dropdown"><a href="staffhome.jsp">HOME</a></li>
					<li class="menu-item dropdown"><a href="staff.jsp">STAFF</a></li>
					<li class="menu-item"><a href="restaurants.jsp">RESATURANTS</a></li>
					<li class="menu-item dropdown"><a href="reservations.jsp">RESERVATIONS</a></li>
					<li class="menu-item dropdown"><a href="payments.jsp">PAYMENTS</a></li>
					<li class="menu-item"><a href="foods.jsp">FOODS</a></li>
					<li class="menu-item"><a href="facilities.jsp">FACILITIES</a></li>
					<li class="menu-item">
						<form action="../LogoutServlet" method="post">
							<button
								style="margin-top: 23px; padding: 5px; border-radius: 5%;">LOGOUT</button>
						</form>
					</li>

				</ul>
			</nav>
		</div>
	</header>

	<section class="box">
		<div class="container-fluid">
			<div class="row full-box">
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short">
					<a href="#">
						<div class="inside">
							<h3>STAFF</h3>
						</div>
					</a>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec">
					<a href="/registeredUsers">
						<div class="inside">
							<h3>RESTAURANTS</h3>
						</div>
					</a>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec">
					<a href="/reservationsList">
						<div class="inside">
							<h3>PAYMENTS</h3>
						</div>
					</a>
				</div>
			</div>
			<div class="row full-box">
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short">
					<a href="#">
						<div class="inside">
							<h3>STAFF</h3>
						</div>
					</a>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec">
					<a href="/registeredUsers">
						<div class="inside">
							<h3>RESTAURANTS</h3>
						</div>
					</a>
				</div>
				<div
					class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec">
					<a href="/reservationsList">
						<div class="inside">
							<h3>PAYMENTS</h3>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>


	<!-- ========== JAVASCRIPT ========== -->
	<script src="js/jquery.min.js"></script>
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
	<script src="revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script
		src="revolution/js/extensions/revolution.extension.video.min.js"></script>
</body>
</html>
