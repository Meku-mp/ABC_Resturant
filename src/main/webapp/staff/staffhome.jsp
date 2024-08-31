<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1, maximum-scale=1"
	name="viewport">
<title>ABC Resturent- ADMIN</title>
<link
	href="https://fonts.googleapis.com/css?family=Oswald:400,500,600,700%7CRoboto:100,300,400,400i,500,700"
	rel="stylesheet">
</head>
<body style="font-family: 'Roboto', sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;">

    
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

<header style="background-color: #333; padding: 15px 0; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
	<div class="container" style="width: 90%; margin: 0 auto;">
		<div style="display: flex; align-items: center; justify-content: space-between;">
			<div class="logo">
				<a href="/" style="text-decoration: none;">
					<img src="../images/logo ABC.png" alt="" style="width: 150px;">
				</a>
			</div>
			<nav style="flex-grow: 1; text-align: right;">
				<ul style="list-style: none; padding: 0; margin: 0;">
					<li style="display: inline-block; margin-left: 20px;"><a href="staffhome.jsp" style="color: white; text-decoration: none; font-weight: 500;">HOME</a></li>
					<li style="display: inline-block; margin-left: 20px;"><a href="staff.jsp" style="color: white; text-decoration: none; font-weight: 500;">STAFF</a></li>
<!-- 					<li style="display: inline-block; margin-left: 20px;"><a href="restaurants.jsp" style="color: white; text-decoration: none; font-weight: 500;">RESTAURANTS</a></li>
 -->					<li style="display: inline-block; margin-left: 20px;"><a href="reservations.jsp" style="color: white; text-decoration: none; font-weight: 500;">RESERVATIONS</a></li>
<!-- 					<li style="display: inline-block; margin-left: 20px;"><a href="payments.jsp" style="color: white; text-decoration: none; font-weight: 500;">PAYMENTS</a></li>
 -->					<li style="display: inline-block; margin-left: 20px;"><a href="foods.jsp" style="color: white; text-decoration: none; font-weight: 500;">FOODS</a></li>
					<li style="display: inline-block; margin-left: 20px;"><a href="facilities.jsp" style="color: white; text-decoration: none; font-weight: 500;">FACILITIES</a></li>
					<li style="display: inline-block; margin-left: 20px;">
						<form action="../LogoutServlet" method="post" style="display: inline;">
							<button type="submit" style="color: white; background-color: #e74c3c; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">LOGOUT</button>
						</form>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>

<section style="padding: 50px 0;">
	<div class="container-fluid" style="width: 90%; margin: 0 auto;">
		<div class="row full-box" style="display: flex; justify-content: space-around; flex-wrap: wrap;">

			<div style="background-color: #2ecc71; color: white; text-align: center; margin: 20px 0; border-radius: 10px; width: 30%; min-width: 250px; padding: 30px 0;">
				<a href="staff.jsp" style="text-decoration: none; color: inherit;">
					<h3>STAFF</h3>
				</a>
			</div>
			
			<div style="background-color: #3498db; color: white; text-align: center; margin: 20px 0; border-radius: 10px; width: 30%; min-width: 250px; padding: 30px 0;">
				<a href="reservations.jsp" style="text-decoration: none; color: inherit;">
					<h3>RESERVATION</h3>
				</a>
			</div>
			
			<div style="background-color: #e67e22; color: white; text-align: center; margin: 20px 0; border-radius: 10px; width: 30%; min-width: 250px; padding: 30px 0;">
				<a href="foods.jsp" style="text-decoration: none; color: inherit;">
					<h3>FOOD</h3>
				</a>
			</div>
		</div>

		<div class="row full-box" style="display: flex; justify-content: space-around; flex-wrap: wrap;">
			
			<div style="background-color: #9b59b6; color: white; text-align: center; margin: 20px 0; border-radius: 10px; width: 30%; min-width: 250px; padding: 30px 0;">
				<a href="facilities.jsp" style="text-decoration: none; color: inherit;">
					<h3>FACILITIES</h3>
				</a>
			</div>
			
			

		</div>
	</div>
</section>

</body>
</html>
