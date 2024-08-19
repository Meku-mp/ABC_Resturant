<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DbConnection"%>
<%@page import="java.sql.Statement"%>
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
	DbConnection dBConnection = new DbConnection();
	Connection connection = dBConnection.getConnection();
	PreparedStatement preparedStatement;
	%>

	<%
	try {
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT * FROM abc_hotel.customers");

		while (resultSet.next()) {
	%>

	<div><%=resultSet.getInt(1)%></div>
	<div><%=resultSet.getString(2)%></div>
	<div><%=resultSet.getString(3)%></div>
	<div><%=resultSet.getString(4)%></div>
	<div><%=resultSet.getString(5)%></div>
	<div><%=resultSet.getString(6)%></div>

	<br>

	<%
	}
	} catch (Exception e) {
	out.print(e.getMessage());
	}
	%>


	<form action="CustomerInsertServlet" method="post" name="addCustomer">
		<div class="form-wrapper">
			<b>Full Name</b> <input type="text" name="FullName" class="form-control"
				required>
		</div>
		<div class="form-wrapper">
			<b>Email</b> <input type="text" name="Email"
				class="form-control" required>
		</div>
		<div class="form-wrapper">
			<b>Phone</b> <input type="text" name="Phone" class="form-control"
				required>
		</div>
		<div class="form-wrapper">
			<b>Username</b> <input type="text" name="Username" class="form-control"
				required>
		</div>
		<div class="form-wrapper">
			<b>Password</b> <input type="password" name="Password" class="form-control"
				required>
		</div>
		
		<button class="button button1" type="submit">ADD</button>
	</form>


</body>
</html>