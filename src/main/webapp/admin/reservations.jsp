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
/* Table Styles */
/* Table Styles */
body {
    font-family: Arial, sans-serif;
    background: #f2f2f2;
    margin: 100;
    padding: 100;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 16px;
    text-align: left;
    transition: background-color 0.4s, transform 0.4s, box-shadow 0.4s;
}

th {
    background-color: #6e45e2; /* Single solid color */
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    border-bottom: 3px solid #4a00e0; /* Accent border */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow */
}


tr:nth-child(odd) {
    background: linear-gradient(135deg, #f3f4f6, #e5e5e5); /* Alternating background gradient */
}

tr:nth-child(even) {
    background: linear-gradient(135deg, #ffffff, #f7f7f7); /* Alternating background gradient */
}

tr:hover {
    background: linear-gradient(135deg, #d1c4e9, #b39ddb); /* Hover gradient */
    transform: translateY(-2px); /* Slight lift effect */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background: rgba(0, 0, 0, 0.7); /* Darker overlay with slight transparency */
    padding: 20px;
    transition: opacity 0.4s ease, visibility 0.4s ease;
}

.modal-content {
    background: linear-gradient(135deg, #ffffff, #e0f7fa); /* Gradient background */
    margin: auto;
    padding: 30px;
    border: 1px solid #ddd;
    width: 90%;
    max-width: 600px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3); /* Enhanced shadow */
    border-radius: 12px;
    transform: scale(0.9);
    transition: transform 0.4s ease;
}

.modal-content.show {
    transform: scale(1);
}

/* Close Button */
.close {
    color: #ff4081; /* Vibrant pink */
    float: right;
    font-size: 36px;
    font-weight: bold;
    transition: color 0.4s, transform 0.4s;
    cursor: pointer;
}

.close:hover, .close:focus {
    color: #d500f9; /* Purple color on hover */
    transform: rotate(15deg); /* Slight rotation on hover */
}

/* Animation for Modal */
.modal.show {
    display: block;
    opacity: 1;
    visibility: visible;
}
</style>
</head>
<body>
    <%@ include file="../includes/adminHeader.jsp"%>
<br/><br/><br/><br/><br/><br/><br/>
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
		<tr style="background-color: #ffffff; border-bottom: 1px solid #ddd; transition: background-color 0.3s, transform 0.3s;">
    <td style="padding: 12px; text-align: center; color: #333; font-size: 14px;"><%=resultSet.getInt("Id")%></td>
    <td style="padding: 12px; text-align: center; color: #333; font-size: 14px;"><%=resultSet.getDate("ReservationDate")%></td>
    <td style="padding: 12px; text-align: center; color: #333; font-size: 14px;"><%=resultSet.getInt("NumberOfGuests")%></td>
    <td style="padding: 12px; text-align: center; color: #333; font-size: 14px;"><%=resultSet.getString("CustomerName")%></td>
    <td style="padding: 12px; text-align: center; color: #333; font-size: 14px;"><%=resultSet.getString("RestaurantName")%></td>
    <td style="padding: 12px; text-align: center; color: #333; font-size: 14px;"><%=resultSet.getString("FoodName")%></td>
    <td style="padding: 12px; text-align: center; color: #4a00e0; font-size: 14px;"><%=resultSet.getInt("type") == 1 ? "Take Away" : "Dine In"%></td>
    <td style="padding: 12px; text-align: center; color: #4caf50; font-size: 14px; font-weight: bold;"><%=resultSet.getBigDecimal("price")%></td>
    <td style="padding: 12px; text-align: center; color: <%=resultSet.getInt("status") == 0 ? "#f39c12" : resultSet.getInt("status") == 1 ? "#2ecc71" : "#e74c3c"%>; font-size: 14px; font-weight: bold;">
        <%=resultSet.getInt("status") == 0 ? "Pending" : resultSet.getInt("status") == 1 ? "Approved" : "Rejected"%>
    </td>
    <td style="padding: 12px; text-align: center;">
        <a href="../ReservationStatusUpdateServlet?user_id=<%=resultSet.getInt(1)%>&type=approve" style="text-decoration: none;">
            <input type="button" name="approve" class="btn btn-success" value="Approve" style="background-color: #2ecc71; color: #fff; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s;">
        </a>
        <a href="../ReservationStatusUpdateServlet?user_id=<%=resultSet.getInt(1)%>&type=reject" style="text-decoration: none;">
            <input type="button" name="reject" class="btn btn-danger" value="Reject" style="background-color: #e74c3c; color: #fff; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s;">
        </a>
    </td>
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
