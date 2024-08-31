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
<title>Queries List</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
<script>
function downloadPDF() {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF('p', 'pt', 'a4');

    // Add background image (optional)
    doc.addImage('https://example.com/background-image.jpg', 'JPEG', 0, 0, 595.28, 841.89);

    // Set font and text color
    doc.setFont('Helvetica', 'bold');
    doc.setTextColor(40, 56, 120);
    
    // Add the title with creative styling
    doc.setFontSize(24);
    doc.text("Queries Report of the Month", 30, 50);
    
    // Add a subheading with lighter color
    doc.setFontSize(14);
    doc.setTextColor(100);
    doc.text("A detailed overview of all queries processed", 30, 70);

    // Draw a line under the title
    doc.setDrawColor(40, 56, 120);
    doc.setLineWidth(2);
    doc.line(30, 80, 565, 80);

    // Prepare the table content
    const table = document.querySelector('table');
    
    // Apply autoTable with customized styles
    doc.autoTable({
        html: table,
        startY: 100,
        theme: 'grid',
        styles: {
            font: 'helvetica',
            fontSize: 12,
            textColor: [40, 56, 120],
            fillColor: [255, 255, 255],
            cellPadding: 8,
        },
        headStyles: {
            fillColor: [40, 56, 120],
            textColor: [255, 255, 255],
            fontSize: 14,
        },
        alternateRowStyles: {
            fillColor: [240, 240, 240],
        },
        margin: { top: 100, bottom: 50 },
    });

    // Add a footer
    const pageCount = doc.internal.getNumberOfPages();
    doc.setFontSize(10);
    doc.setTextColor(150);
    for (let i = 1; i <= pageCount; i++) {
        doc.setPage(i);
        doc.text(`Page ${i} of ${pageCount}`, doc.internal.pageSize.width - 80, doc.internal.pageSize.height - 30, {
            align: 'right'
        });
    }

    // Save the PDF
    doc.save("queries_list.pdf");
}
</script>

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
	%>

	<%
	DbConnection dBConnection = new DbConnection();
	Connection connection = dBConnection.getConnection();
	PreparedStatement preparedStatement;
	%>

	<%
	try {
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery(
		"SELECT q.Id, q.QueryText, q.QueryDate, q.CustomerName, q.CustomerEmail, q.RestaurantId, r.Name AS RestaurantName "
				+ "FROM queries q JOIN restaurants r ON q.RestaurantId = r.Id");
	%>

	<h2>Queries List</h2>
	<table>
		<tr>
			<th>ID</th>
			<th>Query Text</th>
			<th>Query Date</th>
			<th>Customer Name</th>
			<th>Customer Email</th>
			<th>Restaurant ID</th>
			<th>Restaurant Name</th>
		</tr>

		<%
		while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getInt("Id")%></td>
			<td><%=resultSet.getString("QueryText")%></td>
			<td><%=resultSet.getDate("QueryDate")%></td>
			<td><%=resultSet.getString("CustomerName")%></td>
			<td><%=resultSet.getString("CustomerEmail")%></td>
			<td><%=resultSet.getInt("RestaurantId")%></td>
			<td><%=resultSet.getString("RestaurantName")%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<br>
	<!-- Download PDF Button -->
<input 
    type="button" 
    value="Download PDF" 
    onclick="downloadPDF()" 
    style="
        background-color: #4CAF50; 
        color: white; 
        font-size: 16px; 
        padding: 12px 24px; 
        border: none; 
        border-radius: 8px; 
        cursor: pointer; 
        transition: background-color 0.3s, transform 0.3s; 
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    " 
    onmouseover="this.style.backgroundColor='#45a049'; this.style.transform='scale(1.05)';" 
    onmouseout="this.style.backgroundColor='#4CAF50'; this.style.transform='scale(1)';"
/>
	

	<%
	} catch (Exception e) {
	out.print(e.getMessage());
	} finally {
	if (connection != null) {
		try {
			connection.close();
		} catch (Exception ignore) {
		}
	}
	}
	%>

	<!-- Query Creation Form -->
	<!-- <h2>Create New Query</h2>
	<form action="queryCreateServlet" method="post">
		<div>
			<label for="queryText">Query Text:</label>
			<textarea id="queryText" name="queryText" rows="4" required></textarea>
		</div>
		<div>
			<label for="customerName">Customer Name:</label> <input type="text"
				id="customerName" name="customerName" required>
		</div>
		<div>
			<label for="customerEmail">Customer Email:</label> <input
				type="email" id="customerEmail" name="customerEmail" required>
		</div>
		<div>
			<label for="restaurantId">Restaurant ID:</label> <input type="number"
				id="restaurantId" name="restaurantId" required>
		</div>
		<div>
			<input type="submit" value="Create Query">
		</div>
	</form> -->

</body>
</html>
