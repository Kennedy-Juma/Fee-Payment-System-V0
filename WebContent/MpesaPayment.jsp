<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

	if (session.getAttribute("AUTH") == null) {
	response.sendRedirect("login.jsp");
}
%>



<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Umma University Online Fee Payment System</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="css/paymentnavbar.css" rel='stylesheet'>
<script type='text/javascript'>
	var currentTab = 0;
	document.addEventListener("DOMContentLoaded", function(event) {

		showTab(currentTab);

	});

	function showTab(n) {
		var x = document.getElementsByClassName("tab");
		x[n].style.display = "block";
		if (n == 0) {
			document.getElementById("prevBtn").style.display = "none";
		} else {
			document.getElementById("prevBtn").style.display = "inline";
		}
		if (n == (x.length - 1)) {
			document.getElementById("nextBtn").innerHTML = "Submit";
		} else {
			document.getElementById("nextBtn").innerHTML = "Next";
		}
		fixStepIndicator(n)
	}

	function nextPrev(n) {
		var x = document.getElementsByClassName("tab");
		if (n == 1 && !validateForm())
			return false;
		x[currentTab].style.display = "none";
		currentTab = currentTab + n;
		if (currentTab >= x.length) {
			// document.getElementById("regForm").submit();
			// return false;
			//alert("sdf");
			document.getElementById("nextprevious").style.display = "none";
			document.getElementById("all-steps").style.display = "none";
			document.getElementById("register").style.display = "none";
			document.getElementById("text-message").style.display = "block";

		}
		showTab(currentTab);
	}

	function validateForm() {
		var x, y, i, valid = true;
		x = document.getElementsByClassName("tab");
		y = x[currentTab].getElementsByTagName("input");
		for (i = 0; i < y.length; i++) {
			if (y[i].value == "") {
				y[i].className += " invalid";
				valid = false;
			}
		}
		if (valid) {
			document.getElementsByClassName("step")[currentTab].className += " finish";
		}
		return valid;
	}
	function fixStepIndicator(n) {
		var i, x = document.getElementsByClassName("step");
		for (i = 0; i < x.length; i++) {
			x[i].className = x[i].className.replace(" active", "");
		}
		x[n].className += " active";
	}
</script>
</head>
<body oncontextmenu='return false' class='snippet-body'>

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
				<li class="nav-item active"><a class="nav-link" href="studentdashboard.jsp">Home</a></li>
				<li class="nav-item active"><a class="nav-link" href="CardPayment.jsp">Pay With Card</a></li>
				
			</ul>

		</div>
	</nav>
	


	<div class="container mt-5">
		<div class="row d-flex justify-content-center align-items-center">
			<div class="col-md-6">
				<form action="MpesaPayment" method="post" id="regForm">
					<h1 id="register" style="color: green">Make Payments... Start
						Here</h1>
					<div class="all-steps" id="all-steps">
						<span class="step"></span> <span class="step"></span> <span
							class="step"></span> <span class="step"></span>
					</div>
					<div class="tab">
						<p>
							<input placeholder="Payer's Name..."
								oninput="this.className = ''" name="name">
						</p>
						<p>
							<input placeholder="Registration Number..."
								value="<%=session.getAttribute("username")%>"
								oninput="this.className = ''" name="regno">
						</p>
					</div>
					<div class="tab">
						<p>
							<input placeholder="Payer's E-mail..."
								oninput="this.className = ''" name="email">
						</p>
						<p>
							<input placeholder="Phone No(254...)"
								oninput="this.className = ''" name="phone">
						</p>
					</div>
					<div class="tab">
						<p>
							<label for="country">Payment is for:</label> <select
								id="paymentfor" name="paymentfor" class="form-control">
								<option value="tuition">Tuition</option>
								<option value="hostel">Hostel</option>
								<option value="supplementary">Supplementary Exams</option>
								<option value="graduation">Graduation Fees</option>
							</select>
						</p>

						<p>
							<input placeholder="Amount" oninput="this.className = ''"
								name="amount">
						</p>
					</div>
					
						
					
					<div class="thanks-message text-center" id="text-message">
						<img src="images/Mpesa-logo.jpg" width="200" class="mb-4">
						<h3>Please confirm your payment!</h3>
						<span>Note: The amount will be deducted from your Mpesa Account</span>
						
						<button type="submit" class="btn btn-success">Confirm Payment</button>
					</div>
					<div style="overflow: auto;" id="nextprevious">
						<div style="float: right;">
							<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
		<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="bootstrap/js/jquery-3.2.1.slim.min.js"></script>
	<script src="bootstrap/js/popper.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>