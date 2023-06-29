

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
<link rel="stylesheet" href="css/login.css">

<title>Umma University Online Fee Payment System</title>
</head>


<!-- Scriplet for checking if the user already exists in database -->
<%
String errorMessage = "";
if (session.getAttribute("ERROR") != null) {
	errorMessage = (String) session.getAttribute("ERROR");
	session.removeAttribute("ERROR");
}
%>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<a class="navbar-brand" href="#"><img src="images/umalogo.png"
			class="img-fluid w-25"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home</a></li>

				<li class="nav-item active"><a class="nav-link" href="about-system.jsp">About</a></li>

				<li class="nav-item active"><a class="nav-link" href="contact-us.jsp">Contact
						Us</a></li>
			</ul>

		</div>
	</nav>

	<h4 align="center">
		<b>Umma University Online Fee Payment System-UUOFPS</b>
	</h4>

	<div class="login-form">
		<form action="Studentlogin" method="post">
			<h2 class="text-center">Log in</h2>
			<div class="form-group">
				<input type="text" class="form-control"
					placeholder="Student Registration Number" name="username"
					required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="Password"
					name="password" required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">Log
					in</button>
			</div>
			
			<%
			if (errorMessage != "") {
			%>
			<div class="alert alert-danger" role="alert">
				<%=errorMessage%>
			</div>
			<%
			}
			%>
		</form>
		<p class="text-center">
			<a href="register.jsp">Create an Account</a>
		</p>
	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="bootstrap/js/jquery-3.2.1.slim.min.js"></script>
	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>