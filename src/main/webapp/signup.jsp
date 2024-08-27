<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
    <!-- ========== SEO ========== -->
    <title>ABC Resturent</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta content="" name="author">
    <!-- ========== FAVICON ========== -->
    <link rel="apple-touch-icon-precomposed" href="images/favicon-apple.png"/>
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
    <link href="https://fonts.googleapis.com/css?family=Oswald:400,500,600,700%7CRoboto:100,300,400,400i,500,700"
          rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body class="dark">
<!-- ========== MOBILE MENU ========== -->
<nav id="mobile-menu"> </nav>
<!--Navbar-->

<header class="horizontal-header sticky-header transparent-header " data-menutoggle="991" >

    <!--Header-->
    <div class="container">
        <!-- BRAND -->
        <div class="brand">
            <div class="logo">
                <a href="/">
      <img src="images/logo ABC.png" class="nav-logo" alt="Hotel" style="width: 150px;">
                </a>
            </div>
        </div>
        <!-- MOBILE MENU BUTTON -->
        <div id="toggle-menu-button" class="toggle-menu-button">
            <span class="line"></span>
            <span class="line"></span>
            <span class="line"></span>
        </div>
        <!-- MAIN MENU -->

    </div>
</header>
<!-- ========== Sign up ========== -->
<section class="contact " style="background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)), url('images/abc.jpg'); background-size: cover; background-position: center; background-attachment: fixed;">
    <div class="container full">
        <div class="row">
            <div class="bg-img"></div>
            <div class="col-lg-6 text ">
            <br/><br/><br/>
                <div class="section-title" style="z-index: 5; Display;letter-spacing: 3px; color: #ffffff; font-weight: 800;">
                    <h4 style="color:white">Hello <br>WELCOME</h4>
                    <p class="section-subtitle" style="color:white">Sign up and start planning your vacation</p>
                </div>


                <h6>Already have an account?</h6>
                <div class="sign-up-btn" >
                    <a class="link" href="/signin">Sign In</a>
                </div>

            </div>
            
            <div class="col-lg-6 sign-form" >
            
                <form method=post id="contact-form" name="contact-form" class="needs-validation" oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")' novalidate>
                                <h4 class="form-title" style="color: #f1c40f; text-align: center;">Register Now</h4>  
                  <br/>
                    <div class="form-group has-validation">
                        <input class="form-control" name="fname" placeholder="Fist Name" type="text"id="validationFirstname" required>
                        <div class="invalid-feedback">
                            This field cannot be empty.
                        </div>
                    </div>
                    <div class="form-group has-validation">
                        <input class="form-control" name="lname" placeholder="Last Name" type="text" id="validationLastname" required>
                        <div class="invalid-feedback">
                            This field cannot be empty.
                        </div>
                    </div>
                    <div class="form-group has-validation">
                        <input class="form-control" name="username" type="text" placeholder="Username" id="validationCustomUsername" required>
                        <div class="invalid-feedback">
                            Please enter a valid username.
                        </div>
                    </div>
                    <div class="form-group has-validation">
                        <input class="form-control" name="email" type="email" placeholder="Email Address" id="validationEmail" required>
                        <div class="invalid-feedback">
                            Please enter a valid email.
                        </div>
                    </div>
                    <div class="form-group has-validation">
                        <input class="form-control" name="password" type="password" placeholder="Password" id="validationPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                        <div class="invalid-feedback">
                            Please enter a valid password. <br>(Password should contain a minimum of 8 characters including lowercase , uppercase letters & numbers )
                        </div>
                    </div>
                    <div class="form-group has-validation">
                        <input class="form-control" name="confirmPassword" type="password" placeholder="Confirm Password" id="validationConfirmPassword" required>
                        <div class="invalid-feedback" id="password-empty">
                            Please confirm your password.
                        </div>

                    </div>
                  <button class="btn btn-fw btn-light" type="submit"
							style="background-color: #f1c40f; color: #2b2b2b; width: 100%; padding: 10px;">Sign
							Up</button>
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
      <img src="images/logo ABC.png" class="nav-logo" alt="Hotel" style="width: 150px;">
            <div class="inner">
              <h6 style="letter-spacing: 1px;">Indulge in a dining experience that brings your culinary dreams to life.</h6>
             
            </div>
          </div>
        </div>
        
        <!-- WIDGET -->
        <div class="col-md-4">
          <div class="footer-widget">
            <h3>USEFUL LINKS</h3>
            <div class="inner">
              <ul class="useful-links">
                <li>
                  <a href="about-us.html">About Us</a>
                </li>
                <li>
                  <a href="contact.html">Contact Us</a>
                </li>
                <li>
                  <a href="shop.html">Shop</a>
                </li>
                <li>
                  <a href="gallery.html">Himara Gallery</a>
                </li>
                <li>
                  <a href="location.html">Our Location</a>
                </li>
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
                <li>
                  <i class="fa fa-map-marker" aria-hidden="true"></i>
                  Colombo</li>
                <li>
                  <i class="fa fa-phone" aria-hidden="true"></i>
                  Phone: +94 770 000 000
                </li>
                <li>
                  <i class="fa fa-fax"></i>
                  Fax: +94 770 000 000</li>
                <li>
                  <i class="fa fa-globe"></i>
                  Web: www.abcresturent.com</li>
                <li>
                  <i class="fa fa-envelope"></i>
                  Email:
                  <a href="mailto:info@site.com">abcresturent@gmail.com</a>
                </li>
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

</script>


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


</body>
</html>