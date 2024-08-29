<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foods List</title>
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

input[type="text"], input[type="number"], input[type="file"] {
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
	int staffId = 0;
	int restaurantId = 0;

	Cookie cookies[] = request.getCookies();

	for (Cookie c : cookies) {
		if (c.getName().equals("staffId")) {
			staffId = Integer.parseInt(c.getValue());
		}
	}

	if (staffId == 0) {
		response.sendRedirect("adminlogin.jsp");
		return; // Stop further processing
	}

	DbConnection dBConnection = new DbConnection();
	Connection connection = dBConnection.getConnection();
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	%>

	<%
	try {
		// Get the RestaurantId for the given staffId
		String getRestaurantIdQuery = "SELECT RestaurantId FROM staff WHERE Id = ?";
		preparedStatement = connection.prepareStatement(getRestaurantIdQuery);
		preparedStatement.setInt(1, staffId);
		ResultSet restaurantIdResultSet = preparedStatement.executeQuery();

		if (restaurantIdResultSet.next()) {
			restaurantId = restaurantIdResultSet.getInt("RestaurantId");
		}

		// Get all foods for the retrieved RestaurantId
		String getFoodsByRestaurantIdQuery = "SELECT * FROM foods WHERE RestaurantId = ?";
		preparedStatement = connection.prepareStatement(getFoodsByRestaurantIdQuery);
		preparedStatement.setInt(1, restaurantId);
		resultSet = preparedStatement.executeQuery();
	%>

	<h2>Foods List</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Restaurant ID</th>
			<th>Image Path</th>
		</tr>

		<%
		while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("Id")%></td>
			<td><%=resultSet.getString("Name")%></td>
			<td><%=resultSet.getString("Description")%></td>
			<td><%=resultSet.getDouble("Price")%></td>
			<td><%=resultSet.getInt("RestaurantId")%></td>
			<td><%=resultSet.getString("ImagePath")%></td>
		</tr>
		<%
		}
		%>
	</table>

	<%
	} catch (Exception e) {
	out.print(e.getMessage());
	} finally {
	if (resultSet != null) {
		try {
			resultSet.close();
		} catch (Exception ignore) {
		}
	}
	if (preparedStatement != null) {
		try {
			preparedStatement.close();
		} catch (Exception ignore) {
		}
	}
	if (connection != null) {
		try {
			connection.close();
		} catch (Exception ignore) {
		}
	}
	}
	%>

	<!-- Food Creation Form -->
	<h2>Create New Food</h2>
	<form action="../CreateFoodServlet" method="post">
		<div>
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" required>
		</div>
		<div>
			<label for="description">Description:</label> <input type="text"
				id="description" name="description" required>
		</div>
		<div>
			<label for="price">Price:</label> <input type="text" id="price"
				name="price" required>
		</div>
		<!-- Hidden field to pass RestaurantId -->
		<input type="hidden" id="restaurantId" name="restaurantId"
			value="<%=restaurantId%>">
		<div>
			<label for="imagePath">Image Path:</label> <input type="text"
				id="imagePath" name="imagePath" required>
		</div>
		<div>
			<input type="submit" value="Create Food">
		</div>
	</form>

</body>
</html>
