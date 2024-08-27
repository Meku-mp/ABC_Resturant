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
      <div class="logo" >
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

</header>
<!-- ========== Sign up ========== -->
<section class="contact " style="background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)), url('images/abc.jpg'); background-size: cover; background-position: center; background-attachment: fixed;">
    <div class="container full">
    
    
    
<div class="container">
    <!-- Take Away Section -->
    <div class="row" id="takeaway-section">
        <div class="bg-img"></div>
        <div class="col-lg-6 text">
            
            <div class="section-title" style="color:white">
                <h4 style="color:white">TAKE <br>AWAY</h4>
                <p class="section-subtitle" style="color:white">The "Order Now" page is where excitement meets convenience. With a sleek, intuitive design, users can effortlessly explore products, customize their selections, and finalize their purchase with just a few clicks.</p>
            </div>
            <h6>Change Reservation Type To Dine In</h6>
            <div class="sign-up-btn"  id="dinein-btn">
                <a class="link" href="#">Dine In</a>
            </div>
        </div>
        <div class="col-lg-6 sign-form" style="position: relative; padding: 50px;">
            <!-- Take Away Form -->
           
            <form method="post" id="contact-form" name="contact-form" class="needs-validation" novalidate>
               <h4 class="form-title" style="color: #f1c40f; text-align: center;">Place Your Order</h4>
               <br/> 
<div class="form-group has-validation" style="display: flex; align-items: center; width: 100%; max-width: 600px; margin: auto;">



    <!-- Dropdown Menu -->
    <div style="flex: 1; margin-right: 10px;">
        <select class="form-control" name="food" id="validationFood" required 
                style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: 0 2px 4px rgba(0,0,0,0.1); background-color: #f8f9fa; color: #000000; font-size: 16px; appearance: none; cursor: pointer; width: 100%;">
            <option value="" disabled selected>Select Food</option>
            <option value="pizza">Pizza</option>
            <option value="burger">Burger</option>
            <option value="pasta">Pasta</option>
            <option value="sushi">Sushi</option>
        </select>
    </div>

    <!-- Quantity Selector -->
    <div style="flex: 0 0 150px;">
        <div style="display: flex; align-items: center;">
            <button type="button" onclick="decreaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 5px 0 0 5px; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">-</button>
            <input type="number" id="quantity" name="quantity" min="1" value="1" style="text-align: center; border: 1px solid #ccc; border-left: none; border-radius: 0; padding: 10px; font-size: 16px; width: 100%;">
            <button type="button" onclick="increaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 0 5px 5px 0; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">+</button>
        </div>
    </div>

    <div class="invalid-feedback" style="color: red; font-size: 14px; width: 100%; margin-top: 5px;">This field cannot be empty.</div>
</div>

<script>
    function decreaseQuantity() {
        var input = document.getElementById('quantity');
        if (input.value > 1) {
            input.value--;
        }
    }

    function increaseQuantity() {
        var input = document.getElementById('quantity');
        input.value++;
    }
</script>


<br/>

<div class="form-group has-validation" style="display: flex; align-items: center; width: 100%; max-width: 600px; margin: auto;">
    <!-- Dropdown Menu -->
    <div style="flex: 1; margin-right: 10px;">
        <select class="form-control" name="beverage" id="validationBeverage" required 
                style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: 0 2px 4px rgba(0,0,0,0.1); background-color: #f8f9fa; color: #000000; font-size: 16px; appearance: none; cursor: pointer; width: 100%;">
            <option value="" disabled selected>Select Beverage</option>
            <option value="coffee">Coffee</option>
            <option value="tea">Tea</option>
            <option value="juice">Juice</option>
            <option value="soda">Soda</option>
        </select>
    </div>

    <!-- Quantity Selector -->
    <div style="flex: 0 0 150px;">
        <div style="display: flex; align-items: center;">
            <button type="button" onclick="decreaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 5px 0 0 5px; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">-</button>
            <input type="number" id="quantity" name="quantity" min="1" value="1" style="text-align: center; border: 1px solid #ccc; border-left: none; border-radius: 0; padding: 10px; font-size: 16px; width: 100%;">
            <button type="button" onclick="increaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 0 5px 5px 0; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">+</button>
        </div>
    </div>

    <div class="invalid-feedback" style="color: red; font-size: 14px; width: 100%; margin-top: 5px;">This field cannot be empty.</div>
</div>

<script>
    function decreaseQuantity() {
        var input = document.getElementById('quantity');
        if (input.value > 1) {
            input.value--;
        }
    }

    function increaseQuantity() {
        var input = document.getElementById('quantity');
        input.value++;
    }
</script>


<br/>

<div class="form-group has-validation" style="position: relative; width: 100%;">
    <input class="form-control" name="datetime" type="datetime-local" id="validationCustomDateTime" required
           style="padding: 12px; border-radius: 8px; border: 1px solid #007bff; background-color: #ffffff; color: #333; font-size: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.2); appearance: none; cursor: pointer; width: 100%;"/>
    <div class="invalid-feedback" style="color: red; font-size: 14px; margin-top: 5px;">Please select a valid date and time.</div>
</div>


           <div class="form-group has-validation" style="width: 100%; max-width: 600px; margin: auto;">
    <!-- Non-editable Price Field -->
    <div style="display: flex; align-items: center; border: 1px solid #ccc; border-radius: 5px; padding: 10px; background-color: #f8f9fa; font-size: 16px; color: #333;">
        <span style="flex: 1; text-align: center;">Rs.0.00</span>
    </div>
    <div class="invalid-feedback" style="color: red; font-size: 14px; width: 100%; margin-top: 5px;">PRICE</div>
</div>


<br/> <br/> 
          
<div style="display: flex; gap: 10px; width: 100%; max-width: 600px; margin: auto;">
    <!-- First Button -->
    <button class="btn btn-fw btn-light" type="submit" style="background-color: #f1c40f; color: #2b2b2b; flex: 1; padding: 10px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">
        PLACE ORDER
    </button>

    <!-- Second Button -->
    <button class="btn btn-fw btn-light" type="button" style="background-color: red; color: #ffffff; flex: 1; padding: 10px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">
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
          
            <div class="section-title" style="color:white">
                <h4 style="color:white">DINE<br>IN</h4>
                <p class="section-subtitle" style="color:white">The "Order Now" page is where excitement meets convenience. With a sleek, intuitive design, users can effortlessly explore products, customize their selections, and finalize their purchase with just a few clicks.</p>
            </div>
            <h6>Change Reservation Type To Take Away</h6>
            <div class="sign-up-btn" id="takeaway-btn">
                <a class="link" href="#" >Take Away</a>
            </div>
        </div>
        <div class="col-lg-6 sign-form">
            <!-- Dine In Form -->
                <form method="post" id="contact-form" name="contact-form" class="needs-validation" novalidate>
               <h4 class="form-title" style="color: #f1c40f; text-align: center;">Place Your Order</h4>
               <br/> 
<div class="form-group has-validation" style="display: flex; align-items: center; width: 100%; max-width: 600px; margin: auto;">



    <!-- Dropdown Menu -->
    <div style="flex: 1; margin-right: 10px;">
        <select class="form-control" name="food" id="validationFood" required 
                style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: 0 2px 4px rgba(0,0,0,0.1); background-color: #f8f9fa; color: #000000; font-size: 16px; appearance: none; cursor: pointer; width: 100%;">
            <option value="" disabled selected>Select Food</option>
            <option value="pizza">Pizza</option>
            <option value="burger">Burger</option>
            <option value="pasta">Pasta</option>
            <option value="sushi">Sushi</option>
        </select>
    </div>

    <!-- Quantity Selector -->
    <div style="flex: 0 0 150px;">
        <div style="display: flex; align-items: center;">
            <button type="button" onclick="decreaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 5px 0 0 5px; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">-</button>
            <input type="number" id="quantity" name="quantity" min="1" value="1" style="text-align: center; border: 1px solid #ccc; border-left: none; border-radius: 0; padding: 10px; font-size: 16px; width: 100%;">
            <button type="button" onclick="increaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 0 5px 5px 0; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">+</button>
        </div>
    </div>

    <div class="invalid-feedback" style="color: red; font-size: 14px; width: 100%; margin-top: 5px;">This field cannot be empty.</div>
</div>

<script>
    function decreaseQuantity() {
        var input = document.getElementById('quantity');
        if (input.value > 1) {
            input.value--;
        }
    }

    function increaseQuantity() {
        var input = document.getElementById('quantity');
        input.value++;
    }
</script>


<br/>

<div class="form-group has-validation" style="display: flex; align-items: center; width: 100%; max-width: 600px; margin: auto;">
    <!-- Dropdown Menu -->
    <div style="flex: 1; margin-right: 10px;">
        <select class="form-control" name="beverage" id="validationBeverage" required 
                style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: 0 2px 4px rgba(0,0,0,0.1); background-color: #f8f9fa; color: #000000; font-size: 16px; appearance: none; cursor: pointer; width: 100%;">
            <option value="" disabled selected>Select Beverage</option>
            <option value="coffee">Coffee</option>
            <option value="tea">Tea</option>
            <option value="juice">Juice</option>
            <option value="soda">Soda</option>
        </select>
    </div>

    <!-- Quantity Selector -->
    <div style="flex: 0 0 150px;">
        <div style="display: flex; align-items: center;">
            <button type="button" onclick="decreaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 5px 0 0 5px; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">-</button>
            <input type="number" id="quantity" name="quantity" min="1" value="1" style="text-align: center; border: 1px solid #ccc; border-left: none; border-radius: 0; padding: 10px; font-size: 16px; width: 100%;">
            <button type="button" onclick="increaseQuantity()" style="padding: 10px; border: 1px solid #ccc; border-radius: 0 5px 5px 0; background-color: #f8f9fa; cursor: pointer; font-size: 16px;">+</button>
        </div>
    </div>

    <div class="invalid-feedback" style="color: red; font-size: 14px; width: 100%; margin-top: 5px;">This field cannot be empty.</div>
</div>

<script>
    function decreaseQuantity() {
        var input = document.getElementById('quantity');
        if (input.value > 1) {
            input.value--;
        }
    }

    function increaseQuantity() {
        var input = document.getElementById('quantity');
        input.value++;
    }
</script>


<br/>

<div class="form-group has-validation" style="position: relative; width: 100%;">
    <input class="form-control" name="datetime" type="datetime-local" id="validationCustomDateTime" required
           style="padding: 12px; border-radius: 8px; border: 1px solid #007bff; background-color: #ffffff; color: #333; font-size: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.2); appearance: none; cursor: pointer; width: 100%;"/>
    <div class="invalid-feedback" style="color: red; font-size: 14px; margin-top: 5px;">Please select a valid date and time.</div>
</div>


           <div class="form-group has-validation" style="width: 100%; max-width: 600px; margin: auto;">
    <!-- Non-editable Price Field -->
    <div style="display: flex; align-items: center; border: 1px solid #ccc; border-radius: 5px; padding: 10px; background-color: #f8f9fa; font-size: 16px; color: #333;">
        <span style="flex: 1; text-align: center;">Rs.0.00</span>
    </div>
    <div class="invalid-feedback" style="color: red; font-size: 14px; width: 100%; margin-top: 5px;">PRICE</div>
</div>


<br/> <br/> 
          
<div style="display: flex; gap: 10px; width: 100%; max-width: 600px; margin: auto;">
    <!-- First Button -->
    <button class="btn btn-fw btn-light" type="submit" style="background-color: #f1c40f; color: #2b2b2b; flex: 1; padding: 10px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">
        PLACE ORDER
    </button>

    <!-- Second Button -->
    <button class="btn btn-fw btn-light" type="button" style="background-color: red; color: #ffffff; flex: 1; padding: 10px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">
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
$(document).ready(function() {
    $('#dinein-btn').click(function() {
        $('#takeaway-section').addClass('fade-out').removeClass('fade-in');
        $('#dinein-section').addClass('fade-in').removeClass('fade-out');
        setTimeout(function() {
            $('#takeaway-section').hide();
            $('#dinein-section').show();
        }, 700); // Match the duration of your fadeOut animation
    });

    $('#takeaway-btn').click(function() {
        $('#dinein-section').addClass('fade-out').removeClass('fade-in');
        $('#takeaway-section').addClass('fade-in').removeClass('fade-out');
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

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(50px) scale(0.9);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

@keyframes fadeOut {
    from {
        opacity: 1;
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


</body>
</html>