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
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-select.min.css">

<link rel="stylesheet" href="../style/adminhome.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Facilities List</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
/* Table Styles */
/* Table Styles */
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
<script>
	function openCreateModal() {
		document.getElementById("createModal").style.display = "block";
	}

	function closeCreateModal() {
		document.getElementById("createModal").style.display = "none";
	}

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
<body class="bg-gray-100">
    <%@ include file="../includes/adminHeader.jsp"%>
<br/><br/><br/><br/><br/><br/><br/>
	<!-- Toast Notification -->
	<div id="toastCreated"
		class="fixed bottom-4 right-4 bg-blue-500 text-white px-4 py-2 rounded shadow-lg"
		style="display: none;">Facility created successfully!</div>

	<div id="toastUpdated"
		class="fixed bottom-4 right-4 bg-green-500 text-white px-4 py-2 rounded shadow-lg"
		style="display: none;">Facility updated successfully!</div>

	<div id="toastDeleted"
		class="fixed bottom-4 right-4 bg-red-500 text-white px-4 py-2 rounded shadow-lg"
		style="display: none;">Facility deleted successfully!</div>

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
	PreparedStatement preparedStatement = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>

	<!-- Page Content -->
	<div class="container mx-auto px-4 py-8">
		<%
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(
				"SELECT f.Id, f.Name, f.Description, f.ImagePath, f.RestaurantId, r.Name AS RestaurantName " +
				"FROM facilities f JOIN restaurants r ON f.RestaurantId = r.Id");
		%>

		<div class="flex justify-between items-center mb-4">
			<h2 class="text-xl font-bold">Facilities List</h2>
			<button onclick="openCreateModal()"
				class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Create
				New Facility</button>
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
						alt="Facility Image" class="h-16 w-16 object-cover rounded"></td>
					<td>
						<button
							class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded"
							onclick="openUpdateModal('<%=resultSet.getInt("Id")%>', '<%=resultSet.getString("Name")%>', '<%=resultSet.getString("Description")%>', '<%=resultSet.getString("ImagePath")%>', '<%=resultSet.getInt("RestaurantId")%>')">Update</button>
						<button
							class="bg-red-500 hover:bg-red-700 text-white font-bold py-1 px-2 rounded"
							onclick="openDeleteModal('<%=resultSet.getInt("Id")%>')">Delete</button>
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
		} finally {
			if (resultSet != null) {
				try { resultSet.close(); } catch (Exception ignore) {}
			}
			if (statement != null) {
				try { statement.close(); } catch (Exception ignore) {}
			}
			if (connection != null) {
				try { connection.close(); } catch (Exception ignore) {}
			}
		}
		%>
	</div>


	<!-- Modal for Creating New Facility -->
	<div id="createModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeCreateModal()">&times;</span>
			<h2>Create New Facility</h2>
			<form action="../CreateFacilityServlet" method="post">
				<div>
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" class="border border-gray-300 p-2 rounded w-full"
						required>
				</div>
				<div>
					<label for="description">Description:</label>
					<textarea id="description" name="description"
						class="border border-gray-300 p-2 rounded w-full" required></textarea>
				</div>
				<div>
					<label for="imagePath">Image:</label> <input type="text"
						id="imagePath" name="imagePath"
						class="border border-gray-300 p-2 rounded w-full">
				</div>
				<div>
					<label for="restaurantId">Restaurant:</label> <select
						id="restaurantId" name="restaurantId"
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
                            conn.close();
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }
                        %>
					</select>
				</div>
				<div class="mt-4">
					<button type="submit"
						class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Create
						Facility</button>
				</div>
			</form>
		</div>
	</div>


	<!-- Modal for Updating Facility -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeUpdateModal()">&times;</span>
			<h2>Update Facility</h2>
			<form action="../FacilityUpdateServlet" method="post">
				<input type="hidden" id="updateId" name="id">
				<div class="mb-4">
					<label for="updateName"
						class="block text-sm font-medium text-gray-700">Name</label> <input
						type="text" id="updateName" name="name"
						class="mt-1 p-2 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
				</div>
				<div class="mb-4">
					<label for="updateDescription"
						class="block text-sm font-medium text-gray-700">Description</label>
					<textarea id="updateDescription" name="description"
						class="mt-1 p-2 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"></textarea>
				</div>
				<div class="mb-4">
					<label for="updateImagePath"
						class="block text-sm font-medium text-gray-700">Image</label> <input
						type="text" id="updateImagePath" name="imagePath"
						class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
				</div>
				<div class="mb-4">
					<label for="updateRestaurant"
						class="block text-sm font-medium text-gray-700">Restaurant</label>
					<select id="updateRestaurant" name="restaurantId"
						class="mt-1 block w-full p-2 border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
						
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
                            conn.close();
                        } catch (Exception e) {
                            out.print(e.getMessage());
                        }
                        %>
					</select>
				</div>
				<div class="mt-4">
					<button type="submit"
						class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded">Update
						Facility</button>
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
				<div class="mt-4">
					<button type="submit"
						class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Delete</button>
					<button type="button" onclick="closeDeleteModal()"
						class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Cancel</button>
				</div>
			</form>
		</div>
	</div>

	<!-- JavaScript for toast notification -->
	<script>
	
	  function showCreatedToast() {
          const toast = document.getElementById("toastCreated");
          toast.style.display = "block";
          setTimeout(() => {
              toast.style.display = "none";
          }, 3000); // Toast will disappear after 3 seconds
      }
        function showUpdatedToast() {
            const toast = document.getElementById("toastUpdated");
            toast.style.display = "block";
            setTimeout(() => {
                toast.style.display = "none";
            }, 3000); // Toast will disappear after 3 seconds
        }
        
        function showDeletedToast() {
            const toast = document.getElementById("toastDeleted");
            toast.style.display = "block";
            setTimeout(() => {
                toast.style.display = "none";
            }, 3000); // Toast will disappear after 3 seconds
        }
        
        

        function checkForToastParam() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('updated') && urlParams.get('updated') === 'true') {
            	showUpdatedToast();
                
                // Remove the 'updated=true' parameter from the URL
                urlParams.delete('updated');
                const newUrl = window.location.pathname + (urlParams.toString() ? '?' + urlParams.toString() : '');
                window.history.replaceState(null, '', newUrl);
            }
            
            else if (urlParams.has('deleted') && urlParams.get('deleted') === 'true') {
            	showDeletedToast();
                
                // Remove the 'deleted=true' parameter from the URL
                urlParams.delete('deleted');
                const newUrl = window.location.pathname + (urlParams.toString() ? '?' + urlParams.toString() : '');
                window.history.replaceState(null, '', newUrl);
            }
            
            else if (urlParams.has('created') && urlParams.get('created') === 'true') {
            	showCreatedToast();
                
                // Remove the 'deleted=true' parameter from the URL
                urlParams.delete('created');
                const newUrl = window.location.pathname + (urlParams.toString() ? '?' + urlParams.toString() : '');
                window.history.replaceState(null, '', newUrl);
            }
            
            
        }
        
        // Run the check when the page loads
        window.onload = checkForToastParam;
    </script>
</body>
</html>
