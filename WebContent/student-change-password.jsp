<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Umma University Online Fee Payment System</title>
	<link rel="stylesheet" type="text/css" media="screen" href="css/screen.css" />
	
</head>

<!-- Scriplet for checking for notifuing if the password is successfully changed -->
<%
  String successMessage = "";
  if(session.getAttribute("NOTIFICATION") !=null){
	  successMessage = (String)session.getAttribute("NOTIFICATION");
	  session.removeAttribute("NOTIFICATION");
	 
  }
  %>


<body id="change-password">


		
	<!-- Container -->	
	<div id="container"><div id="container-inner">

		<h1>Change Password</h1>
		<form action="StudentChangePassword" method="post">
		
		<%if(successMessage!=""){ %>
			<div class="alert alert-success" role="alert">
				<%=successMessage %>
			</div>
			<%}%>
		
			<fieldset>
				<!-- Current -->
				<div>
					<label for="current">Current password</label>
				  <input type="password" name="current" value="" id="current" />
				</div>
				
				<!-- New -->
				<div>
					<label for="new">New password</label>
				  <input type="password" name="new" value="" id="new" />
				</div>
				
				<!-- Confirm -->
				<div>
					<label for="confirm">Confirm password</label>
				  <input type="password" name="confirm" value="" id="confirm" />
				</div>
				
				
				<!-- Controls -->
				<div class="controls">
					<input id="submit" name="submit" type="submit" value="Change password" />
				</div>
			</fieldset>
		</form>
			
	</div></div>	<!-- /Container -->
	
</body>
</html>
