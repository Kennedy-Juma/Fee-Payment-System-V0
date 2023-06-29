<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/register.css">
<title>Umma University Online Fee Payment System</title>

</head>



<!-- Scriplet for checking for notifuing if the user is successfully registered -->
<%
  String successMessage = "";
  if(session.getAttribute("NOTIFICATION") !=null){
	  successMessage = (String)session.getAttribute("NOTIFICATION");
	  session.removeAttribute("NOTIFICATION");
	 
  }
  %>
  
  <%
  String warningMessage = "";
  if(session.getAttribute("WARNING") !=null){
	  warningMessage = (String)session.getAttribute("WARNING");
	  session.removeAttribute("WARNING");
  }
  %>


<!-- Scriplet for checking if the user already exists in database -->
<%
  String errorMessage = "";
  if(session.getAttribute("ERROR") !=null){
	  errorMessage = (String)session.getAttribute("ERROR");
	  session.removeAttribute("ERROR");
  }
  %>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<a class="navbar-brand" href="#"><img src="images/umalogo.png"
			class="img-fluid w-25" alt=""></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-tem active"><a class="nav-link" href="index.jsp">Home</a></li>
				<li class="nav-item active"><a class="nav-link" href="login.jsp">Pay Fees</a></li>

				<li class="nav-item active"><a class="nav-link" href="about-system">About</a></li>

				<li class="nav-item active"><a class="nav-link" href="contact-us.jsp">Contact Us</a></li>
			</ul>

		</div>
	</nav>

	<h4 align="center">
		<b>Umma University Online Fee Payment System-UUOFPS</b>
	</h4>
	
	<%if(warningMessage!=""){ %>
			<div class="alert alert-danger" role="alert">
				<%=warningMessage %>
			</div>
			<%}%>



	<div class="signup-form">
		<form action="Register" method="post" name="registerform">

			<%if(successMessage!=""){ %>
			<div class="alert alert-success" role="alert">
				<%=successMessage %>
			</div>
			<%}%>

			<h2>Register</h2>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" class="form-control" name="firstname"
							placeholder="First Name" required="required">
					</div>
					<div class="col">
						<input type="text" class="form-control" name="lastname"
							placeholder="Last Name" required="required" >
					</div>
					
				</div>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="regno"
					placeholder="Reg No e.g BSCS/2017/42134 " required="required">
			</div>
			
			<div class="form-group">
				<input type="password" class="form-control" name="password"
					placeholder="Enter a Strong Password" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="confirm_password"
					placeholder="Confirm Password" required="required">
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-success btn-block" >Register
					Now</button>
			</div>

			<%if(errorMessage!=""){ %>
			<div class="alert alert-danger" role="alert">
				<%=errorMessage %>
			</div>
			<%}%>

			<div class="text-center">
				<b>Already have an account?</b>
				<a href="login.jsp"><b>Sign in</b></a>
			</div>

		</form>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="bootstrap/js/jquery-3.2.1.slim.min.js"
		type="text/javascript"></script>
	<script src="bootstrap/js/popper.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>