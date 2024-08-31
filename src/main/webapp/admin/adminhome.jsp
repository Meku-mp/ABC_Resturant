<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport">
<!-- ========== SEO ========== -->
<title>ABC Restaurant - ADMIN</title>
<meta content="Admin Dashboard for ABC Restaurant" name="description">
<meta content="restaurant, admin, dashboard" name="keywords">
<meta content="ABC Restaurant" name="author">
<!-- ========== FAVICON ========== -->
<link rel="apple-touch-icon-precomposed" href="images/favicon-apple.png" />
<link rel="icon" href="images/favicon.png">
<!-- ========== STYLESHEETS ========== -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-select.min.css">
<link rel="stylesheet" href="../css/jquery.mmenu.css">

<!-- ========== ICON FONTS ========== -->
<link href="../fonts/font-awesome.min.css" rel="stylesheet">
<link href="../fonts/flaticon.css" rel="stylesheet">
<!-- ========== GOOGLE FONTS ========== -->
<link href="https://fonts.googleapis.com/css?family=Oswald:400,500,600,700%7CRoboto:100,300,400,400i,500,700" rel="stylesheet">
</head>
<body class="dark">

    <% 
    int adminId = 0;
    Cookie cookies[] = request.getCookies();
    for (Cookie c : cookies) {
        if (c.getName().equals("adminId")) {
            adminId = Integer.parseInt(c.getValue());
        }
    }
    if (adminId == 0) {
        response.sendRedirect("../adminlogin.jsp");
    }
    %>

    <%@ include file="../includes/adminHeader.jsp"%>

<section class="box" style=" margin-top: 200px; padding: 30px 0; display: flex; justify-content: center;">
    <div class="container-fluid" style="max-width: 1200px; margin: auto; width: 100%;">
        <div class="row full-box" style="display: flex; justify-content: space-between;">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short" style="margin-bottom: 40px;"> <!-- Updated margin-bottom -->
                <a href="staff.jsp" style="text-decoration: none; color: inherit;">
                    <div class="inside" style="background: #ffffff; padding: 40px 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                        <h3 style="font-family: 'Oswald', sans-serif; font-size: 24px; letter-spacing: 2px; color: #333;">STAFF</h3>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec" style="margin-bottom: 40px;"> <!-- Updated margin-bottom -->
                <a href="restaurants.jsp" style="text-decoration: none; color: inherit;">
                    <div class="inside" style="background: #ffffff; padding: 40px 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                        <h3 style="font-family: 'Oswald', sans-serif; font-size: 24px; letter-spacing: 2px; color: #333;">RESTAURANTS</h3>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec" style="margin-bottom: 40px;"> <!-- Updated margin-bottom -->
                <a href="queries.jsp" style="text-decoration: none; color: inherit;">
                    <div class="inside" style="background: #ffffff; padding: 40px 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                        <h3 style="font-family: 'Oswald', sans-serif; font-size: 24px; letter-spacing: 2px; color: #333;">QUERIES</h3>
                    </div>
                </a>
            </div>
        </div>
        <div class="row full-box" style="display: flex; justify-content: space-between;">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short" style="margin-bottom: 40px;"> <!-- Updated margin-bottom -->
                <a href="foods.jsp" style="text-decoration: none; color: inherit;">
                    <div class="inside" style="background: #ffffff; padding: 40px 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                        <h3 style="font-family: 'Oswald', sans-serif; font-size: 24px; letter-spacing: 2px; color: #333;">FOODS</h3>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec" style="margin-bottom: 40px;"> <!-- Updated margin-bottom -->
                <a href="facilities.jsp" style="text-decoration: none; color: inherit;">
                    <div class="inside" style="background: #ffffff; padding: 40px 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                        <h3 style="font-family: 'Oswald', sans-serif; font-size: 24px; letter-spacing: 2px; color: #333;">FACILITIES</h3>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container-box short sec" style="margin-bottom: 40px;"> <!-- Updated margin-bottom -->
                <a href="reservations.jsp" style="text-decoration: none; color: inherit;">
                    <div class="inside" style="background: #ffffff; padding: 40px 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                        <h3 style="font-family: 'Oswald', sans-serif; font-size: 24px; letter-spacing: 2px; color: #333;">RESERVATIONS</h3>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>


</body>
</html>
