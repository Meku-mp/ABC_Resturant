<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Queries List</title>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

form {
	margin-top: 20px;
}

form div {
	margin-bottom: 10px;
}

label {
	display: inline-block;
	width: 150px;
}

input[type="text"], input[type="email"], textarea {
	width: 200px;
	padding: 5px;
}

input[type="submit"] {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
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
		return; // Stop further processing
	}
	%>

	<%
	DbConnection dBConnection = new DbConnection();
	Connection connection = dBConnection.getConnection();
	PreparedStatement preparedStatement;
	%>

	<%
	try {
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery(
		"SELECT q.Id, q.QueryText, q.QueryDate, q.CustomerName, q.CustomerEmail, q.RestaurantId, r.Name AS RestaurantName "
				+ "FROM queries q JOIN restaurants r ON q.RestaurantId = r.Id");
	%>

	<h2>Queries List</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Query Text</th>
			<th>Query Date</th>
			<th>Customer Name</th>
			<th>Customer Email</th>
			<th>Restaurant ID</th>
			<th>Restaurant Name</th>
		</tr>

		<%
		while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("Id")%></td>
			<td><%=resultSet.getString("QueryText")%></td>
			<td><%=resultSet.getDate("QueryDate")%></td>
			<td><%=resultSet.getString("CustomerName")%></td>
			<td><%=resultSet.getString("CustomerEmail")%></td>
			<td><%=resultSet.getInt("RestaurantId")%></td>
			<td><%=resultSet.getString("RestaurantName")%></td>
		</tr>
		<%
		}
		%>
	</table>

	<%
	} catch (Exception e) {
	out.print(e.getMessage());
	} finally {
	if (connection != null) {
		try {
			connection.close();
		} catch (Exception ignore) {
		}
	}
	}
	%>

	<!-- Query Creation Form -->
	<!-- <h2>Create New Query</h2>
	<form action="queryCreateServlet" method="post">
		<div>
			<label for="queryText">Query Text:</label>
			<textarea id="queryText" name="queryText" rows="4" required></textarea>
		</div>
		<div>
			<label for="customerName">Customer Name:</label> <input type="text"
				id="customerName" name="customerName" required>
		</div>
		<div>
			<label for="customerEmail">Customer Email:</label> <input
				type="email" id="customerEmail" name="customerEmail" required>
		</div>
		<div>
			<label for="restaurantId">Restaurant ID:</label> <input type="number"
				id="restaurantId" name="restaurantId" required>
		</div>
		<div>
			<input type="submit" value="Create Query">
		</div>
	</form> -->

</body>
</html>
