<%@page import="com.kennedy.onlinefeepaymentsystem.utils.JDBCUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 
 <%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>	
	

	<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

	if (session.getAttribute("AUTH") == null) {
	response.sendRedirect("AdminLogin.jsp");
}
%>
	
	
<!DOCTYPE html>

<html>
<head>
<meta charset='utf-8'>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Umma University Online Fee Payment System</title>
<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/transactions.css">
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
			<h3 style="font-size: bold;">
				FeedBacks

				

			</h3>
			


			<hr>


		</div>
		<table id="example" class="table table-striped table-bordered"
			style="width: 100%">
			
				<tr>
				
					<th>Name</th>
					<th>Email</th>
					<th>Comment</th>
					
				</tr>
				
				<%
				
				try{
				Connection conn = JDBCUtils.getConnetion();	
				PreparedStatement pst=conn.prepareStatement("select * from feedback");
				ResultSet rs = pst.executeQuery();
				
				while(rs.next()){
					%>
					
					<tr>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("email") %></td>
					<td><%=rs.getString("comment") %></td>
				</tr>
				
					<% 
				}
					
				}catch(Exception ex){
					out.println("Exception:"+ex.getMessage());
					ex.printStackTrace();
				}
				
				
				
				
				%>
				
				
				
		</table>
		
	</div>
	
<script type="text/javascript" src="src/jquery-3.3.1.slim.min.js"></script>

<script type="text/javascript" src="js/jspdf.min.js"></script>

<script type="text/javascript" src="js/jspdf.plugin.autotable.min.js"></script>

<script type="text/javascript" src="js/tableHTMLExport.js"></script>

<script type="text/javascript">
  
  $("#json").on("click",function(){
    $("#example").tableHTMLExport({
      type:'json',
      filename:'sample.json'
    });
  });

  $("#pdf").on("click",function(){
    $("#example").tableHTMLExport({
      type:'pdf',
      filename:'sample.pdf'
    });
  });

  $("#csv").on("click",function(){
    $("#example").tableHTMLExport({
      type:'csv',
      filename:'sample.csv'
    });
  });

</script>
	
</body>
</html>