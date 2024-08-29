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
<title>Reservations List</title>
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
		response.sendRedirect("../adminlogin.jsp");
		return; // Stop further processing
	}

	DbConnection dBConnection = new DbConnection();
	Connection connection = dBConnection.getConnection();
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	%>

	<%
	try {
		// Query to get reservations with joined data
		String query = "SELECT r.Id, r.ReservationDate, r.NumberOfGuests, r.CustomerId, "
		+ "r.RestaurantId, r.type, r.price, r.foodId, r.status, "
		+ "c.FullName AS CustomerName, rest.Name AS RestaurantName, f.Name AS FoodName " + "FROM reservations r "
		+ "JOIN customers c ON r.CustomerId = c.Id " + "JOIN restaurants rest ON r.RestaurantId = rest.Id "
		+ "JOIN foods f ON r.foodId = f.Id";
		preparedStatement = connection.prepareStatement(query);
		resultSet = preparedStatement.executeQuery();
	%>

	<h2>Reservations List</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Reservation Date</th>
			<th>Number of Guests</th>
			<th>Customer Name</th>
			<th>Restaurant Name</th>
			<th>Food Name</th>
			<th>Type</th>
			<th>Price</th>
			<th>Status</th>
			<th>Actions</th>
		</tr>

		<%
		while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("Id")%></td>
			<td><%=resultSet.getDate("ReservationDate")%></td>
			<td><%=resultSet.getInt("NumberOfGuests")%></td>
			<td><%=resultSet.getString("CustomerName")%></td>
			<td><%=resultSet.getString("RestaurantName")%></td>
			<td><%=resultSet.getString("FoodName")%></td>
			<td><%=resultSet.getInt("type") == 1 ? "Take Away" : "Dine In"%></td>
			<td><%=resultSet.getBigDecimal("price")%></td>
			<td><%=resultSet.getInt("status") == 0 ? "Pending" : resultSet.getInt("status") == 1 ? "Approved" : "Rejected"%></td>
			<td><a
				href="../ReservationStatusUpdateServlet?user_id=<%=resultSet.getInt(1)%>&type=approve">
					<input type="button" name="delete" class="btn btn-danger" 
					value="Approve">
			</a> <a
				href="../ReservationStatusUpdateServlet?user_id=<%=resultSet.getInt(1)%>&type=reject">
					<input type="button" name="delete" class="btn btn-danger"
					value="Reject">
			</a></td>
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



</body>
</html>
