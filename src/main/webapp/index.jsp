<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

<!-- ========== ICON FONTS ========== -->
<link href="fonts/font-awesome.min.css" rel="stylesheet">
<link href="fonts/flaticon.css" rel="stylesheet">
<!-- ========== GOOGLE FONTS ========== -->
<link
	href="https://fonts.googleapis.com/css?family=Oswald:400,500,600,700%7CRoboto:100,300,400,400i,500,700"
	rel="stylesheet">
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
			<nav id="main-menu" class="main-menu">
				<ul class="menu">
					<li class="menu-item dropdown active "><a href="index.jsp">HOME</a>

					</li>
					<li class="menu-item dropdown"><a
						href="facilities-Details.jsp">FACILITIES</a></li>
					<li class="menu-item dropdown"><a href="food.jsp">FOODS</a></li>

					<li class="menu-item"><a href="#contact">CONTACT US</a></li>

					<li class="menu-item menu-btn"><a href="signin.jsp" class="">SIGN
							IN</a></li>
					<li class="menu-item"><a class="signup-nav signuplink "
						href="signup.jsp">SIGN UP</a></li>


					<li class="menu-item menu-btn dropdown active"><a href=""
						class="btn ">HELLO USER</a>
						<ul class="submenu">
							<li class="menu-item"><a href="profile.jsp">Profile</a></li>
							<li class="menu-item"><a href="signin.jsp">Log Out</a></li>
						</ul></li>


				</ul>
			</nav>
		</div>
	</header>

	<!-- ========== REVOLUTION SLIDER ========== -->
	<div class="slider"
		style="background-color: #2b2b2b; color: #f1c40f; position: relative; overflow: hidden; display: flex; justify-content: center; align-items: center; height: 100vh;">
		<div class="rev_slider_wrapper fullwidthbanner-container">
			<div id="rev-slider-7"
				class="rev_slider color-slider gradient-slider op5"
				style="display: none;" data-version="5.4.5">
				<ul>

					<!-- SLIDE NR. 1  -->
					<li data-transition="crossfade">
						<!-- HTML5 BACKGROUND VIDEO LAYER -->
						<div class="rs-background-video-layer video-container"
							data-videopreload="auto" data-volume="mute" data-autoplay="true"
							data-forcerewind="on" data-nextslideatend="true"
							data-forcerewind="on" data-videowidth="100%"
							data-videoheight="100%" data-videoloop="loop"
							data-aspectratio="16:9" data-autoplayonlyfirsttime="false">
							<video class="rs-background-video-layer" autoplay muted loop
								id="myVideo"
								style="position: fixed; width: 100%; height: 100%; object-fit: cover; background: linear-gradient(to bottom, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.4)); z-index: -1; opacity: 0.5;">
								<source src="images/Video03.mp4" type="video/mp4">
							</video>

							<!-- Gradient Overlay -->
							<div
								style="position: fixed; width: 100%; height: 100%; z-index: 0;">
							</div>



						</div> <!-- LAYER NR. 1 -->
						<div class="tp-caption tp-resizeme" data-x="center"
							data-hoffset="" data-y="240" data-voffset=""
							data-responsive_offset="on" data-fontsize="['55','50','40','30']"
							data-lineheight="['55','50','40','30']" data-whitespace="nowrap"
							data-frames='[{"delay":1000,"speed":1500,"frame":"0","from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
							style="z-index: 5; Display; letter-spacing: 3px; color: #ffffff; font-weight: 950; text-align: center;">
							LIVE YOUR DREAM</div>
						<div class="tp-caption tp-resizeme" data-x="center"
							data-hoffset="" data-y="320" data-voffset=""
							data-responsive_offset="on" data-fontsize="['55','48','40','30']"
							data-lineheight="['55','48','40','30']" data-whitespace="nowrap"
							data-frames='[{"delay":1000,"speed":1500,"frame":"0","from":"y:[-100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;","mask":"x:0px;y:0px;s:inherit;e:inherit;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
							style="z-index: 5; Display; letter-spacing: 3px; color: #ffffff; font-weight: 900; text-align: center;">
							SAVOR EVERY MOMENT</div>
						<div class="tp-caption tp-resizeme" data-x="center"
							data-hoffset="" data-y="365" data-voffset=""
							data-responsive_offset="on" data-fontsize="['50','45','35','30']"
							data-lineheight="['50','45','35','30']" data-whitespace="nowrap"
							data-frames='[{"delay":1500,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
							style="z-index: 6; color: #e3e0a3; font-weight: 300;">
							____________________________</div> <!-- LAYER NR. 2 -->
						<div class="tp-caption tp-resizeme" data-x="center"
							data-hoffset="" data-y="430" data-voffset=""
							data-responsive_offset="on" data-fontsize="['20','20','15','10']"
							data-lineheight="['35','20','15','10']" data-whitespace="nowrap"
							data-frames='[{"delay":1500,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
							style="z-index: 6; color: #ffffff; font-weight: 400; letter-spacing: 1px; text-align: center;">
							Indulge in a dining experience that brings your culinary dreams
							to life. <br />

						</div> <!-- LAYER NR. 3 -->

						<div id="a" class="tp-caption btn bookb" data-x="center"
							data-hoffset="0" data-y="490" data-voffset=""
							data-responsive_offset="on" data-whitespace="nowrap"
							data-frames='[{"delay":2400,"speed":1500,"frame":"0","from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;","mask":"x:0px;y:[100%];s:inherit;e:inherit;","to":"o:1;","ease":"Power2.easeInOut"},{"delay":"wait","speed":500,"frame":"999","to":"auto:auto;","ease":"Power3.easeInOut"}]'
							style="z-index: 11;">

							<a id="b" class="booka" href="/signin"> ORDER NOW</a>


						</div>


					</li>

				</ul>
			</div>
		</div>
	</div>

	<!-- ========== ABOUT ========== -->
	<section class="about ">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="section-title ">
						<h4 class="text-uppercase ">ABC RESTURENT</h4>
						<p class="section-subtitle">A hotel in the heart of everything</p>

					</div>
					<div class="info-branding">
						<p>Welcome to ABC RESTURENT, where every meal is a
							masterpiece. Immerse yourself in our unique dining experience,
							where farm-to-table freshness meets innovative culinary artistry.
							From our signature dishes crafted with love to our inviting
							ambiance, we promise a memorable dining adventure for every
							palate. Discover your new favorite spot and savor the flavors
							that tell a story in every bite. Your table is waiting join us
							today!</p>

					</div>
				</div>
				<div class="col-lg-4"></div>
			</div>
		</div>
	</section>
	<!-- ========== ROOMS ========== -->
	<section class="rooms gray">
		<div class="container">
			<div class="section-title">
				<h4>OUR FACILITIES</h4>
				<p class="section-subtitle">Most Popular Facilities</p>
				<a href="rooms-list.html" class="view-all">View all rooms</a>
			</div>
			<div class="row">
				<!-- ITEM -->
				<div class="col-md-4">
					<div class="room-grid-item">
						<figure class="gradient-overlay-hover link-icon">
							<a href="room.html"> <img src="images/abc.jpg"
								class="img-fluid" alt="Image">
							</a>
							<div class="room-services">
								<i class="fa fa-coffee" aria-hidden="true" data-toggle="popover"
									data-placement="right" data-trigger="hover"
									data-content="Breakfast Included"
									data-original-title="Breakfast"></i> <i class="fa fa-wifi"
									aria-hidden="true" data-toggle="popover" data-placement="right"
									data-trigger="hover" data-content="Free WiFi"
									data-original-title="WiFi"></i> <i class="fa fa-television"
									data-toggle="popover" data-placement="right"
									data-trigger="hover"
									data-content="Plasma TV with cable channels"
									data-original-title="TV"></i>
							</div>
							<div class="room-price">Day / night</div>
						</figure>
						<div class="room-info">
							<h2 class="room-title">
								<a href="room.html">Dining Area</a>
							</h2>
							<p>See More</p>
						</div>
					</div>
				</div>
				<!-- ITEM -->
				<div class="col-md-4">
					<div class="room-grid-item">
						<figure class="gradient-overlay-hover link-icon">
							<a href="room.html"> <img src="images/abc.jpg"
								class="img-fluid" alt="Image">
							</a>
							<div class="room-services">
								<i class="fa fa-coffee" aria-hidden="true" data-toggle="popover"
									data-placement="right" data-trigger="hover"
									data-content="Breakfast Included"
									data-original-title="Breakfast"></i> <i class="fa fa-wifi"
									aria-hidden="true" data-toggle="popover" data-placement="right"
									data-trigger="hover" data-content="Free WiFi"
									data-original-title="WiFi"></i> <i class="fa fa-television"
									data-toggle="popover" data-placement="right"
									data-trigger="hover"
									data-content="Plasma TV with cable channels"
									data-original-title="TV"></i>
							</div>
							<div class="room-price">Day / night</div>
						</figure>
						<div class="room-info">
							<h2 class="room-title">
								<a href="room.html">Bar Area</a>
							</h2>
							<p>See More</p>
						</div>
					</div>
				</div>
				<!-- ITEM -->
				<div class="col-md-4">
					<div class="room-grid-item">
						<figure class="gradient-overlay-hover link-icon">
							<a href="room.html"> <img src="images/abc.jpg"
								class="img-fluid" alt="Image">
							</a>
							<div class="room-services">
								<i class="fa fa-coffee" aria-hidden="true" data-toggle="popover"
									data-placement="right" data-trigger="hover"
									data-content="Breakfast Included"
									data-original-title="Breakfast"></i> <i class="fa fa-bath"
									data-toggle="popover" data-placement="right"
									data-trigger="hover" data-content="2 Bathrooms"
									data-original-title="Bathroom"></i> <i class="fa fa-wifi"
									aria-hidden="true" data-toggle="popover" data-placement="right"
									data-trigger="hover" data-content="Free WiFi"
									data-original-title="WiFi"></i> <i class="fa fa-television"
									data-toggle="popover" data-placement="right"
									data-trigger="hover"
									data-content="Plasma TV with cable channels"
									data-original-title="TV"></i>
							</div>
							<div class="room-price">Day / night</div>
						</figure>
						<div class="room-info">
							<h2 class="room-title">
								<a href="room.html">Parking</a>
							</h2>
							<p>See More</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ========== SERVICES ========== -->
	<section class="info services-v2 ">
		<div class="container">
			<div class="section-title">
				<h4>WE OFFER</h4>
				<p class="section-subtitle">Check out our awesome services</p>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-12">
					<div class="services-v2-inner">
						<!-- MAIN IMAGE -->
						<div data-slider-id="services-v2"
							class="main-image services-v2-owl owl-carousel">
							<figure class="gradient-overlay">
								<img src="images/s1.jpg" class="img-fluid" alt="Image">
								<figcaption>
									<h4>Bar</h4>
								</figcaption>
							</figure>
							<figure class="gradient-overlay">
								<img src="images/s2.jpg" class="img-fluid" alt="Image">
								<figcaption>
									<h4>Gym</h4>
								</figcaption>
							</figure>
							<figure class="gradient-overlay">
								<img src="images/s3.jpg" class="img-fluid" alt="Image">
								<figcaption>
									<h4>Dining Area</h4>
								</figcaption>
							</figure>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="row">
						<!-- ITEM -->
						<div class="col-md-6 col-sm-6 col-6">
							<div class="countup-box box-shadow-005">
								<i class="flaticon-hotel"></i> <span class="number"
									data-count="100"></span>
								<div class="text">Rooms</div>
							</div>
						</div>
						<!-- ITEM -->
						<div class="col-md-6 col-sm-6 col-6">
							<div class="countup-box box-shadow-005">
								<i class="flaticon-tray"></i> <span class="number"
									data-count="2"></span>
								<div class="text">Restaurants</div>
							</div>
						</div>
						<!-- ITEM -->
						<div class="col-md-6 col-sm-6 col-6">
							<div class="countup-box box-shadow-005">
								<i class="flaticon-bell-boy"></i> <span class="number"
									data-count="18"></span>
								<div class="text">Staffs</div>
							</div>
						</div>
						<!-- ITEM -->
						<div class="col-md-6 col-sm-6 col-6">
							<div class="countup-box box-shadow-005">
								<i class="flaticon-sports"></i> <span class="number"
									data-count="3"></span>
								<div class="text">Swim. Pools</div>
							</div>
						</div>
						<!-- ITEM -->
						<div class="col-md-6 col-sm-6 col-6">
							<div class="countup-box box-shadow-005 nom">
								<i class="flaticon-screen"></i> <span class="number"
									data-count="15"></span>
								<div class="text">Conf. Rooms</div>
							</div>
						</div>
						<!-- ITEM -->
						<div class="col-md-6 col-sm-6 col-6">
							<div class="countup-box box-shadow-005 nom">
								<i class="flaticon-slider"></i> <span class="number"
									data-count="2"></span>
								<div class="text">Playgrounds</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- video_area_start -->
	<section class="video-area">

		<div class="container-fluid">
			<div class="parallax-image">
				<h3>Live Your Dream, Savor Every Moment</h3>
				<h5>
					Indulge in a dining experience that brings your culinary dreams to
					life. <br> Every dish is crafted to inspire and delight,<br>
					making every meal a journey of flavor and imagination.
				</h5>
			</div>
		</div>
	</section>
	<!-- ========== TESTIMONIALS ========== -->
	<section class="testimonials gray">
		<div class="container">
			<div class="section-title">
				<h4>OUR GUESTS LOVE US</h4>
				<p class="section-subtitle">What our guests are saying about us</p>
			</div>
			<div class="owl-carousel testimonials-owl">
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
						</div>
						<div class="rating">
							<i class="fa fa-star voted" aria-hidden="true"></i> <i
								class="fa fa-star voted" aria-hidden="true"></i> <i
								class="fa fa-star voted" aria-hidden="true"></i> <i
								class="fa fa-star voted" aria-hidden="true"></i> <i
								class="fa fa-star voted" aria-hidden="true"></i>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
				<!-- ITEM -->
				<div class="item">
					<div class="testimonial-item">
						<div class="author-img">
							<img alt="Image" class="img-fluid" src="images/u1.png">
						</div>
						<div class="author">
							<h4 class="name">JOHN PERERA</h4>
							<div class="location">SRI LANKA</div>
							<div class="rating">
								<i class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star voted" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
						</div>
						<h6 style="letter-spacing: 1px;">Indulge in a dining
							experience that brings your culinary dreams to life. Every dish
							is crafted to inspire and delight, making every meal a journey of
							flavor and imagination.</h6>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ========== CONTACT ========== -->
	<section id="contact" class="contact">
		<div class="container">
			<div class="section-title">
				<h4>CONTACT US</h4>
				<p class="section-subtitle">Get in touch</p>
			</div>
			<div class="row" style="display: flex; justify-content: center;">

				<div class="col-lg-6">
					<div class="contact-items">
						<div class="row">
							<div class="col-lg-6 col-sm-12">
								<div class="contact-item">
									<i class="fa fa-phone" aria-hidden="true"></i>
									<h6>+94 770 000 000</h6>
								</div>
							</div>
							<div class="col-lg-6 col-sm-12">
								<div class="contact-item">
									<i class="fa fa-envelope"></i>
									<h7>abcresturent@gmail.com</h7>
								</div>
							</div>
						</div>
					</div>
					<%
					DbConnection dBConnection = new DbConnection();
					Connection connection = dBConnection.getConnection();
					PreparedStatement preparedStatement = null;
					Statement statement = null;
					ResultSet resultSet = null;
					%>
					<form id="query-form" name="query-form"
						action="CreateQueriesServlet" method="post">
						<div class="form-group">
							<input class="form-control" name="queryText"
								placeholder="Query Text" type="text" required>
						</div>
						<div class="form-group">
							<input class="form-control" name="queryDate" type="date"
								placeholder="Query Date" required>
						</div>
						<div class="form-group">
							<input class="form-control" name="customerName"
								placeholder="Customer Name" type="text" required>
						</div>
						<div class="form-group">
							<input class="form-control" name="customerEmail" type="email"
								placeholder="Customer Email Address" required>
						</div>
						<div class="form-group">
							<label for="restaurantId">Restaurant:</label> <select
								id="restaurantId" name="restaurantId" required>
								<%
								try {
									Connection conn = dBConnection.getConnection();
									Statement stmt = conn.createStatement();
									ResultSet rs = stmt.executeQuery("SELECT Id, Name FROM restaurants");
									while (rs.next()) {
								%>
								<option value="<%=rs.getInt("Id")%>"><%=rs.getString("Name")%></option>
								<%
								}
								rs.close();
								stmt.close();
								} catch (Exception e) {
								out.print(e.getMessage());
								}
								%>
							</select>
						</div>
						<button class="btn btn-fw btn-light" type="submit">
							<i class="fa fa-location-arrow"></i> Send Query
						</button>
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
