<%@page import="model.Facility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	This is the facilities search

	<form action="../FacilitiesSearch" method="post"
		name="FacilitiesSearch">
		<div class="form-wrapper">
			<b>Name</b> <input type="text" name="name" class="form-control"
				required>
		</div>

		<button class="button button1" type="submit">SEARCH</button>
	</form>

	<hr>

	<%
	// Retrieve the facilities list from the request scope
	List<Facility> facilities = (List<Facility>) request.getAttribute("facilities");

	if (facilities != null && !facilities.isEmpty()) {
	%>
	<ul>
		<%
		// Loop through the facilities list and display each facility
		for (Facility facility : facilities) {
		%>
		<li><%=facility.getName()%> - Restaurant ID: <%=facility.getRestaurantId()%> - Description: <%=facility.getDescription()%></li>
		<%
		}
		%>
	</ul>
	<%
	} else {
	%>
	<p>No facilities found for the given name.</p>
	<%
	}
	%>
</body>
</html>