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
<title>Staff List</title>
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

    function openUpdateModal(id, name, position, salary, restaurantId, username, password) {
        document.getElementById("updateId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updatePosition").value = position;
        document.getElementById("updateSalary").value = salary;
        document.getElementById("updateRestaurantId").value = restaurantId;
        document.getElementById("updateUsername").value = username;
        document.getElementById("updatePassword").value = password;
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
<%--    <%@ include file="../includes/adminHeader.jsp"%>
 --%>	<!-- Toast Notification -->
	<div id="toastCreated"
		class="fixed bottom-4 right-4 bg-blue-500 text-white px-4 py-2 rounded shadow-lg"
		style="display: none;">Staff Member created successfully!</div>

	<div id="toastUpdated"
		class="fixed bottom-4 right-4 bg-green-500 text-white px-4 py-2 rounded shadow-lg"
		style="display: none;">Staff updated successfully!</div>

	<div id="toastDeleted"
		class="fixed bottom-4 right-4 bg-red-500 text-white px-4 py-2 rounded shadow-lg"
		style="display: none;">Staff deleted successfully!</div>

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
                resultSet = statement.executeQuery("SELECT * FROM staff");
        %>

		<div class="flex justify-between items-center mb-4">
			<h2 class="text-xl font-bold">Staff List</h2>
			<button onclick="openCreateModal()"
				class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
				Create New Staff</button>
		</div>

		<table class="table-auto w-full bg-white shadow-lg rounded-lg">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Position</th>
					<th>Salary</th>
					<th>Restaurant ID</th>
					<th>Username</th>
					<th>Created By</th>
					<th>Create Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
                    while (resultSet.next()) {
                %>
				<tr>
					<td><%=resultSet.getInt("Id")%></td>
					<td><%=resultSet.getString("Name")%></td>
					<td><%=resultSet.getString("Position")%></td>
					<td><%=resultSet.getDouble("Salary")%></td>
					<td><%=resultSet.getInt("RestaurantId")%></td>
					<td><%=resultSet.getString("Username")%></td>
					<td><%=resultSet.getString("CreateBy")%></td>
					<td><%=resultSet.getDate("CreateDate")%></td>
					<td>
						<button
							class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded"
							onclick="openUpdateModal('<%=resultSet.getInt("Id")%>', '<%=resultSet.getString("Name")%>', '<%=resultSet.getString("Position")%>', '<%=resultSet.getDouble("Salary")%>', '<%=resultSet.getInt("RestaurantId")%>', '<%=resultSet.getString("Username")%>', '<%=resultSet.getString("Password")%>')">
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

	<!-- Modal for Creating New Staff -->
	<div id="createModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeCreateModal()">&times;</span>
			<h2>Create New Staff</h2>
			<form action="../StaffCreateServlet" method="post">
				<div>
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" class="border border-gray-300 p-2 rounded w-full"
						required>
				</div>
				<div>
					<label for="position">Position:</label> <input type="text"
						id="position" name="position"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="salary">Salary:</label> <input type="number"
						id="salary" name="salary"
						class="border border-gray-300 p-2 rounded w-full" required>
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
                            } catch (Exception e) {
                                out.print(e.getMessage());
                            }
                        %>
					</select>
				</div>
				<div>
					<label for="username">Username:</label> <input type="text"
						id="username" name="username"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="password">Password:</label> <input type="password"
						id="password" name="password"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<input type="hidden" name="createBy" value="<%=adminId%>">
					<button type="submit"
						class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded mt-4">
						Create</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Modal for Updating Staff -->
	<div id="updateModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeUpdateModal()">&times;</span>
			<h2>Update Staff</h2>
			<form action="../StaffUpdateServlet" method="post">
				<input type="hidden" id="updateId" name="id">
				<div>
					<label for="updateName">Name:</label> <input type="text"
						id="updateName" name="name"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updatePosition">Position:</label> <input type="text"
						id="updatePosition" name="position"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updateSalary">Salary:</label> <input type="number"
						id="updateSalary" name="salary"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updateRestaurantId">Restaurant:</label> <select
						id="updateRestaurantId" name="restaurantId"
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
					<label for="updateUsername">Username:</label> <input type="text"
						id="updateUsername" name="username"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<label for="updatePassword">Password:</label> <input
						type="password" id="updatePassword" name="password"
						class="border border-gray-300 p-2 rounded w-full" required>
				</div>
				<div>
					<button type="submit"
						class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded mt-4">
						Update</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Modal for Deleting Staff -->
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeDeleteModal()">&times;</span>
			<h2>Are you sure you want to delete this staff member?</h2>
			<form action="../StaffDeleteServlet" method="post">
				<input type="hidden" id="deleteId" name="id">
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
