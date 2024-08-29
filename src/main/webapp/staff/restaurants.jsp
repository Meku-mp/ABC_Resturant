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
<title>Restaurants List</title>
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

input[type="text"], input[type="number"], input[type="date"] {
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
		response.sendRedirect("adminlogin.jsp");
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
		ResultSet resultSet = statement.executeQuery("SELECT * FROM restaurants");
	%>

	<h2>Restaurants List</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Location</th>
			<th>Rate</th>
			<th>Created By</th>
			<th>Create Date</th>
		</tr>

		<%
		while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("Id")%></td>
			<td><%=resultSet.getString("Name")%></td>
			<td><%=resultSet.getString("Location")%></td>
			<td><%=resultSet.getBigDecimal("Rate")%></td>
			<td><%=resultSet.getString("CreateBy")%></td>
			<td><%=resultSet.getDate("CreateDate")%></td>
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

	<!-- Restaurant Creation Form -->
	<h2>Create New Restaurant</h2>
	<form action="restaurantCreateServlet" method="post">
		<div>
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" required>
		</div>
		<div>
			<label for="location">Location:</label> <input type="text"
				id="location" name="location" required>
		</div>
		<div>
			<label for="rate">Rate:</label> <input type="number" step="0.01"
				id="rate" name="rate" required>
		</div>
		<div>
			<label for="createBy">Created By:</label> <input type="text"
				id="createBy" name="createBy" required>
		</div>
		<div>
			<label for="createDate">Create Date:</label> <input type="date"
				id="createDate" name="createDate" required>
		</div>
		<div>
			<input type="submit" value="Create Restaurant">
		</div>
	</form>

</body>
</html>
