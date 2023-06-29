
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("AUTH")==null){
	response.sendRedirect("index.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Umma University Online Fee Payment System</title>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>


<%
  String successMessage = "";
  if(session.getAttribute("msg") !=null){
	  successMessage = (String)session.getAttribute("msg");
	  session.removeAttribute("msg");
	 
  }
  %>
  
  <%
  String warningMessage = "";
  if(session.getAttribute("error") !=null){
	  warningMessage = (String)session.getAttribute("error");
	  session.removeAttribute("error");
  }
  %>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<a class="navbar-brand" href="#"><img src="images/umalogo.png"
			class="img-fluid w-25"> Welcome <%=session.getAttribute("username")%>!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="admindashboard.jsp">Home</a></li>
			<li class="nav-item active"><a class="nav-link" href="PaymentSearch.jsp">Search Payments</a></li>
			<li class="nav-item active"><a class="nav-link" href="admin-change-password.jsp">Change Password</a></li>
			<li class="nav-item active"><a class="nav-link" href="logout.jsp">Log Out</a></li>
				
			</ul>

		</div>
	</nav>


    <%if(successMessage!=""){ %>
        <div class="alert alert-success" role="alert">
            <%=successMessage %>
        </div>
        <%}%>
        
<%if(warningMessage!=""){ %>
        <div class="alert alert-danger" role="alert">
            <%=warningMessage %>
        </div>
        <%}%>

    <div class="content-wrapper">
        <div class="container-fluid">
          <div class="row">
    
          <!-- Icon Cards-->
            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-2 mt-4">
                <div class="inforide">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-4 rideone">
                        <img src="images/feedback-icon.png" alt="">
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-8 col-8 fontsty">
                        <h4><a href="Feedback.jsp">View Feedback</a></a></h4>
                        </div>
                  </div>
                </div>
            </div>
    
            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-2 mt-4">
                <div class="inforide">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-4 ridetwo">
                        <img src="images/credit_cards.png" alt="">
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-8 col-8 fontsty">
                        <h4><a href="https://dashboard.stripe.com/test/payments?status%5B%5D=successful" target="_blank">Payment Logs</a></a></h4>
                    </div>
                  </div>
                </div>
            </div>
    
            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-2 mt-4">
                <div class="inforide">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-4 ridethree">
                       <img src="images/more.jpg" alt="">
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-8 col-8 fontsty">
                        <h4><a href="https://umma.ifnoss.net/login.aspx" target="_blank">More Payments</a></a></h4>
                    </div>
                  </div>
                </div>
            </div>
    
        </div>
      </div>
    </div>
    
    
    </body>
    </html>

    <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="bootstrap/js/jquery-3.2.1.slim.min.js"></script>
        <script src="bootstrap/js/popper.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    


