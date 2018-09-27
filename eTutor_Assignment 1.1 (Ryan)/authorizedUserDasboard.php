<?php 
//$username = $_SESSION["username"];

?>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>eTutor</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	

    <!-- Custom styles for this template -->
    <link href="css/custom.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/sideNav.css"/>
	<link rel="stylesheet" type="text/css" href="css/table.css"/>
	
	</head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navcolor">
      <div class="container">
        <a href="#" class="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
			 <li class="nav-item">
              <a class="nav-link" href="#">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header with Background Image -->
    <header class="business-header">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <!--<h1 class="display-3 text-center text-white mt-4">Business Name or Tagline</h1>-->
          </div>
        </div>
      </div>
    </header>

    <!-- Page Content -->
	
    <div class="container">
	<meta name="viewport" content="width=device-width, initial-scale=1">


      <div class="row">
	  
         <div class="col-lg-12">
		 
		 <!--Breadcrumb Links-->
		 <div>
		    <a class="BreadEff" href="index.php">Home &raquo; </a>
			<a class="BreadEff" href="#"> Login</a>
	    </div>
	  
		<h1>Administrator Dashboard</h1>
		<br/>
	  
	  <br/>
	  </div>
	  
	  <div class="row">
	<div class="col-lg-3">
	<div class="fluid-container">
	 <table class="table">
	 <tbody>
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
		
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
		
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
		
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
		
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
		
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
		
		<tr>
			<td>Lorum Ipsum</td>
		</tr>
	 </tbody>
	 </table>
	</div>
	</div>
		
	<div class="col-lg-9">	
	<div class="container">
	<center>
		<ul><a>Student Home Page - Welcome <!--*insert php code*--> </a></ul>
		<br />
		
		<label>Student/Tutor: </label>
			<select name="student/tutor">
				<option value="">---Select Student/Tutor---</option>
				<option value="Personal Tutor">Student</option>
				<option value="Tutor">Personal Tutor</option>
			</select>
	</center>
	</div>
		
	<div class="container">
	<center>
		<p> List of Students or Personal Tutors </p>
	<table>
	  <tr>
		<th>Student/Tutor ID</th>
		<th>Studnet/Tutor First Name</th>
		<th>Student/Tutor Last Name</th>
		<th>View More Details</th>
	  </tr>
	 <!--php goes here-->
	  <tr>
		<th>23621</th>
		<th>Shivan</th>
		<th>Persad</th>
		<th>View More Details</th>
	<!--php goes here-->
	  </tr>
	</table>
	</center>
	</div>
	   
      
      <!-- /.row -->

     
      </div>
	  </div>
      <!-- /.row -->
	</div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-4 bg-dark col-lg-12">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; eTutor 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="bootstrap/jquery/jquery.min.js"></script>
    <script src="bootstrap/bootstrap/js/bootstrap.bundle.min.js"></script>
	

  </body>

</html>
