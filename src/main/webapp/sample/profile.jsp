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
<title>Insert title here</title>
</head>
<body>
	This is the Profile

	<%
int userId = 0;

Cookie cookies[] = request.getCookies();

for (Cookie c : cookies) {
	if (c.getName().equals("userId")) {
		userId = Integer.parseInt(c.getValue());
	}
}

if (userId == 0) {
	response.sendRedirect("userlogin.jsp");
}
%>

	<%
	DbConnection dbConn = new DbConnection();
	Connection connection = dbConn.getConnection();
	PreparedStatement preparedStatement;
	%>

	<%
	try {
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT * FROM customers where Id = " + userId + "");

		resultSet.next();
	%>

	<div><%=resultSet.getInt(1)%></div>
	<div><%=resultSet.getString(2)%></div>
	<div><%=resultSet.getString(3)%></div>
	<div><%=resultSet.getString(4)%></div>
	<div><%=resultSet.getString(5)%></div>
	<div><%=resultSet.getString(6)%></div>


	<%
	} catch (Exception e) {
	out.print(e.getMessage());
	}
	%>
</body>
</html>