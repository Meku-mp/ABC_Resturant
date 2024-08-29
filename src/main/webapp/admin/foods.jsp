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
<title>Foods List</title>
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
	function openUpdateModal(id, name, description, price, restaurantId,
			imagePath) {
		document.getElementById("updateId").value = id;
		document.getElementById("updateName").value = name;
		document.getElementById("updateDescription").value = description;
		document.getElementById("updatePrice").value = price;
		document.getElementById("updateRestaurant").value = restaurantId;
		document.getElementById("updateImagePath").value = imagePath;
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
	Connection connection = dBConnection.getConnection();
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;
	ResultSet restaurantResultSet = null;
	%>

	<%
	try {
		statement = connection.createStatement();
		resultSet = statement.executeQuery(
		"SELECT f.Id, f.Name, f.Description, f.Price, f.RestaurantId, f.ImagePath, r.Name AS RestaurantName "
				+ "FROM foods f JOIN restaurants r ON f.RestaurantId = r.Id");
	%>

	<div class="flex justify-between items-center mb-4">
		<h2 class="text-xl font-bold">Foods List</h2>
	</div>

	<table class="table-auto w-full bg-white shadow-lg rounded-lg">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Price</th>
				<th>Restaurant</th>
				<th>Image Path</th>
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
				<td><%=resultSet.getDouble("Price")%></td>
				<td><%=resultSet.getString("RestaurantName")%></td>
				<td><%=resultSet.getString("ImagePath")%></td>
				<td>
					<button
						class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded"
						onclick="openUpdateModal('<%=resultSet.getInt("Id")%>', '<%=resultSet.getString("Name")%>', '<%=resultSet.getString("Description")%>', '<%=resultSet.getDouble("Price")%>', '<%=resultSet.getInt("RestaurantId")%>', '<%=resultSet.getString("ImagePath")%>')">
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

	<%
	} catch (Exception e) {
	out.print(e.getMessage());
	}
	%>

	<!-- Food Creation Form -->
	<h2>Create New Food</h2>
	<form action="../CreateFoodServlet" method="post">
		<div>
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" class="border border-gray-300 p-2 rounded" required>
		</div>
		<div>
			<label for="description">Description:</label> <input type="text"
				id="description" name="description"
				class="border border-gray-300 p-2 rounded" required>
		</div>
		<div>
			<label for="price">Price:</label> <input type="text" id="price"
				name="price" class="border border-gray-300 p-2 rounded" required>
		</div>
		<div>
			<label for="restaurantId">Restaurant:</label> <select
				id="restaurantId" name="restaurantId"
				class="border border-gray-300 p-2 rounded" required>
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
				id="imagePath" name="imagePath"
				class="border border-gray-300 p-2 rounded" required>
		</div>
		<div>
			<input type="submit" value="Create Food"
				class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">
		</div>
	</form>

	<!-- Modal for Updating Food -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeUpdateModal()">&times;</span>
			<h2>Update Food</h2>
			<form action="../FoodDeleteServlet" method="post">
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
					<label for="updatePrice">Price:</label> <input type="text"
						id="updatePrice" name="price"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updateRestaurant">Restaurant:</label> <select
						id="updateRestaurant" name="restaurantId"
						class="border border-gray-300 p-2 rounded w-full" required>
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
					<label for="updateImagePath">Image Path:</label> <input type="text"
						id="updateImagePath" name="imagePath"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<input type="submit" value="Update Food"
						class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
				</div>
			</form>
		</div>
	</div>

	<!-- Modal for Deleting Food -->
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeDeleteModal()">&times;</span>
			<h2>Delete Food</h2>
			<p>Are you sure you want to delete this food item?</p>
			<form action="../FoodDeleteServlet" method="get">
				<input type="hidden" id="deleteId" name="id">
				<div>
					<input type="submit" value="Delete"
						class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
					<button type="button" onclick="closeDeleteModal()"
						class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
						Cancel</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		window.onclick = function(event) {
			if (event.target.classList.contains('modal')) {
				closeUpdateModal();
				closeDeleteModal();
			}
		}
	</script>
</body>
</html>
