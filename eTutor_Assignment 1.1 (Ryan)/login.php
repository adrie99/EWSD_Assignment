<?php

//global variables
$email="";
$pass="";
$pos="";
$feedback="";
$count=0;
$firstName="";
$lastName="";

//check to see if information was submitted
if(isset($_POST['submit'])){
	//extract form data
		
	$e=$_POST['email'];
	$p=$_POST['password'];
	
	//validate entered user data
	validateData($e, $p);
	
	//sanitize entered data for foreign symbols
	sanitizeData($e);
	sanitizeData($p);
	
	//code to determine landing page based on user role
	//count check used to determine if there are errors
	if($count==0){
	if(authenticate($e, $p)){
		global $pos;
		global $feedback;
		
			if($pos=="1"){
			//do session start here
			session_start();
			$_SESSION['email']=$e;
			$_SESSION['password']=$p;
			$_SESSION['position']=$pos;
			$_SESSION['firstName']=$firstName;
			$_SESSION['lastName']=$lastName;
			
			Header("Location:AdminDummy.php");
		
		}elseif($pos=="2"){
			//do session start here
			session_start();
			$_SESSION['email']=$e;
			$_SESSION['password']=$p;
			$_SESSION['position']=$pos;
			$_SESSION['firstName']=$firstName;
			$_SESSION['lastName']=$lastName;
			
			Header("Location:TutorDummy.php");
			
		}elseif($pos=="3"){
			//do session start here
			session_start();
			$_SESSION['email']=$e;
			$_SESSION['password']=$p;
			$_SESSION['position']=$pos;
			$_SESSION['firstName']=$firstName;
			$_SESSION['lastName']=$lastName;
			
			Header("Location:StudentDummy.php");
		}
		
	}else{
		$feedback.="Invalid Login Credentials";
	}//end of else-if
	}//end of count check

	
}//end of isset

function authenticate($e, $p){
	global $email;
	global $pass;
	global $pos;
	global $firstName;
	global $lastName;
	
	//connect to db
	require('DBConnect.php');
	
	//prepare sql statement
		if ($stmt= mysqli_prepare ($mysqli, 
		"SELECT useraccount.firstName, useraccount.lastName, useraccount.position, useraccount.firstName, useraccount.lastName
		FROM useraccount
		WHERE useraccount.email=?
		AND useraccount.password=?"))
		{
			//bind entered parameters to mysqli statement
			mysqli_stmt_bind_param($stmt, "ss", $e, md5($p));
			
			//execute mysqli statement
			mysqli_stmt_execute($stmt);
			
			//bind result to global variables
			mysqli_stmt_bind_result($stmt, $email, $pass, $pos, $firstName, $lastName);
			
			if (mysqli_stmt_fetch($stmt))
			{
				return true;
			}else{
				return false;
			}//end of mysqli_stmt_fetch
			
		}//end of mysqli prepare
	
}//end of authenticate

function sanitizeData($val){
	$val= filter_var($val, FILTER_SANITIZE_STRING);
		
		//sanitize data going into MySQL
		$val= mysqli_real_escape_string($val);
		
		return $val;
}//end of sanitizeData

function validateData($e, $p){
	global $feedback;
	global $count;
	
	//firstname validation
		if($e=="" || $e==null){
			$feedback.= "<br/> Email Required"; 
			$count++;
		}
		
		if($p=="" || $p==null){
			$feedback.= "<br/> Password Required"; 
			$count++;
		}
		
		if($p>1 && $p<=6){
			$feedback.="<br/> Password must be more than 6 characters";
			$count++;
		}
}//end of validate


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

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top navcolor">
      <div class="container">
        <a href="index.php" class="logo"></a>
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
	<br/>
      <div class="row">
	  <div class="col-sm-12">
	  
		<h1>Login</h1>
	  <br/>
	  
	  <?php 
	 
	         if($feedback != ""){
		 
		     echo "<div class= 'alert alert-info'>"; 
		       if ($count == 1) echo "<strong>$count error found.</strong>";
			   if ($count > 1) echo "<strong>$count errors found.</strong>";
		     echo "$feedback
			   </div>";
			}
	 
	 ?>
	  
		<!--Breadcrumb Links-->
		 <div>
		    <a class="BreadEff" href="index.php">Home &raquo; </a>
			<a class="BreadEff" href="#"> Login</a>
	    </div>

	  <br/>
	  </div>
	  
	  <!--Your Content Goes Here-->
	  <div class="col-sm-6">
	  
        <form class="form-horizontal" method="post" action="login.php">
		
		<div class="form-group"> 
			<label class="control-label col-sm-2">Email:</label>
		 <div class="col-sm-10">
			<input type="email" class="form-control" name="email"/> 
		 </div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">Password:</label>
		 <div class="col-sm-10">
			<input type="password" class="form-control" name="password"/> 
		 </div>
		</div>
					
		 <input type="submit" class="btn btn-primary form-control" name="submit"/>
		</form>
     </div>
	
	<div class="col-sm-6 verticalLine loginpadding">
	
	<br>
	
	<p>For any Problems logging in or Technical Issues, </p>
	<p>Contact an eTutor Admin via email: support@gmail.com</p>
	
	</div>
	  
        

    </div>
	<br/>
	<br/>
	<br/>
	<br/>
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
