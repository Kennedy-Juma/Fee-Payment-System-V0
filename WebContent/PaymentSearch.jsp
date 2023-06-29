<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils"%>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

	if (session.getAttribute("AUTH") == null) {
	response.sendRedirect("AdminLogin.jsp");
}
%>


<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Umma University Online Fee Payment System</title>
<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='' rel='stylesheet'>
<style></style>
<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script type='text/javascript'
	src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js'></script>
<script type='text/javascript'>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>
<body oncontextmenu='return false' class='snippet-body'>
	<link rel="stylesheet"
		href="https://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
	<div class="container">
		<div class="row header" style="text-align: center; color: green">
			<h3>Payment Search Results</h3>
		</div>
		<table id="example" class="table table-striped table-bordered"
			style="width: 100%">
			<thead>
				<tr>

					<th>Payer Name</th>
					<th>Paid For</th>
					<th>Contact No</th>
					<th>Date Paid</th>
					<th>Ref No</th>
					<th>Amount</th>
					<th>Purpose</th>
				</tr>
			</thead>
			<tbody>

				<%
				try {
					Connection conn = JDBCUtils.getConnetion();
					PreparedStatement pst = conn.prepareStatement("select * from payment");
					ResultSet rs = pst.executeQuery();

					while (rs.next()) {
				%>

				<tr>
					<td><%=rs.getString("payerName")%></td>
					<td><%=rs.getString("RegNo")%></td>
					<td><%=rs.getInt("phone")%></td>
					<td><%=rs.getDate("DatePaid")%></td>
					<td><%=rs.getString("referenceNo")%></td>
					<td><%=rs.getDouble("Amount")%></td>
					<td><%=rs.getString("Purpose")%></td>
				</tr>

				<%
				}

				} catch (Exception ex) {
				out.println("Exception:" + ex.getMessage());
				ex.printStackTrace();
				}
				%>
			</tbody>
			<tfoot>
				<tr>

					<th>Payer Name</th>
					<th>Paid For</th>
					<th>Contact No</th>
					<th>Date Paid</th>
					<th>Ref No</th>
					<th>Amount</th>
					<th>Purpose</th>
				</tr>
			</tfoot>
		</table>
	</div>
	
	
</body>
</html>