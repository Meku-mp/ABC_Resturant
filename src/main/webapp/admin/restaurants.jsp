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
<title>Restaurant List</title>
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
    function openCreateModal() {
        document.getElementById("createModal").style.display = "block";
    }

    function closeCreateModal() {
        document.getElementById("createModal").style.display = "none";
    }

    function openUpdateModal(id, name, location, rate, createBy) {
        document.getElementById("updateId").value = id;
        document.getElementById("updateName").value = name;
        document.getElementById("updateLocation").value = location;
        document.getElementById("updateRate").value = rate;
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

    <!-- Toast Notification -->
    <div id="toastCreated"
        class="fixed bottom-4 right-4 bg-blue-500 text-white px-4 py-2 rounded shadow-lg"
        style="display: none;">Restaurant created successfully!</div>

    <div id="toastUpdated"
        class="fixed bottom-4 right-4 bg-green-500 text-white px-4 py-2 rounded shadow-lg"
        style="display: none;">Restaurant updated successfully!</div>

    <div id="toastDeleted"
        class="fixed bottom-4 right-4 bg-red-500 text-white px-4 py-2 rounded shadow-lg"
        style="display: none;">Restaurant deleted successfully!</div>

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
            resultSet = statement.executeQuery("SELECT * FROM restaurants");
        %>

        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-bold">Restaurant List</h2>
            <button onclick="openCreateModal()"
                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                Create New Restaurant</button>
        </div>

        <table class="table-auto w-full bg-white shadow-lg rounded-lg">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Location</th>
                    <th>Rate</th>
                    <th>Created By</th>
                    <th>Create Date</th>
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
                    <td><%=resultSet.getString("Location")%></td>
                    <td><%=resultSet.getBigDecimal("Rate")%></td>
                    <td><%=resultSet.getString("CreateBy")%></td>
                    <td><%=resultSet.getDate("CreateDate")%></td>
                    <td>
                        <button
                            class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-1 px-2 rounded"
                            onclick="openUpdateModal('<%=resultSet.getInt("Id")%>', '<%=resultSet.getString("Name")%>', '<%=resultSet.getString("Location")%>', '<%=resultSet.getBigDecimal("Rate")%>', '<%=resultSet.getString("CreateBy")%>')">
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

    <!-- Modal for Creating New Restaurant -->
    <div id="createModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeCreateModal()">&times;</span>
            <h2>Create New Restaurant</h2>
            <form action="../RestaurantCreateServlet" method="post">
                <div>
                    <label for="name">Name:</label> <input type="text" id="name"
                        name="name" class="border border-gray-300 p-2 rounded w-full"
                        required>
                </div>
                <div>
                    <label for="location">Location:</label> <input type="text"
                        id="location" name="location"
                        class="border border-gray-300 p-2 rounded w-full" required>
                </div>
                <div>
                    <label for="rate">Rate:</label> <input type="text"
                        id="rate" name="rate"
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

    <!-- Modal for Updating Restaurant -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeUpdateModal()">&times;</span>
            <h2>Update Restaurant</h2>
            <form action="../RestaurantUpdateServlet" method="post">
                <input type="hidden" id="updateId" name="id">
                <div>
                    <label for="updateName">Name:</label> <input type="text"
                        id="updateName" name="name"
                        class="border border-gray-300 p-2 rounded w-full" required>
                </div>
                <div>
                    <label for="updateLocation">Location:</label> <input type="text"
                        id="updateLocation" name="location"
                        class="border border-gray-300 p-2 rounded w-full" required>
                </div>
                <div>
                    <label for="updateRate">Rate:</label> <input type="text"
                        id="updateRate" name="rate"
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

    <!-- Modal for Deleting Restaurant -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeDeleteModal()">&times;</span>
            <h2>Delete Restaurant</h2>
            <form action="../RestaurantDeleteServlet" method="post">
                <input type="hidden" id="deleteId" name="id">
                <p>Are you sure you want to delete this restaurant?</p>
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
