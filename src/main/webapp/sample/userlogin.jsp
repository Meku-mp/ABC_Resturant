<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int userId = 0;

	Cookie cookies[] = request.getCookies();

	for (Cookie c : cookies) {
		if (c.getName().equals("userId")) {
			userId = Integer.parseInt(c.getValue());
		}
	}

	if (userId != 0) {
		response.sendRedirect("profile.jsp");
	}
	%>

	This is the User Login

	<form action="../UserLoginServlet" method="post" name="userLogin">
		<div class="form-wrapper">
			<b>Username</b> <input type="text" name="username"
				class="form-control" required>
		</div>
		<div class="form-wrapper">
			<b>Password</b> <input type="password" name="password"
				class="form-control" required>
		</div>

		<button class="button button1" type="submit">Login</button>
	</form>
</body>
</html>