<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
int adminId = 0;
int staffId = 0;

Cookie cookies[] = request.getCookies();

for (Cookie c : cookies) {
	if (c.getName().equals("adminId")) {
		adminId = Integer.parseInt(c.getValue());
	}

	if (c.getName().equals("staffId")) {
		staffId = Integer.parseInt(c.getValue());
	}
}

if (adminId > 0) {
	response.sendRedirect("admin/adminhome.jsp");
}

if (staffId > 0) {
	response.sendRedirect("staff/staffhome.jsp");
}
%>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
	<div class="bg-white p-8 rounded-lg shadow-lg w-96">
		<h1 class="text-2xl font-bold mb-6 text-center">Login</h1>
		<form action="AdminLoginServlet" method="post">
			<div class="mb-4">
				<label for="username" class="block text-gray-700">Username</label> <input
					type="text" id="username" name="username"
					class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
					required>
			</div>
			<div class="mb-4">
				<label for="password" class="block text-gray-700">Password</label> <input
					type="password" id="password" name="password"
					class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-600"
					required>
			</div>
			<div class="mb-4">
				<label class="block text-gray-700 mb-2">Login As:</label>
				<div class="flex items-center mb-2">
					<input type="radio" id="admin" name="userType" value="admin"
						class="mr-2" required> <label for="admin"
						class="text-gray-700">Admin</label>
				</div>
				<div class="flex items-center">
					<input type="radio" id="staff" name="userType" value="staff"
						class="mr-2" required> <label for="staff"
						class="text-gray-700">Staff</label>
				</div>
			</div>
			<%
			if (errorMessage != null && !errorMessage.isEmpty()) {
			%>
			<div class="error" style="color: red"><%=errorMessage%></div>
			<%
			}
			%>
			<button type="submit"
				class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700">Login</button>
		</form>
	</div>
</body>

</html>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }
    .form-container {
        animation: fadeInUp 0.5s ease-in-out;
    }
    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translateY(20px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .error {
        animation: shake 0.5s;
        animation-iteration-count: 1;
    }
    @keyframes shake {
        0% { transform: translateX(0); }
        25% { transform: translateX(-5px); }
        50% { transform: translateX(5px); }
        75% { transform: translateX(-5px); }
        100% { transform: translateX(0); }
    }
</style>
</head>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
int adminId = 0;
int staffId = 0;

Cookie cookies[] = request.getCookies();

for (Cookie c : cookies) {
	if (c.getName().equals("adminId")) {
		adminId = Integer.parseInt(c.getValue());
	}

	if (c.getName().equals("staffId")) {
		staffId = Integer.parseInt(c.getValue());
	}
}

if (adminId > 0) {
	response.sendRedirect("admin/adminhome.jsp");
}

if (staffId > 0) {
	response.sendRedirect("staff/staffhome.jsp");
}
%>
<body class="flex items-center justify-center min-h-screen">
	<div class="form-container bg-white p-8 rounded-lg shadow-2xl w-96">
		<h1 class="text-3xl font-bold mb-6 text-center text-indigo-600">Welcome Back</h1>
		<form action="AdminLoginServlet" method="post">
			<div class="mb-6">
				<label for="username" class="block text-gray-700 font-medium">Username</label> 
				<input
					type="text" id="username" name="username"
					class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-600"
					required>
			</div>
			<div class="mb-6">
				<label for="password" class="block text-gray-700 font-medium">Password</label> 
				<input
					type="password" id="password" name="password"
					class="w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-600"
					required>
			</div>
			<div class="mb-6">
				<label class="block text-gray-700 font-medium mb-3">Login As:</label>
				<div class="flex items-center mb-2">
					<input type="radio" id="admin" name="userType" value="admin"
						class="mr-3 focus:ring-indigo-600" required> 
					<label for="admin" class="text-gray-700">Admin</label>
				</div>
				<div class="flex items-center">
					<input type="radio" id="staff" name="userType" value="staff"
						class="mr-3 focus:ring-indigo-600" required> 
					<label for="staff" class="text-gray-700">Staff</label>
				</div>
			</div>
			<%
			if (errorMessage != null && !errorMessage.isEmpty()) {
			%>
			<div class="error text-red-500 font-semibold text-center mb-6"><%=errorMessage%></div>
			<%
			}
			%>
			<button type="submit"
				class="w-full bg-indigo-600 text-white py-3 rounded-lg hover:bg-indigo-700 transition-colors duration-300">Login</button>
		</form>
	</div>
</body>

</html>
 
 