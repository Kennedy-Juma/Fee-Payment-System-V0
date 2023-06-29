
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Umma University Online Fee Payment System</title>

<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/contact-us.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<%
  String successMessage = "";
  if(session.getAttribute("NOTIFICATION") !=null){
	  successMessage = (String)session.getAttribute("NOTIFICATION");
	  session.removeAttribute("NOTIFICATION");
	 
  }
  %>

<body>

<%if(successMessage!=""){ %>
			<div class="alert alert-success" role="alert">
				<%=successMessage %>
			</div>
			<%}%>
	

<div class="container">
<div class="contact-section">
<h2 class="ct-section-head">
   CONTACT US
</h2>
<div class="row contact-fields">
<div class="col-md-8 left-form">
   <form action="feedback" method="post">
    
      <div class="form-group">
         <label class="sr-only" for="lname">Full Name *</label>
         <input class="required form-control" id="name" name="name" placeholder="Your Full Name&nbsp;*" type="text">
      </div>
      <div class="form-group">
         <label class="sr-only" for="contactEmail">Email *</label>
         <input class="required form-control h5-email" id="email" name="email" placeholder="Your Email&nbsp;*" type="email">
      </div>
      <div class="form-group">
         <label class="sr-only" for="comment">Type your message here</label>
         <textarea class="required form-control" id="comment" name="comment" placeholder="Type your message here&nbsp;*" rows="6"></textarea>
      </div>
      <button class="btn btn-success" type="submit">Submit</button>  
   </form>
</div>
<div class="col-md-4 contact-info">
<div class="phone">
   <h2>Call</h2>
   <a href="#"> (+254) 777 969022<br> (+254) 739 969 000<br> (+254) 703 969 000</a>
</div>
<div class="email">
   <h2>Email</h2>
   <a href="#">info@umma.ac.ke</a>
</div>
<div class="location">
   <h2>Visit</h2>
   <p style="color:#3b852c">Umma University main campus </br>
      In Kajiado, along Nairobi-Namanga Highway  </br>
      <br>

   </p>
</div>
</body>
