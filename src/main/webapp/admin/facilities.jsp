<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Facilities List</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
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

.modal {
	display: none;
	position: fixed;
	z-index: 50;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 20px;
}

.modal-content {
	background-color: #fff;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 100%;
	max-width: 500px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script>
	function openUpdateModal(id, name, description, imagePath, restaurantId) {
		document.getElementById("updateId").value = id;
		document.getElementById("updateName").value = name;
		document.getElementById("updateDescription").value = description;
		document.getElementById("updateImagePath").value = imagePath;
		document.getElementById("updateRestaurant").value = restaurantId;
		document.getElementById("updateModal").style.display = "block";
	}

	function closeUpdateModal() {
		document.getElementById("updateModal").style.display = "none";
	}

	function openDeleteModal(id) {
		document.getElementById("deleteId").value = id;
		document.getElementById("deleteModal").style.display = "block";
	}

	function closeDeleteModal() {
		document.getElementById("deleteModal").style.display = "none";
	}
</script>
</head>
<body>
	<!-- Authentication Check -->
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

	<!-- Database Connection -->
	<%
	DbConnection dBConnection = new DbConnection();
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	Statement statement = null;
	ResultSet resultSet = null;
	ResultSet restaurantResultSet = null;

	try {
		connection = dBConnection.getConnection();

		// First query to get facilities
		statement = connection.createStatement();
		resultSet = statement
		.executeQuery("SELECT f.Id, f.Name, f.Description, f.ImagePath, f.RestaurantId, r.Name AS RestaurantName "
				+ "FROM facilities f " + "JOIN restaurants r ON f.RestaurantId = r.Id");
	%>

	<div class="flex justify-between items-center mb-4">
		<h2 class="text-xl font-bold">Facilities List</h2>
	</div>

	<table class="table-auto w-full bg-white shadow-lg rounded-lg">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Restaurant</th>
				<th>Image</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (resultSet.next()) {
			%>
			<tr>
				<td><%=resultSet.getInt("Id")%></td>
				<td><%=resultSet.getString("Name")%></td>
				<td><%=resultSet.getString("Description")%></td>
				<td><%=resultSet.getString("RestaurantName")%></td>
				<td><img src="<%=resultSet.getString("ImagePath")%>"
					alt="Facility Image" width="50" height="50"></td>
				<td>
					<button
						class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded"
						onclick="openUpdateModal('<%=resultSet.getInt("Id")%>', '<%=resultSet.getString("Name")%>', '<%=resultSet.getString("Description")%>', '<%=resultSet.getString("ImagePath")%>', '<%=resultSet.getInt("RestaurantId")%>')">
						Update</button>
					<button
						class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded"
						onclick="openDeleteModal('<%=resultSet.getInt("Id")%>')">
						Delete</button>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<!-- Facility Creation Form -->
	<h2>Create New Facility</h2>
	<form action="../CreateFacilityServlet" method="post">
		<div>
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" required>
		</div>
		<div>
			<label for="description">Description:</label> <input type="text"
				id="description" name="description" required>
		</div>
		<div>
			<label for="restaurantId">Restaurant:</label> <select
				id="restaurantId" name="restaurantId" required>
				<%
				try {
					Connection conn = dBConnection.getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT Id, Name FROM restaurants");
					while (rs.next()) {
				%>
				<option value="<%=rs.getInt("Id")%>"><%=rs.getString("Name")%></option>
				<%
				}
				rs.close();
				stmt.close();
				} catch (Exception e) {
				out.print(e.getMessage());
				}
				%>
			</select>
		</div>
		<div>
			<label for="imagePath">Image Path:</label> <input type="text"
				id="imagePath" name="imagePath" required>
		</div>
		<div>
			<input type="submit" value="Create Facility">
		</div>
	</form>


	<!-- Second query to get restaurants for the dropdown -->
	<%
	resultSet.close();
	statement.close();

	preparedStatement = connection.prepareStatement("SELECT Id, Name FROM restaurants");
	restaurantResultSet = preparedStatement.executeQuery();
	%>

	<!-- Modal for Updating Facility -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeUpdateModal()">&times;</span>
			<h2>Update Facility</h2>
			<form action="../FacilityUpdateServlet" method="post">
				<input type="hidden" id="updateId" name="id">
				<div>
					<label for="updateName">Name:</label> <input type="text"
						id="updateName" name="name"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updateDescription">Description:</label> <input
						type="text" id="updateDescription" name="description"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updateImagePath">Image:</label> <input type="text"
						id="updateImagePath" name="image"
						class="border border-gray-300 p-2 rounded w-full">
				</div>
				<div>
					<label for="updateRestaurant">Restaurant:</label> <select
						id="updateRestaurant" name="restaurantId"
						class="border border-gray-300 p-2 rounded w-full" required>
						<%
						while (restaurantResultSet.next()) {
						%>
						<option value="<%=restaurantResultSet.getInt("Id")%>">
							<%=restaurantResultSet.getString("Name")%>
						</option>
						<%
						}
						%>
					</select>
				</div>
				<div>
					<button type="submit"
						class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded mt-4">
						Update</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Modal for Deleting Facility -->
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeDeleteModal()">&times;</span>
			<h2>Delete Facility</h2>
			<form action="../FacilityUpdateServlet" method="get">
				<input type="hidden" id="deleteId" name="id">
				<p>Are you sure you want to delete this facility?</p>
				<div>
					<button type="submit"
						class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-4">
						Delete</button>
					<button type="button"
						class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded mt-4"
						onclick="closeDeleteModal()">Cancel</button>
				</div>
			</form>
		</div>
	</div>

	<%
	} catch (Exception e) {
	out.print(e.getMessage());
	} finally {
	if (restaurantResultSet != null) {
		try {
			restaurantResultSet.close();
		} catch (Exception ignore) {
		}
	}
	if (preparedStatement != null) {
		try {
			preparedStatement.close();
		} catch (Exception ignore) {
		}
	}
	if (resultSet != null) {
		try {
			resultSet.close();
		} catch (Exception ignore) {
		}
	}
	if (statement != null) {
		try {
			statement.close();
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

